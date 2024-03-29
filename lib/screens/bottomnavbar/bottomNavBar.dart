import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:rentapp/common/global_variables.dart';
import 'package:rentapp/controller/provider.dart';
import 'package:rentapp/model/activity.dart';
import 'package:rentapp/model/listBox.dart';
import 'package:rentapp/model/payment.dart';
import 'package:rentapp/model/property.dart';
import 'package:rentapp/model/rentee.dart';
import 'package:rentapp/screens/bottomnavbar/activityScreen.dart';
import 'package:rentapp/screens/dashboard/dashboard.dart';

import '../../main.dart';
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
    const ActivityScreenPage(),
    const pages(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  // ignore: non_constant_identifier_names
  late Box<Property> Pbox;
  // ignore: non_constant_identifier_names
  late Box<Rentee> Rbox;
  late Box<Payment> Paybox;
  late Box<Activity> Activitybox;
  late Box<ListBox> Listbox;

  @override
  void initState() {
    Pbox = Hive.box<Property>('property');
    Rbox = Hive.box<Rentee>('rentee');
    Paybox = Hive.box<Payment>('payment');
    Activitybox = Hive.box<Activity>('activity');
    Listbox = Hive.box<ListBox>('listbox');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<PropertyProvider>(context).getProperties();
    // Provider.of<PropertyProvider>(context).showList();
  }

  Widget currentScreen = const TopBar();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PropertyProvider>(context);
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      //this helps to avoid the overflow of the screen or the fixedbutton don't come up
      resizeToAvoidBottomInset: false,
      body: PopScope(
        canPop: false,
        child: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF5B67FE),
        onPressed: () {
          // Pbox.clear();
          // Rbox.clear();
          // provider.clearPaymentMAp();
          // Paybox.clear();
          // Listbox.clear();
          // Activitybox.clear();

          provider.addList();

          //aaded
          // SchedulerBinding.instance.addPostFrameCallback((_) {
          //   // Your gesture recognizer code here
          //   runApp(
          //     const RentApp(),
          //   );
          // });
          //
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
                          currentScreen = const DashboardScreen();
                          currentTab = 1;
                        });
                      },
                      child: Icon(
                        currentTab == 1
                            ? Icons.dashboard
                            : Icons.dashboard_outlined,
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
                          currentScreen = const ActivityScreenPage();
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
