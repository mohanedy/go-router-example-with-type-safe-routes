import 'package:flutter/material.dart';
import 'package:go_router_example_with_type_safe_routes/models/index.dart';
import 'package:go_router_example_with_type_safe_routes/pages/recipe_details_args.dart';

/// A page that displays the details of a recipe with the given [recipe].
class RecipeDetailsPage extends StatelessWidget {
  const RecipeDetailsPage({
    super.key,
    required this.args,
  });

  /// The args used to display the recipe.
  final RecipeDetailsArgs args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.recipe.name,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.of(context).pop();
              args.onAddedToFavorite.call(args.recipe);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              args.recipe.imageUrl,
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.error,
                size: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                args.recipe.details,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
