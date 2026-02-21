import 'package:app_projet3/config/routeur.dart';
import 'package:app_projet3/core/constant/app_constants.dart';
import 'package:app_projet3/core/localization/app_locale.dart';
import 'package:app_projet3/theme/theme_perso.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MonApplication());
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //titre de lapplication
      title: AppConstants.titreApplication,
      //suprimer le debug banner
      debugShowCheckedModeBanner: false,
      //les routes des application
      routes: Routeur.toutesLesRoutes,
      initialRoute: Routeur.routeAccueil,
      onUnknownRoute: Routeur.routeParDefaut,

      theme: ThemePerso.modeclair,
      darkTheme: ThemePerso.modeSombre,
      themeMode: ThemeMode.system,

      locale: AppLocale.localeParDefaut,
      supportedLocales: AppLocale.touteslesLocales,
      localizationsDelegates: AppLocale.delegates,
      localeResolutionCallback: AppLocale.resolutionLocalParDefaut,
    );
  }
}
