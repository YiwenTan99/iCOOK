import 'package:duration/duration.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum RecipeType {
  food,
}

class Recipe {
  final int id;
  final String name;
  final String category;
  final String duration;
  final List<String> ingredients;
  final List<String> preparation;
  final String imageURL;

  const Recipe({
    this.id,
    this.name,
    this.category,
    this.duration,
    this.ingredients,
    this.preparation,
    this.imageURL,
  });

  //String get getDurationString => prettyDuration(this.duration);
  Recipe.fromMap(Map<String, dynamic> data, int id)
      : this(
          id: id,
          name: data['name'] == null ? "" : data['name'],
          category: data['category'] == null ? "" : data['category'],
          duration: data['duration'] == null ? "" : data['duration'].toString(),
          ingredients: List<String>.from(data['ingredients']) == null
              ? []
              : List<String>.from(data['ingredients']),
          preparation: List<String>.from(data['preparation']) == null
              ? []
              : List<String>.from(data['preparation']),
          imageURL: data['image'] == null ? null : data['image'],
        );
}
