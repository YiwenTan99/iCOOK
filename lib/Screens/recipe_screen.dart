import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipesScreen extends StatefulWidget {
  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: new Center(
        child: new Text("Recipe page")
      )
    );
  }
}