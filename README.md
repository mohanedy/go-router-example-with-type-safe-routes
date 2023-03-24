# Developing type-safe routing module for production flutter apps using go_router

Leveraging go_router and type-safe routes for advanced navigation scenarios in Flutter 🚀

## Introduction

Flutter provides a complete system for navigating between screens and handling deep links. However, if you want to use a declarative routing approach that uses the Router API and supports web, multiple navigators, redirections, and other advanced scenarios, you might want to consider using a routing package such as go_router.

In this article, I will show you how we managed to develop a type-safe routing module with the power of enhanced enums and extension methods to be more easier and convenient to use. Knowing that go_router already has its way of implementing type-safe routes using code generation, my team and I decided to go without the code generation stuff and we decided to go with a more opinionated approach that considers the maintainability and testability of the code.

### You will learn how to

- Configure your app with go_router.
- Define routes and perform basic navigation using go_router.
- Use enums and extension methods to create typed wrappers for go_router methods.

## Prerequisites

### To follow this article, you will need

- Flutter SDK version 2.8 or higher.
- An IDE of your choice (I use VS Code).
- The go_router package (version 6.4.1 or higher).
- A basic understanding of Flutter widgets and navigation.

## What we are going to build

Our app will let you browse and save simple recipes.
The app has two pages:

1. Recipes Page: This page shows a list of recipes. You can tap on any recipe to see its details.
1. Recipe Details Page: This page shows the ingredients and instructions for the selected recipe. You can also press the add to favorite button to save the recipe and go back to the list. A snack bar will confirm that the recipe was added successfully.

<p align="center"><img src="docs_assets/demo_app.gif"/></p>

## Setup

To use go_router in your app, you need to switch to the router constructor on MaterialApp or CupertinoApp and provide it with a Router configuration. Routing packages, such as go_router, typically provide a configuration for you.

First we need to add the go_router as a dependency in the pubspec.yaml

```yaml
go_router: ^6.5.0
```

or you could use the following command in terminal to get the latest version

```bash
flutter pub add go_router 
```

Lets start by defining our router configuration and routes in the `router/app_router.dart` file as follows:

```dart
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

          final recipe = extraMap['recipe'] as Recipe;
          final favoriteCallback = extraMap['onAddedToFavorite'];

          return MaterialPage(
            key: state.pageKey,
            child: RecipeDetailsPage(
              recipe: recipe,
              onAddedToFavorite: favoriteCallback,
            ),
          );
        },
      ),
    ],
  );
}
```

we have defined two routes `recipesList` and `recipeDetails` and we have also defined the initial route to be `recipesList` which is the recipes list page.

Now we need to use the router in our app, so we need to replace the `MaterialApp` widget with `MaterialApp.router` widget as follows:

```dart
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Type-safe routes Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
    );
  }
```

## Basic Navigation

Now that we have our router configured, we can start using it to navigate between pages. We can use the `GoRouter.of(context)` or the handy `context.pushNamed` method to get the router instance and use it to navigate between pages.

```dart
  void onRecipePressed(BuildContext context, Recipe recipe) {
    context.pushNamed(
      'recipeDetails',
      extra: {
        'recipe': recipe,
        'onAddedToFavorite': (Recipe recipe) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Added ${recipe.name} to favorite',
              ),
            ),
          );
        },
      },
    );
  }
```

we have used the `context.pushNamed` method to navigate to the `recipeDetails` route and we have also passed the recipe object and a callback function to be used when the recipe is added to favorite to pass the selected recipe back to the `recipeList` and display snackbar.

### we can see there are two problems with the above code

1. The route name is a string, which means that we can make a typo and the compiler won't catch it.
2. We are passing the recipe object and the callback function as map in the extra data, which means that we can pass the wrong data and the compiler won't catch it.

in a production apps that contains a lot of routes, this can be a problem and can lead to bugs that are hard to catch.

## Type-safe routes

Now that we have our basic navigation working, we can start using the power of enums and extension methods to make our navigation more type-safe and convenient to use.

### Defining the routes

First we need to define our routes as enum as follows:

