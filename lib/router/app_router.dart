import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example_with_type_safe_routes/pages/recipe_details_page.dart';
import 'package:go_router_example_with_type_safe_routes/pages/recipes_list_page.dart';

/// Contains all of the app routes configurations
class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: '/recipesList',
    routes: [
      GoRoute(
        name: 'recipesList',
        path: '/recipesList',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const RecipesListPage(),
        ),
      ),
      GoRoute(
          name: 'recipeDetails',
          path: '/recipeDetails',
          pageBuilder: (context, state) {
            final extraMap = state.extra as Map<String, dynamic>;

            final recipeId = extraMap['recipeId'] as int;
            final recipeName = extraMap['recipeName'] as String;
            final recipeDetails = extraMap['recipeDetails'] as String;

            return MaterialPage(
              key: state.pageKey,
              child: RecipeDetailsPage(
                recipeDetails: recipeDetails,
                recipeId: recipeId,
                recipeName: recipeName,
              ),
            );
          }),
    ],
    errorPageBuilder: (ctx, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(
              'Error: ${state.error}',
            ),
          ),
        ),
      );
    },
  );
}
