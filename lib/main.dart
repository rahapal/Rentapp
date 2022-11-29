import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rentapp/Hive_db/rentee.dart';
import 'package:rentapp/Routes/route.dart';

import 'Hive_db/property.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(PropertyAdapter());
  Hive.registerAdapter(RenteeAdapter());
  var Pbox = await Hive.openBox<Property>('property');
  var Rbox = await Hive.openBox<Rentee>('rentee');

  runApp(
    const RentApp(),
  );
}

class RentApp extends StatefulWidget {
  const RentApp({super.key});

  @override
  State<RentApp> createState() => _RentAppState();
}

class _RentAppState extends State<RentApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteManager.home,
      onGenerateRoute: generateRoute,
    );
  }
}
