import 'package:flutter/material.dart';

import 'package:rentapp/pages/bottomnavbar/BottomNavBar.dart';
import 'package:rentapp/pages/detailscreen/detailspage.dart';
import 'package:rentapp/pages/viewpage/pages.dart';
import 'package:rentapp/pages/viewpage/viewpage.dart';

class RouteManager {
  static const String home = '/';
  static const String viewpage = 'viewpage';
  static const String detailspage = 'detailspage';
  static const String toBeCreate = 'toBeCreate';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteManager.home:
      return MaterialPageRoute(
        builder: (context) => const BottomNav(),
      );
    case RouteManager.viewpage:
      return MaterialPageRoute(
        builder: (context) => const ViewPage(),
      );
    case RouteManager.toBeCreate:
      return MaterialPageRoute(
        builder: (context) => const pages(),
      );
    case RouteManager.detailspage:
      return MaterialPageRoute(
        builder: (context) => const DetailsPage(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const pages(),
      );
  }
}
