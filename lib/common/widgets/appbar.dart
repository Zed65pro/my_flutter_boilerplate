import 'package:boilerplate/common/widgets/language_switch.dart';
import 'package:flutter/material.dart';
import 'theme_switch.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final bool centerTitle;
  final List<Widget> actions;
  final Widget? leading;
  final double elevation;
  final double height;

  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor = Colors.blue,
    this.titleColor = Colors.white,
    this.centerTitle = false,
    this.actions = const <Widget>[],
    this.leading,
    this.elevation = 4.0,
    this.height = kToolbarHeight,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: titleColor),
      ),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      actions: actions + [const LanguageSwitcher()],
      leading: leading,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
