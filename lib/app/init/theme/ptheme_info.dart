import 'package:flutter/material.dart';

/// Abstract class for the theme information
abstract class PThemeInfo {
  /// [PThemeInfo] constructor
  PThemeInfo({
    required this.themeData,
  });

  /// [themeData] is the default theme data for [PThemeInfo]
  final ThemeData themeData;
}
