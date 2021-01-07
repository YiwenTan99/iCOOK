import 'package:duration/duration.dart';

enum RecipeType {
  food,
}

class Recipe {
  final String id;
  final RecipeType type;
  final String name;
  final String category;
  final Duration duration;
  final List<String> ingredients;
  final List<String> preparation;
  final String imageURL;
  final String mainitem;

  const Recipe(
      {this.id,
      this.type,
      this.name,
      this.category,
      this.duration,
      this.ingredients,
      this.preparation,
      this.imageURL,
      this.mainitem});

  Recipe.fromMap(Map<String, dynamic> data, String id)
      : this(
          id: id,
          name: data['name'],
          duration: Duration(minutes: data['duration']),
          ingredients: new List<String>.from(data['ingredients']),
          preparation: new List<String>.from(data['preparation']),
          imageURL: data['image'],
          mainitem: data['main item'],
        );
}
