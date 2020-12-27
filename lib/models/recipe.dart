import 'package:duration/duration.dart';


class Recipe {
  final String id;
  final String name;
  final Duration duration;
  final List<String> ingredients;
  final List<String> preparation;
  final String imageURL;

  const Recipe({
    this.id,
    this.name,
    this.duration,
    this.ingredients,
    this.preparation,
    this.imageURL,
  });

  String get getDurationString => prettyDuration(this.duration);

  Recipe.fromMap(Map<String, dynamic> data, String id)
      : this(
          id: id,
          name: data['name'],
          duration: Duration(minutes: data['duration']),
          ingredients: new List<String>.from(data['ingredients']),
          preparation: new List<String>.from(data['preparation']),
          imageURL: data['image'],
        );
}
