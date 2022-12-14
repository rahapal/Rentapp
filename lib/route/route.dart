import 'package:flutter/material.dart';

import 'package:rentapp/screens/bottomnavbar/bottomNavBar.dart';
import 'package:rentapp/screens/viewpage/pages.dart';
import 'package:rentapp/screens/viewpage/viewpage.dart';

class RouteManager {
  static const String home = '/';
  static const String viewpage = 'viewpage';

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

    default:
      return MaterialPageRoute(
        builder: (context) => const pages(),
      );
  }
}
