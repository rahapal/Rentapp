import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:rentapp/common/global_variables.dart';
import 'package:rentapp/controller/provider.dart';
import 'package:rentapp/model/payment.dart';
import 'package:rentapp/model/property.dart';
import 'package:rentapp/model/rentee.dart';

import '../viewpage/topbar.dart';
import '../viewpage/pages.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTab = 0;
  final List<Widget> screens = [
    const TopBar(),
    const pages(),
    const pages(),
    const pages(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  // ignore: non_constant_identifier_names
  late Box<Property> Pbox;
  // ignore: non_constant_identifier_names
  late Box<Rentee> Rbox;
  late Box<Payment> Paybox;

  @override
  void initState() {
    Pbox = Hive.box<Property>('property');
    Rbox = Hive.box<Rentee>('rentee');
    Paybox = Hive.box<Payment>('payment');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<PropertyProvider>(context).getProperties();
  }

  Widget currentScreen = const TopBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      //this helps to avoid the overflow of the screen or the fixedbutton don't come up
      resizeToAvoidBottomInset: false,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         
          Pbox.clear();
          Rbox.clear();
          Paybox.clear();

          //Navigator.pushNamed(context, route.RouteManager.toBeCreate);
        },
        // backgroundColor: const Color(0xFF5B67FE),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.h,
        child: SizedBox(
          height: 65.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 180.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40.w,
                      onPressed: () {
                        setState(() {
                          currentScreen = const TopBar();
                          currentTab = 0;
                        });
                      },
                      child: Icon(
                        currentTab == 0 ? Icons.home : Icons.home_outlined,
                        size: 35.w,
                        color: currentTab == 0
                            ? const Color(0xFF5B67FE)
                            : Colors.grey,
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40.w,
                      onPressed: () {
                        setState(() {
                          currentScreen = const pages();
                          currentTab = 1;
                        });
                      },
                      child: Icon(
                        currentTab == 1
                            ? Icons.bookmark
                            : Icons.bookmark_outline,
                        size: 35.w,
                        color: currentTab == 1
                            ? const Color(0xFF5B67FE)
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 180.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40.w,
                      onPressed: () {
                        setState(() {
                          currentScreen = const pages();
                          currentTab = 2;
                        });
                      },
                      child: Icon(
                        currentTab == 2
                            ? Icons.notifications
                            : Icons.notifications_outlined,
                        size: 35.w,
                        color: currentTab == 2
                            ? const Color(0xFF5B67FE)
                            : Colors.grey,
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40.w,
                      onPressed: () {
                        setState(() {
                          currentScreen = const pages();
                          currentTab = 3;
                        });
                      },
                      child: Icon(
                        currentTab == 3 ? Icons.person : Icons.person_outline,
                        size: 35.w,
                        color: currentTab == 3
                            ? const Color(0xFF5B67FE)
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
