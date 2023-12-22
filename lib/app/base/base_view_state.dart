import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/app/init/theme/ptheme.dart';
import 'package:flutter_movie_app/app/providers/theme_notifier.dart';

/// [BaseViewState] is the base class for all screens states.
abstract class BaseViewState<T extends StatefulWidget> extends State<T> {
  /// [currentTheme] is the current theme.
  PTheme get currentTheme => context.watch<ThemeNotifier>().currentTheme;
}
