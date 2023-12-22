import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/app/init/localization/locales.dart';

/// Localization manager for the app
@immutable
final class AppLocaleManager extends EasyLocalization {
  /// Constructor of [AppLocaleManager]
  AppLocaleManager({
    required super.child,
    super.key,
  }) : super(
          supportedLocales: supportedAppLocales.map((e) => e.locale).toList(),
          path: _translationPath,
          fallbackLocale: _defaultLocale.locale,
        );

  static const String _translationPath = 'assets/translations';

  static const Locales _defaultLocale = Locales.enUS;

  /// List of supported locales for the app
  static final List<Locales> supportedAppLocales = [
    Locales.trTR,
    Locales.enUS,
  ];

  static Locales _appLocale = Locales.enUS;

  /// Locale for app
  static Locales get appLocale => _appLocale;

  /// Change app language by using [Locales]
  static Future<void> updateAppLanguage({
    required BuildContext context,
    required Locales value,
  }) async {
    _appLocale = value;
    await context.setLocale(appLocale.locale);
  }
}
