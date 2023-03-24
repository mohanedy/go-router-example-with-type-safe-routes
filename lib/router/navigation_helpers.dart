import 'package:flutter/material.dart';

import 'package:go_router_example_with_type_safe_routes/router/app_navigator.dart';

extension NavigationHelpersExt on BuildContext {
  AppNavigator get navigator => AppNavigatorImpl(this);
}
