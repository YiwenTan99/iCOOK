import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iCOOK/Screens/scan_screen.dart';
import 'package:iCOOK/components/recipeWidgets/recipe_card.dart';
import 'package:iCOOK/models/recipe.dart';
import 'package:iCOOK/models/state.dart';
import 'package:iCOOK/models/user.dart';

import 'package:iCOOK/utils/store.dart';
import 'package:provider/provider.dart';

class RecipesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RecipesScreenState();
}

class RecipesScreenState extends State<RecipesScreen> {
  // StateModel appState;
  List<String> favorites = [];
  var user;
  bool loading = false;

  DefaultTabController _buildTabView({Widget body}) {
    const double _iconSize = 20.0;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Text(
            'iCOOK - Recipes',
            style: GoogleFonts.specialElite(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          bottom: TabBar(
            unselectedLabelColor: Colors.red[100],
            indicatorColor: Colors.redAccent,
            labelColor: Colors.redAccent,
            tabs: [
              Tab(icon: Icon(Icons.restaurant, size: _iconSize)),
              Tab(icon: Icon(Icons.favorite, size: _iconSize)),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(5.0),
          child: body,
        ),
      ),
    );
  }

  Widget _buildContent() {
    return _buildTabView(
      body: _buildTabsContent(),
    );
    // if (appState.isLoading) {
    //   return _buildTabView(
    //     body: _buildLoadingIndicator(),
    //   );
    // } else if (!appState.isLoading && appState.user == null) {
    //   return ScanScreen();
    // } else {
    //   return _buildTabView(
    //     body: _buildTabsContent(),
    //   );
    // }
  }

  Center _buildLoadingIndicator() {
    return Center(
      child: new CircularProgressIndicator(),
    );
  }

  /*TabBarView _buildTabsContent() {
    Padding _buildRecipes({RecipeType recipeType, List<String> ids}) {
      CollectionReference collectionReference =
          Firestore.instance.collection('recipe');
      Stream<QuerySnapshot> stream;
      // The argument recipeType is set
      if (recipeType != null) {
        stream = collectionReference.snapshots();
      } else {
        // Use snapshots of all recipes if recipeType has not been passed
        stream = collectionReference.snapshots();
      }
      // Define query depeneding on passed args
      return Padding(
        // Padding before and after the list view:
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: new StreamBuilder(
                stream: stream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  Future.delayed(const Duration(seconds: 4), () {
                    return _buildLoadingIndicator();
                  });
                  if (!snapshot.hasData)
                    return _buildLoadingIndicator();
                  else {
                    return new ListView(
                      children: snapshot.data.documents
                          // Check if the argument ids contains document ID if ids has been passed:
                          .where(
                              (d) => ids == null || ids.contains(d.documentID))
                          .map((document) {
                        if (document.documentID != null) {
                          return new RecipeCard(
                            recipe: Recipe.fromMap(
                                document.data, int.parse(document.documentID)),
                            // inFavorites: favorites.contains(document.documentID),
                            onFavoriteButtonPressed:
                                _handleFavoritesListChanged,
                          );
                        } else {
                          return _buildLoadingIndicator();
                        }
                      }).toList(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      );
    }*/

  TabBarView _buildTabsContent() {
    // amik sini
    Padding _buildRecipes({RecipeType recipeType, List<String> ids}) {
      CollectionReference collectionReference =
          Firestore.instance.collection('recipe');
      Stream<QuerySnapshot> stream;
      // The argument recipeType is set
      if (recipeType != null) {
        stream = collectionReference
            .where("type", isEqualTo: recipeType.index)
            .snapshots();
      } else {
        // Use snapshots of all recipes if recipeType has not been passed
        stream = collectionReference.snapshots();
      }

      // Define query depeneding on passed args
      return Padding(
        // Padding before and after the list view:
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: new StreamBuilder(
                stream: stream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return _buildLoadingIndicator();
                  return new ListView(
                    children: snapshot.data.documents
                        // Check if the argument ids contains document ID if ids has been passed:
                        .where((d) => ids == null || ids.contains(d.documentID))
                        .map((document) {
                      return new RecipeCard(
                        recipe:
                            Recipe.fromMap(document.data, document.documentID),
                        inFavorites: favorites.contains(document.documentID),
                        onFavoriteButtonPressed: _handleFavoritesListChanged,
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }

    return TabBarView(
      children: [
        _buildRecipes(recipeType: RecipeType.food),
        _buildRecipes(ids: favorites),
        //Center(child: Icon(Icons.settings)),
      ],
    );
  }

  // Inactive widgets are going to call this method to
  // signalize the parent widget HomeScreen to refresh the list view:
  void _handleFavoritesListChanged(String recipeID) {
    updateFavorites(user.uid, recipeID).then((result) {
      // Update the state:
      print(favorites);
      setState(() {
        if (!favorites.contains(recipeID))
          favorites.add(recipeID);
        else
          favorites.remove(recipeID);
      });
      // if (result == true) {
      //   setState(() {
      //     if (!favorites.contains(recipeID))
      //       favorites.add(recipeID);
      //     else
      //       favorites.remove(recipeID);
      //   });
      // }
    });
  }

  @override
  void initState() {
    setState(() {
      loading = true;
    });
    super.initState();
  }

  Future<List<String>> getFavorites() async {
    DocumentSnapshot querySnapshot =
        await Firestore.instance.collection('recipe').document(user.uid).get();
    if (querySnapshot.exists &&
        querySnapshot.data.containsKey('favorites') &&
        querySnapshot.data['favorites'] is List) {
      // Create a new List<String> from List<dynamic>
      return List<String>.from(querySnapshot.data['favorites']);
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    // Build the content depending on the state:
    //appState = StateWidget.of(context).state;
    user = Provider.of<User>(context);
    return _buildContent();
  }
}
