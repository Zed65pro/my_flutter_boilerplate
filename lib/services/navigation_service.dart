import 'package:flutter/material.dart';

// Captures the GlobalKey, so that context can be accessed anywhere in the project
class NavigationService {
  NavigationService._();

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;
}
