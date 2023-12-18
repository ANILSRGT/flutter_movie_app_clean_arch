import 'package:flutter/material.dart';

/// Supported locales for the app
enum Locales {
  /// Turkish (Turkey)
  trTR(
    locale: Locale('tr', 'TR'),
    languageCode: 'tr',
    countryCode: 'TR',
    displayValue: 'Türkçe',
  ),

  /// English (United States)
  enUS(
    locale: Locale('en', 'US'),
    languageCode: 'en',
    countryCode: 'US',
    displayValue: 'English',
  );

  const Locales({
    required this.locale,
    required this.languageCode,
    required this.countryCode,
    required this.displayValue,
  });

  /// Locale for [Locales]
  final Locale locale;

  /// Language code (lowercase)
  /// <br>(ex: 'tr', 'en' etc.)
  final String languageCode;

  /// Country code (uppercase)
  /// <br>(ex: 'TR', 'US' etc.)
  final String countryCode;

  /// Display value for [Locales]
  final String displayValue;

  /// Full code
  /// <br><br>(ex: fullCode() => 'tr-TR')
  /// <br>(ex: fullCode(char: '_') => 'tr_TR')
  /// <br>(ex: fullCode(char: '') => 'trTR') etc.
  String fullCode({String char = '-'}) => '$languageCode$char$countryCode';
}
