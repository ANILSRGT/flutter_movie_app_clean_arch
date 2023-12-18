import 'package:flutter_movie_app/app/init/theme/pstatic_colors.dart';
import 'package:flutter_movie_app/app/init/theme/ptheme_info.dart';

/// Abstract class for the theme
abstract class PTheme {
  /// [themeInfo] is theme info for [PTheme]
  PThemeInfo themeInfo(bool isDark);

  /// [staticColors] is the static colors for [PThemeInfo]
  abstract final PStaticColors staticColors;
}
