import 'package:flutter/material.dart';

/// A page that displays the details of a recipe with the given [recipeId]
/// and [recipeName] and [recipeDetails].
class RecipeDetailsPage extends StatelessWidget {
  const RecipeDetailsPage({
    super.key,
    required this.recipeId,
    required this.recipeName,
    required this.recipeDetails,
  });

  final int recipeId;
  final String recipeName;
  final String recipeDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          recipeName,
        ),
      ),
      body: Column(
        children: [
          Text(
            recipeName,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            recipeDetails,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
