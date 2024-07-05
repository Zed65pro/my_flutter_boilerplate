import 'package:flutter/material.dart';

// Captures the GlobalKey, so that context can be accessed anywhere in the project
class NavigationService {
  NavigationService._();

  static late final GlobalKey navigatorKey;

  static BuildContext get context => navigatorKey.currentContext!;
}
