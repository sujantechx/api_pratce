/*
class RecipesModel{
  int id;
  String name;
  List<String> ingredients;
  List<String> instructions;
  int prepTimeMinutes;
  int cookTimeMinutes;
  int servings;
  String difficulty;
  String cuisine;
  int caloriesPerServing;
  List<String> tags;
  int userId;
  String image;
  int rating;
  int reviewCount;
  List<String> mealType;

  RecipesModel({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.cuisine,
    required this.caloriesPerServing,
    required this.tags,
    required this.userId,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.mealType,
});
  factory RecipesModel.fromJson(Map<String,dynamic> json){
    return RecipesModel(
      id: json['id'],
      name: json['name'],
      ingredients: List<String>.from(json['ingredients']),
      instructions: List<String>.from(json['instructions']),
      prepTimeMinutes: json['prepTimeMinutes'],
      cookTimeMinutes: json['cookTimeMinutes'],
      servings: json['servings'],
      difficulty: json['difficulty'],
      cuisine: json['cuisine'],
      caloriesPerServing: json['caloriesPerServing'],
      tags: List<String>.from(json['tags']),
      userId: json['userId'],
      image: json['image'],
      rating: json['rating'].toDouble(),
      reviewCount: json['reviewCount'],
      mealType: List<String>.from(json['mealType']),    );
  }
}
*/
class RecipeModel {
  int id;
  String name;
  List<String> ingredients;
  List<String> instructions;
  double prepTimeMinutes;
  double cookTimeMinutes;
  double servings;
  String difficulty;
  String cuisine;
  double caloriesPerServing;
  List<String> tags;
  int userId;
  String image;
  double rating;
  int reviewCount;
  List<String> mealType;

  RecipeModel({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.cuisine,
    required this.caloriesPerServing,
    required this.tags,
    required this.userId,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.mealType,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      name: json['name'],
      ingredients: List<String>.from(json['ingredients']),
      instructions: List<String>.from(json['instructions']),
      prepTimeMinutes: (json['prepTimeMinutes']).toDouble(),
      cookTimeMinutes: (json['cookTimeMinutes']).toDouble(),
      servings: (json['servings']).toDouble(),
      difficulty: json['difficulty'],
      cuisine: json['cuisine'],
      caloriesPerServing: (json['caloriesPerServing']).toDouble(),
      tags: List<String>.from(json['tags']),
      userId: json['userId'],
      image: json['image'],
      rating: (json['rating']).toDouble(),
      reviewCount: json['reviewCount'],
      mealType: List<String>.from(json['mealType']),
    );
  }
}

class RecipeDataModel{
  int total;
  int skip;
  int limit;
  List<RecipeModel> recipes;
  RecipeDataModel({
    required this.total,
    required this.skip,
    required this.limit,
    required this.recipes
});

  factory RecipeDataModel.fromJson(Map<String, dynamic> json){
   List<RecipeModel> mRecipes=[];
   for(Map<String,dynamic> each in json['recipes']){
     mRecipes.add(RecipeModel.fromJson(each));
   }
    return RecipeDataModel(
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
      recipes: mRecipes,
    );
  }
}