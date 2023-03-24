import 'package:go_router_example_with_type_safe_routes/models/index.dart';

class RecipeDetailsArgs {
  RecipeDetailsArgs({
    required this.recipe,
    required this.onAddedToFavorite,
  });

  final Recipe recipe;
  final Function(Recipe) onAddedToFavorite;
}
