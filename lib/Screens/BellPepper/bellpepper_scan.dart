import 'package:flutter/material.dart';
import 'package:iCOOK/Screens/detail.dart';
import 'package:iCOOK/components/recipeWidgets/recipe_image.dart';
import 'package:iCOOK/components/recipeWidgets/recipe_title.dart';
import 'package:iCOOK/models/recipe.dart';

class BellPepperScan extends StatelessWidget {
  final Recipe recipe;
  final bool inFavorites;
  final Function onFavoriteButtonPressed;

  BellPepperScan(
      {@required this.recipe,
      @required this.inFavorites,
      this.onFavoriteButtonPressed});
  @override
  Widget build(BuildContext context) {
    if (recipe.mainitem == 'BellPepper') {
      return GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => new DetailScreen(recipe, inFavorites),
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
                    Positioned(
                      child: RawMaterialButton(
                        constraints: const BoxConstraints(
                            minWidth: 40.0, minHeight: 40.0),
                        onPressed: () => onFavoriteButtonPressed(recipe.id),
                        child: Icon(
                          // Conditional expression:
                          // show "favorite" icon or "favorite border" icon depending on widget.inFavorites:
                          inFavorites == true
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        elevation: 2.0,
                        fillColor: Theme.of(context).buttonColor,
                        shape: CircleBorder(),
                      ),
                      top: 2.0,
                      right: 2.0,
                    ),
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
