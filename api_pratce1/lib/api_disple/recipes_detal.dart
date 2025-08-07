import 'package:api_pratce1/model_class/recipe_model.dart';
import 'package:flutter/material.dart';

class RecipesDetal extends StatelessWidget {
  final RecipeModel recipe;
  const RecipesDetal({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details recipe"),),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Image.network(recipe.image,height: 350,fit: BoxFit.cover,),
          const SizedBox(height: 12),
          Text("Cuisine: ${recipe.cuisine}", style: const TextStyle(fontSize: 16)),
          Text("Difficulty: ${recipe.difficulty}", style: const TextStyle(fontSize: 16)),
          Text("Prep Time: ${recipe.prepTimeMinutes} mins", style: const TextStyle(fontSize: 16)),
          Text("Cook Time: ${recipe.cookTimeMinutes} mins", style: const TextStyle(fontSize: 16)),
          Text("Calories per Serving: ${recipe.caloriesPerServing}", style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 12),
          const Text("Ingredients:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ...recipe.ingredients.map((e) => Text("• $e")).toList(),
          const SizedBox(height: 12),
          const Text("Instructions:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ...recipe.instructions.asMap().entries.map(
                (e) => Text("${e.key + 1}. ${e.value}"),
          ),
        ],
      ),

    );
  }
}
