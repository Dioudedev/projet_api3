import 'package:app_projet3/views/page_accueil.dart';
import 'package:app_projet3/views/page_boutique.dart';
import 'package:app_projet3/views/page_compteur.dart';
import 'package:app_projet3/views/page_profil.dart';
import 'package:flutter/material.dart';

abstract class Routeur {
  static const String routeAccueil = '/page-accueil';
  static const String pageCompteur = '/pag-compteur';
  static const String pageBoutique = '/page-boutique';
  static const String pageProfil = '/page-profil';

  static final Map<String, WidgetBuilder> toutesLesRoutes = {
    routeAccueil: (context) => PageAccueil(),
    pageCompteur: (context) => PageCompteur(),
    pageBoutique: (context) => PageBoutique(),
    pageProfil: (context) => PageProfil(),
  };
  static Route<dynamic> routeParDefaut(RouteSettings) {
    return MaterialPageRoute(builder: (context) => PageAccueil());
  }
}
