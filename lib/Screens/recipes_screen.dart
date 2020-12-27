import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iCOOK/components/recipeWidgets/recipe_card.dart';
import 'package:iCOOK/models/recipe.dart';
import 'package:iCOOK/utils/store.dart';

class RecipesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RecipesScreenState();
}

class RecipesScreenState extends State<RecipesScreen> {
  // New member of the class:
  List<Recipe> recipes = getRecipes();
  List<String> userFavorites = getFavoritesIDs();

  // New method:
  // Inactive widgets are going to call this method to
  // signalize the parent widget RecipesScreen to refresh the list view.
  void _handleFavoritesListChanged(String recipeID) {
    // Set new state and refresh the widget:
    setState(() {
      if (userFavorites.contains(recipeID)) {
        userFavorites.remove(recipeID);
      } else {
        userFavorites.add(recipeID);
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // New method:
    Padding _buildRecipes(List<Recipe> recipesList) { // New code
      return Padding( // New code
          // Padding before and after the list view:
          padding: const EdgeInsets.symmetric(vertical: 5.0), // New code
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: recipesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new RecipeCard(
                      recipe: recipesList[index],
                      inFavorites:
                          userFavorites.contains(recipesList[index].id),
                      onFavoriteButtonPressed: _handleFavoritesListChanged,
                    );
                  },
                ),
              ),
            ],
          ),
        ); // New code
    }

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
          child: TabBarView(
            // Replace placeholders:
            children: [
              // Display recipes of type fish:
              _buildRecipes(recipes
                  .toList()),
              // Display favorite recipes:
              _buildRecipes(recipes
                  .where((recipe) => userFavorites.contains(recipe.id))
                  .toList()),
            ],
          ),
        ),
      ),
    );
  }
}