import 'package:boilerplate/themes/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final isDark = themeManager.themeMode == ThemeMode.dark;
    return GestureDetector(
      onTap: () {
        themeManager.toggleTheme(!isDark);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 60.0,
        height: 30.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: isDark ? Colors.blueAccent : Colors.yellow,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn,
              left: isDark ? 30.0 : 0.0,
              right: isDark ? 0.0 : 30.0,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return RotationTransition(turns: animation, child: child);
                },
                child: isDark
                    ? Icon(
                        Icons.nights_stay,
                        color: Colors.white,
                        size: 20.0,
                        key: UniqueKey(),
                      )
                    : Icon(
                        Icons.wb_sunny,
                        color: Colors.black,
                        size: 20.0,
                        key: UniqueKey(),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
