import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  Future<void> checkAuthentication() async {
    // Simulate network call
    await Future.delayed(const Duration(seconds: 6));
    // Example: Assume user is authenticated for demonstration
    _isAuthenticated = true;
    notifyListeners();
  }
}
