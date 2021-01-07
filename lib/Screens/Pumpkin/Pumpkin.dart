import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iCOOK/Screens/Pumpkin/pumpkin_scan.dart';
import 'package:iCOOK/components/bottomnavi.dart';
import 'package:iCOOK/models/recipe.dart';
import 'package:iCOOK/models/user.dart';
import 'package:provider/provider.dart';

class Pumpkin extends StatefulWidget {
  @override
  _PumpkinState createState() => _PumpkinState();
}

class _PumpkinState extends State<Pumpkin> {
  int i = 0;
  bool fish = true;
  bool apple = true;
  bool orange = true;
  bool grape = true;
  bool carrot = true;
  bool broccoli = true;
  bool mushroom = true;
  bool strawberry = true;
  bool tomato = true;
  bool bellpepper = true;
  bool pumpkin = true;
  List<String> favorites = [];
  var user;
  bool loading = false;

  @override
  void initState() {
    setState(() {
      loading = true;
    });
    super.initState();
  }

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
                if (!snapshot.hasData)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                return new ListView(
                  children: snapshot.data.documents
                      // Check if the argument ids contains document ID if ids has been passed:
                      .where((d) => ids == null || ids.contains(d.documentID))
                      .map((document) {
                    return new PumpkinScan(
                      recipe:
                          Recipe.fromMap(document.data, document.documentID),
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

  @override
  Widget build(BuildContext context) {
    user = Provider.of<User>(context);

    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.grey[600]),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return BottomNavi1();
                },
              ),
            );
          },
        ),
        title: Text(
          'Pumpkin',
          style: GoogleFonts.specialElite(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Divider(
                color: Colors.red[300],
                thickness: 5,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'Choose food you\'d like to cook',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: _buildRecipes(recipeType: RecipeType.food),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
