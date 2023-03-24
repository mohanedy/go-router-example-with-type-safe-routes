import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example_with_type_safe_routes/models/recipe.dart';
import 'package:go_router_example_with_type_safe_routes/pages/recipe_details_args.dart';
import 'package:go_router_example_with_type_safe_routes/router/navigation_helpers.dart';

class RecipesListPage extends StatelessWidget {
  const RecipesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: ListView.builder(
        itemCount: Recipe.recipes.length,
        itemBuilder: (context, index) {
          final recipe = Recipe.recipes[index];
          return ListTile(
            title: Text(
              recipe.name,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
            onTap: () => onRecipePressed(context, recipe),
          );
        },
      ),
    );
  }

  void onRecipePressed(BuildContext context, Recipe recipe) {
    context.navigator.pushRecipeDetails(
      RecipeDetailsArgs(
        recipe: recipe,
        onAddedToFavorite: (Recipe recipe) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Added ${recipe.name} to favorite',
              ),
            ),
          );
        },
      ),
    );
  }
}