```dart
/// Represents the app routes and their paths.
enum AppRoutes {
  recipesList(
    name: 'recipesList',
    path: '/recipesList',
  ),
  recipeDetails(
    name: 'recipeDetails',
    path: '/recipeDetails',
  );

  const AppRoutes({
    required this.name,
    required this.path,
  });

  /// Represents the route name
  ///
  /// Example: `AppRoutes.splash.name`
  /// Returns: 'splash'
  final String name;

  /// Represents the route path
  ///
  /// Example: `AppRoutes.splash.path`
  /// Returns: '/splash'
  final String path;

  @override
  String toString() => name;
}
```

with the help of enhanced enums we can associate the route name and path with the enum value.

now lets replace the string route names with the enum values in the `AppRouter` class as follows:

```dart
class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: AppRoutes.recipesList.path,
    routes: [
      GoRoute(
        name: AppRoutes.recipesList.name,
        path: AppRoutes.recipesList.path,
      ...
      ),
      GoRoute(
        name: AppRoutes.recipeDetails.name,
        path: AppRoutes.recipeDetails.path,
       ...
      ),
    ],
  );
}
```

Now we can use the enum values instead of the string route names in our navigation code as follows:

```dart
  void onRecipePressed(BuildContext context, Recipe recipe) {
    context.pushNamed(
      AppRoutes.recipeDetails.name,
      extra: ...
    );
  }
```

We have solved the first problem, now the compiler will catch any typo in the route names or paths. But we still have the second problem, we are passing the recipe object and the callback function as map in the extra data, which means that we can pass the wrong data and the compiler won't catch it.

to solve this problem lets wrap the recipe object and the callback function in a `RecipeDetailsArgs` class as follows:

```dart
class RecipeDetailsArgs {
  RecipeDetailsArgs({
    required this.recipe,
    required this.onAddedToFavorite,
  });

  final Recipe recipe;
  final Function(Recipe) onAddedToFavorite;
}
```

now lets create new abstract class lets call it `AppNavigator` and define the `pushRecipeDetails` method in it as follows:

```dart
abstract class AppNavigator {
  /// Pushes the [RecipesListPage] to the navigation stack
  void pushRecipeDetails(RecipeDetailsArgs args);
}
```

This class will contains all of our navigation methods from now on. The reason we made the `AppNavigator` class abstract is to make it easier to mock it in our tests or to swap the implementation so the pages will no longer depend on the `go_router` package.

Now lets provide an implementation for the `AppNavigator` abstract class as follows:

```dart
class AppNavigatorImpl implements AppNavigator {
  AppNavigatorImpl(this.context);

  final BuildContext context;

  @override
  void pushRecipeDetails(RecipeDetailsArgs args) {
    context.pushNamed(
      AppRoutes.recipeDetails.name,
      extra: args,
    );
  }
}
```

But wait, how we could access the `AppNavigator` instance from our pages?
Here we could use the power of extensions methods to make the app navigator accessible from any widget.

```dart
extension NavigationHelpersExt on BuildContext {
  AppNavigator get navigator => AppNavigatorImpl(this);
}
```

now we could access the `AppNavigator` instance from any widget as follows:

```dart
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
```

Now we have solved the second problem, now the compiler will catch any typo in the arguments also now for a production projects that have tens of pages just by typing `context.navigator` we could see all of the defined pages in the app easily and navigate to them without the need of opening the `AppRouter`.

## Conclusion

In conclusion, GoRouter is a powerful package that simplifies navigation in Flutter apps. However, it can also lead to clutter and confusion when dealing with many pages. To avoid this, we can use enhanced enums and extension methods to make our navigation more type-safe and convenient. This way, we can enjoy the benefits of GoRouter without sacrificing code quality and readability.

You can find the project’s source code on [Github](https://github.com/Mohanedy98/go-router-example-with-type-safe-routes). Feel free to play around and reach me on [Twitter](https://twitter.com/mohanedy98) if you have any questions, suggestions, or feedback.

I would like to express my gratitude to @A-Fawzyy for his valuable feedback and suggestions that improved this article.

Thanks for reading! ❤️