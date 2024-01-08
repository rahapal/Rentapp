import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:rentapp/model/activity.dart';
import 'package:rentapp/model/listBox.dart';
import 'package:rentapp/model/rentee.dart';
import 'package:rentapp/route/route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller/provider.dart';
import 'model/payment.dart';
import 'model/property.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory directory = await getApplicationDocumentsDirectory();
  await SharedPreferences.getInstance();
  Hive.init(directory.path);
  Hive.registerAdapter(PropertyAdapter());
  Hive.registerAdapter(RenteeAdapter());
  Hive.registerAdapter(PaymentAdapter());
  Hive.registerAdapter(ActivityAdapter());
  Hive.registerAdapter(ListBoxAdapter());
  var Pbox = await Hive.openBox<Property>('property');
  var Rbox = await Hive.openBox<Rentee>('rentee');
  var Paybox = await Hive.openBox<Payment>('payment');
  var Activitybox = await Hive.openBox<Activity>('activity');
  var Listbox = await Hive.openBox<ListBox>('listbox');

  //print(Listbox.values.first);

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PropertyProvider()),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: const Color(0xFF5B67FE),
            scaffoldBackgroundColor: const Color(0xFFF6F5F2),
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: const Color(0xFF5B67FE)),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5B67FE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          initialRoute: RouteManager.home,
          onGenerateRoute: generateRoute,
        ),
        designSize: const Size(414, 896),
      ),
    );
  }
}
