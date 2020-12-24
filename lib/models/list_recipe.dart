class RecipeItem {
  final String title;
  final String category;
  RecipeItem({
    this.title,
    this.category,
  });
}

List<RecipeItem> loadRecipeItem() {
  var ri = <RecipeItem>[
    RecipeItem(
      title: "Pizza",
      category: "Tomato",
    ),
    RecipeItem(
      title: "Garlic Butter Fish",
      category: "Fish",
    ),
    RecipeItem(
      title: "Chicken Rice",
      category: "Chicken",
    ),
    RecipeItem(
      title: "Rendang Ayam",
      category: "Chicken",
    ),
    RecipeItem(
      title: "Asam Pedas",
      category: "Fish",
    ),
  ];
  return ri;
}
