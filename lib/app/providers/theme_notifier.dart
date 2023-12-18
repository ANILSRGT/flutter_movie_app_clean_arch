import 'package:flutter/material.dart';
import 'package:flutter_movie_app/app/init/theme/ptheme.dart';
import 'package:flutter_movie_app/app/init/theme/themes/main/main_theme.dart';

/// [ThemeNotifier] is the manager for the theme
final class ThemeNotifier with ChangeNotifier {
  PTheme _currentTheme = MainTheme();
  ThemeMode _currentThemeMode = ThemeMode.system;

  /// Returns the current theme
  PTheme get currentTheme => _currentTheme;

  /// Returns the current theme mode
  ThemeMode get currentThemeMode => _currentThemeMode;

  /// Returns true if the current theme is dark
  bool get isDark => _currentThemeMode == ThemeMode.system
      ? (WidgetsBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark)
      : (_currentThemeMode == ThemeMode.dark);

  /// Sets the current theme
  void setTheme(PTheme theme) {
    _currentTheme = theme;
    notifyListeners();
  }

  /// Sets the current theme mode
  void setThemeMode(ThemeMode mode) {
    _currentThemeMode = mode;
    notifyListeners();
  }
}
