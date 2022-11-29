import 'package:flutter/material.dart';
import 'package:rentapp/AllDetailPageElements/secondpage.dart';
import 'package:rentapp/BottomNavBar.dart/BottomNavBar.dart';
import 'package:rentapp/HomePageElements/mainbody.dart';

import '../HomePageElements/pages.dart';

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
