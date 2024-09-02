import 'package:flutter/material.dart';

enum ButtonType { elevated, filled, outlined }

class CustomButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final ButtonType buttonType;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  final IconData? icon;
  final IconAlignment iconAlignment;
  final bool isDisabled;

  const CustomButton({
    super.key,
    required this.text,
    this.isLoading = false,
    this.buttonType = ButtonType.elevated,
    this.backgroundColor,
    this.textColor,
    this.onPressed,
    this.icon,
    this.iconAlignment = IconAlignment.start,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final isButtonDisabled = isDisabled || onPressed == null;
    if (icon != null) {
      // Use button with icon if an icon is provided
      switch (buttonType) {
        case ButtonType.elevated:
          return ElevatedButton.icon(
            iconAlignment: iconAlignment,
            onPressed: isButtonDisabled ? null : onPressed,
            icon: Icon(icon, color: textColor),
            label: Text(text, style: TextStyle(color: textColor)),
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
            ),
          );
        case ButtonType.filled:
          return FilledButton.icon(
            iconAlignment: iconAlignment,
            onPressed: isButtonDisabled ? null : onPressed,
            icon: Icon(icon, color: textColor),
            label: Text(text, style: TextStyle(color: textColor)),
            style: FilledButton.styleFrom(
              backgroundColor: backgroundColor,
            ),
          );
        case ButtonType.outlined:
          return OutlinedButton.icon(
            iconAlignment: iconAlignment,
            onPressed: isButtonDisabled ? null : onPressed,
            icon: Icon(icon, color: textColor),
            label: Text(text, style: TextStyle(color: textColor)),
            style: OutlinedButton.styleFrom(
              foregroundColor: textColor,
            ),
          );
        default:
          return ElevatedButton.icon(
            iconAlignment: iconAlignment,
            onPressed: isButtonDisabled ? null : onPressed,
            icon: Icon(icon, color: textColor),
            label: Text(text, style: TextStyle(color: textColor)),
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
            ),
          );
      }
    } else {
      // Use standard button if no icon is provided
      switch (buttonType) {
        case ButtonType.elevated:
          return ElevatedButton(
            onPressed: isButtonDisabled ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
            ),
            child: Text(text, style: TextStyle(color: textColor)),
          );
        case ButtonType.filled:
          return FilledButton(
            onPressed: isButtonDisabled ? null : onPressed,
            style: FilledButton.styleFrom(
              backgroundColor: backgroundColor,
            ),
            child: Text(text, style: TextStyle(color: textColor)),
          );
        case ButtonType.outlined:
          return OutlinedButton(
            onPressed: isButtonDisabled ? null : onPressed,
            style: OutlinedButton.styleFrom(
              foregroundColor: textColor,
            ),
            child: Text(text, style: TextStyle(color: textColor)),
          );
        default:
          return ElevatedButton(
            onPressed: isButtonDisabled ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
            ),
            child: Text(text, style: TextStyle(color: textColor)),
          );
      }
    }
  }
}
