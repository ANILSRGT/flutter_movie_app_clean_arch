import 'package:flutter/material.dart';
import 'package:flutter_movie_app/app/providers/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// [ProviderList] is the list of providers
@immutable
final class ProviderList {
  /// Returns the list of providers
  List<SingleChildWidget> get providers => [
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
      ];
}
