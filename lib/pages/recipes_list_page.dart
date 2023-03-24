import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecipesListPage extends StatelessWidget {
  const RecipesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => context.pushNamed(
              'recipeDetails',
              extra: {
                'recipeId': 1,
                'recipeName': 'Recipe 1',
                'recipeDetails': 'Recipe 1 details',
              },
            ),
            child: const Text('Go to Recipe 1'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.pushNamed(
              'recipeDetails',
              extra: {
                'recipeId': 1,
                'recipeName': 'Recipe 1',
                'recipeDetails': 'Recipe 1 details',
              },
            ),
            child: const Text('Go to Recipe 1'),
          ),
        ],
      ),
    );
  }
}
