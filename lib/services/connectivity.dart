import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../utils/alerts.dart';

/// Manages the network connectivity status and provides methods to check and handle connectivity changes.
/// SINGLETON CLASS
class ConnectivityService {
  static final ConnectivityService _instance = ConnectivityService._internal();

  factory ConnectivityService() => _instance;

  ConnectivityService._internal() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  GlobalKey? navigatorKey;
  final Connectivity _connectivity = Connectivity();
  static late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  ConnectivityResult _connectionStatus = ConnectivityResult.none;

  // Setting navigation key
  void setNavigationKey(GlobalKey navKey) {
    _instance.navigatorKey = navKey;
  }

  /// Update the connection status based on changes in connectivity and show a relevant popup for no internet connection.
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus = result;
    if (_connectionStatus == ConnectivityResult.none) {
      if (navigatorKey != null)
        Alerts.showAlert(navigatorKey!.currentContext!, message: "Internet connection is not available currently", type: AlertType.ERROR);
    }
  }

  void dispose() {
    _connectivitySubscription.cancel();
  }
}
