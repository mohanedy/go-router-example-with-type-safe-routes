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


We are going to build simple recipes app that contains two pages as the following:

1. Recipes Page: Contains two buttons that opens the recipe details page and passes three parameters to it (recipeId, recipeName, and recipeDescription).
2. Recipe Details Page: it just Displays the passed parameters.

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

Here is how you can configure your MaterialApp with go_router:

```dart

```