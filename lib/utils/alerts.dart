import 'package:boilerplate/utils/device_utils.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/constants/app_colors.dart';

enum AlertType {
  NORMAL,
  SUCCESS,
  INFO,
  WARNING,
  ERROR,
}

class Alerts {
  Alerts._();

  static IconData _getAlertIcon(AlertType type) {
    switch (type) {
      case AlertType.NORMAL:
        return Icons.near_me;
      case AlertType.SUCCESS:
        return Icons.check_circle;
      case AlertType.INFO:
        return Icons.info;
      case AlertType.WARNING:
        return Icons.warning;
      case AlertType.ERROR:
        return Icons.error;
      default:
        return Icons.info;
    }
  }

  static Color _getAlertColor(AlertType type) {
    switch (type) {
      case AlertType.NORMAL:
        return AppColors.primary;
      case AlertType.SUCCESS:
        return AppColors.success;
      case AlertType.INFO:
        return AppColors.info;
      case AlertType.WARNING:
        return AppColors.warning;
      case AlertType.ERROR:
        return AppColors.error;
      default:
        return AppColors.secondary;
    }
  }

  static void showSnackBar(BuildContext context, {required String message, required AlertType type}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(_getAlertIcon(type)),
            const SizedBox(width: 8.0),
            Expanded(child: Text(message, style: Theme.of(context).textTheme.headlineSmall)),
          ],
        ),
        backgroundColor: _getAlertColor(type),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        margin: const EdgeInsets.only(
          bottom: 15,
          left: 16.0,
          right: 16.0,
        ),
      ),
    );
  }

  static void showAlert(BuildContext context, {required String message, String? title, Function()? onTap, AlertType type = AlertType.NORMAL}) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: title != null ? Text(title, style: Theme.of(context).textTheme.headlineMedium) : null,
          scrollable: true,
          icon: Icon(_getAlertIcon(type), color: _getAlertColor(type), size: 54),
          iconColor: _getAlertColor(type),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          contentPadding: const EdgeInsets.all(24.0),
          content: SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: DeviceUtils.getScreenHeight(context) * 0.4),
                child: SelectableText(textAlign: TextAlign.center, message, style: Theme.of(context).textTheme.bodyLarge)),
          ),
        );
      });
}
