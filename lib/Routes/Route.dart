import 'package:flutter/material.dart';

import 'package:rentapp/bottomnavbar/BottomNavBar.dart';
import 'package:rentapp/pages/AllDetailPageElements/secondpage.dart';
import 'package:rentapp/pages/HomePageElements/mainbody.dart';
import 'package:rentapp/pages/HomePageElements/pages.dart';

class RouteManager {
  static const String home = '/';
  static const String shutter = 'shutter';
  static const String secondpage = 'secondpage';
  static const String toBeCreate = 'toBeCreate';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteManager.home:
      return MaterialPageRoute(
        builder: (context) => const BottomNav(),
      );
    case RouteManager.shutter:
      return MaterialPageRoute(
        builder: (context) => const mainbody(),
      );
    case RouteManager.toBeCreate:
      return MaterialPageRoute(
        builder: (context) => const pages(),
      );
    case RouteManager.secondpage:
      return MaterialPageRoute(
        builder: (context) => const Secondpage(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const pages(),
      );
  }
}
