import 'package:flutter/material.dart';
import 'package:flutter_movie_app/app/init/theme/pstatic_colors.dart';
import 'package:flutter_movie_app/app/init/theme/ptheme.dart';
import 'package:flutter_movie_app/app/init/theme/ptheme_info.dart';

part 'main_theme_dark.dart';
part 'main_theme_light.dart';
part 'main_data_mixin.dart';

/// [MainTheme] is the main theme values for the project
class MainTheme extends PTheme with MainDataMixin {
  @override
  final PStaticColors staticColors = const PStaticColors(
    white: Color(0xFFFBFBFB),
    black: Color(0xFF1D1D1D),
  );

  @override
  PThemeInfo themeInfo(bool isDark) {
    final defaultData = isDark
        ? ThemeData.dark(useMaterial3: true)
            .copyWith(brightness: Brightness.dark)
        : ThemeData.light(useMaterial3: true)
            .copyWith(brightness: Brightness.light);

    final data = defaultData.copyWith(
      scaffoldBackgroundColor: colorScheme(defaultData).background,
      textTheme: textTheme(defaultData),
      colorScheme: colorScheme(defaultData),
      iconTheme: iconTheme(defaultData),
      bottomNavigationBarTheme: bottomNavigationBarTheme(defaultData),
      searchBarTheme: searchBarTheme(defaultData),
      elevatedButtonTheme: elevatedButtonTheme(defaultData),
      floatingActionButtonTheme: floatingActionButtonTheme(defaultData),
      dividerTheme: dividerTheme(defaultData),
      appBarTheme: appBarTheme(defaultData),
    );

    return isDark
        ? MainThemeDark(themeData: data)
        : MainThemeLight(themeData: data);
  }
}
