import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iCOOK/models/recipe.dart';

class RecipeTitle extends StatelessWidget {
  final Recipe recipe;
  final double padding;

  RecipeTitle(this.recipe, this.padding);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        // Default value for crossAxisAlignment is CrossAxisAlignment.center.
        // We want to align title and description of recipes left:
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            recipe.name == null ? "" : recipe.name,
            // ignore: deprecated_member_use
            style: GoogleFonts.robotoSlab(
              fontSize: 20,
              color: Color(0xFF807A6B),
            ), 
          ),
          // Empty space:
          SizedBox(height: 10.0),
          Row(
            children: [
              Icon(Icons.timer, size: 20.0, color: Color(0xFFCCC5AF)),
              SizedBox(width: 5.0),
              Text(
                recipe.getDurationString,
                style: TextStyle(
                  color: Color(0xFFCCC5AF),
                ),  
              ),
            ],
          ),
        ],
      ),
    );
  }
}
