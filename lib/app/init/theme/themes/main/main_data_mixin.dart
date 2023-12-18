part of 'main_theme.dart';

/// [MainDataMixin] is theme values for main theme
mixin MainDataMixin {
  /// [textTheme] is text styles for theme with [themeData]
  TextTheme textTheme(ThemeData themeData) {
    return themeData.textTheme.copyWith().apply(
          displayColor: colorScheme(themeData).onBackground,
          bodyColor: colorScheme(themeData).onBackground,
          fontFamily: 'Rubik',
        );
  }

  /// [colorScheme] is colors for theme with [themeData]
  ColorScheme colorScheme(ThemeData themeData) {
    final isDark = themeData.brightness == Brightness.dark;

    return themeData.colorScheme.copyWith(
      primary: const Color(0xFFE85628),
      onPrimary: const Color(0xFFFBFBFB),
      secondary: const Color(0xFFDB5024),
      onSecondary: const Color(0xFFFBFBFB),
      background: isDark ? const Color(0xFF383838) : const Color(0xFFF3F3F3),
      onBackground: isDark ? const Color(0xFFFBFBFB) : const Color(0xFF383838),
      surface: const Color(0xFF939393),
      onSurface: const Color(0xFFFBFBFB),
      error: const Color(0xFFFF4141),
      scrim: const Color(0xFFC7C7C7),
    );
  }

  /// [iconTheme] is icon values for theme with [themeData]
  IconThemeData iconTheme(ThemeData themeData) {
    return themeData.iconTheme.copyWith(
      color: colorScheme(themeData).onBackground,
      size: 24,
    );
  }

  /// [bottomNavigationBarTheme] is bottom navigation bar values
  /// for theme with [themeData]
  BottomNavigationBarThemeData bottomNavigationBarTheme(ThemeData themeData) {
    return themeData.bottomNavigationBarTheme.copyWith(
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      type: BottomNavigationBarType.fixed,
      backgroundColor: colorScheme(themeData).background,
      selectedItemColor: colorScheme(themeData).primary,
      unselectedItemColor: colorScheme(themeData).surface,
      selectedIconTheme: const IconThemeData(size: 32),
      unselectedIconTheme: const IconThemeData(size: 24),
      mouseCursor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed) ||
              states.contains(MaterialState.hovered)) {
            return SystemMouseCursors.click;
          }
          return SystemMouseCursors.basic;
        },
      ),
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  /// [searchBarTheme] is search bar values
  /// for theme with [themeData]
  SearchBarThemeData searchBarTheme(ThemeData themeData) {
    return SearchBarThemeData(
      backgroundColor:
          MaterialStatePropertyAll(colorScheme(themeData).onBackground),
      hintStyle: MaterialStatePropertyAll(
        textTheme(themeData).bodyLarge?.copyWith(
              color: colorScheme(themeData).surface,
            ),
      ),
      textStyle: MaterialStatePropertyAll(
        textTheme(themeData).bodyLarge?.copyWith(
              color: colorScheme(themeData).background,
            ),
      ),
    );
  }

  /// [elevatedButtonTheme] is elevated button values
  /// for theme with [themeData]
  ElevatedButtonThemeData elevatedButtonTheme(ThemeData themeData) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: colorScheme(themeData).onPrimary,
        backgroundColor: colorScheme(themeData).primary,
        disabledForegroundColor:
            colorScheme(themeData).onSurface.withOpacity(0.38),
        disabledBackgroundColor:
            colorScheme(themeData).onSurface.withOpacity(0.12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  /// [floatingActionButtonTheme] is floating action button values
  /// for theme with [themeData]
  FloatingActionButtonThemeData floatingActionButtonTheme(ThemeData themeData) {
    return FloatingActionButtonThemeData(
      shape: const CircleBorder(),
      backgroundColor: colorScheme(themeData).primary,
      foregroundColor: colorScheme(themeData).onPrimary,
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
    );
  }

  /// [dividerTheme] is divider values
  /// for theme with [themeData]
  DividerThemeData dividerTheme(ThemeData themeData) {
    return themeData.dividerTheme.copyWith(
      color: colorScheme(themeData).surface,
      thickness: 3,
      space: 16,
    );
  }

  /// [appBarTheme] is app bar values
  /// for theme with [themeData]
  AppBarTheme appBarTheme(ThemeData themeData) {
    return themeData.appBarTheme.copyWith(
      backgroundColor: Colors.transparent,
      foregroundColor: colorScheme(themeData).onBackground,
      iconTheme: iconTheme(themeData),
      titleTextStyle: textTheme(themeData)
          .headlineSmall
          ?.copyWith(fontWeight: FontWeight.bold),
      toolbarTextStyle: textTheme(themeData).headlineSmall,
    );
  }
}
