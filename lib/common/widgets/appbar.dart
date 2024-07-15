import 'package:boilerplate/common/widgets/language_switch.dart';
import 'package:boilerplate/common/widgets/theme_switch.dart';
import 'package:boilerplate/constants/asset_strings.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool centerTitle;
  final List<Widget> actions;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    super.key,
    this.centerTitle = true,
    this.actions = const <Widget>[],
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        AppAssets.arabic,
        height: 30, // Adjust this value to fit your image
        fit: BoxFit.contain,
      ),
      centerTitle: centerTitle,
      actions: actions + [
        // const LanguageSwitcher(),
        const ThemeSwitch(),
      ],
      leading: Navigator.of(context).canPop()
          ? IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
      )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
