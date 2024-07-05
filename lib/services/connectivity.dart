import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../utils/helper_functions.dart';

/// Manages the network connectivity status and provides methods to check and handle connectivity changes.
class ConnectivityService {
  static final ConnectivityService _instance = ConnectivityService._internal();

  factory ConnectivityService(GlobalKey navKey) {
    _instance.navigatorKey = navKey;
    return _instance;
  }

  ConnectivityService._internal() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  late final GlobalKey navigatorKey;
  final Connectivity _connectivity = Connectivity();
  static late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  ConnectivityResult _connectionStatus = ConnectivityResult.none;

  /// Update the connection status based on changes in connectivity and show a relevant popup for no internet connection.
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus = result;
    if (_connectionStatus == ConnectivityResult.none) {
      HelperFunctions.showAlert("No internet connection", "Internet connection is not available currently", navigatorKey.currentContext!);
    }
  }

  void dispose() {
    _connectivitySubscription.cancel();
  }
}
