import 'package:flutter/material.dart';
import 'package:iCOOK/components/recipeWidgets/recipe_image.dart';
import 'package:iCOOK/components/recipeWidgets/recipe_title.dart';
import 'package:iCOOK/models/recipe.dart';
import 'package:iCOOK/models/recipe_detail.dart';

class BroccoliScan extends StatelessWidget {
  final Recipe recipe;

  BroccoliScan({
    @required this.recipe,
  });
  @override
  Widget build(BuildContext context) {
    if (recipe.mainitem == 'Broccoli') {
      return GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => new RecipeDetailScreen(recipe),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // We overlap the image and the button by
                // creating a Stack object:
                Stack(
                  children: <Widget>[
                    RecipeImage(recipe.imageURL),
                  ],
                ),
                RecipeTitle(recipe, 15),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
