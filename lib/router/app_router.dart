import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example_with_type_safe_routes/pages/recipe_details_args.dart';
import 'package:go_router_example_with_type_safe_routes/pages/recipe_details_page.dart';
import 'package:go_router_example_with_type_safe_routes/pages/recipes_list_page.dart';
import 'package:go_router_example_with_type_safe_routes/router/index.dart';

/// Contains all of the app routes configurations
class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: AppRoutes.recipesList.path,
    routes: [
      GoRoute(
        name: AppRoutes.recipesList.name,
        path: AppRoutes.recipesList.path,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const RecipesListPage(),
        ),
      ),
      GoRoute(
        name: AppRoutes.recipeDetails.name,
        path: AppRoutes.recipeDetails.path,
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: RecipeDetailsPage(
              args: state.extra as RecipeDetailsArgs,
            ),
          );
        },
      ),
    ],
  );
}
