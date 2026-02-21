import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocale {
  //Langue par defaut
  static Locale localeParDefaut = const Locale('fr', 'FR');

  static List<Locale> touteslesLocales = const [
    Locale('fr', 'FR'),
    Locale('en', 'Us'),
    Locale('ar', 'SA'),
  ];
  static List<LocalizationsDelegate<dynamic>> delegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static Locale resolutionLocalParDefaut(
    Locale? locale,
    Iterable<Locale> supportedLocales,
  ) {
    if (locale != null) {
      for (Locale SupportedLocale in supportedLocales) {
        if (SupportedLocale.languageCode == locale.languageCode &&
            SupportedLocale.countryCode == locale.countryCode) {
          return SupportedLocale;
        }
      }
    }
    return localeParDefaut;
  }
}
