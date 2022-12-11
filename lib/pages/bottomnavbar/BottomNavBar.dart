import 'package:flutter/material.dart';
import 'package:rentapp/routes/route.dart' as route;

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
    TopBar(),
    pages(),
    pages(),
    pages(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = TopBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAECFF),
      //this helps to avoid the overflow of the screen or the fixedbutton don't come up
      resizeToAvoidBottomInset: false,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //navigate to pages

          Navigator.pushNamed(context, route.RouteManager.toBeCreate);
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xFF5B67FE),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 66,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = TopBar();
                          currentTab = 0;
                        });
                      },
                      child: Icon(
                        currentTab == 0 ? Icons.home : Icons.home_outlined,
                        size: 32,
                        color:
                            currentTab == 0 ? Color(0xFF5B67FE) : Colors.grey,
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
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
                        size: 32,
                        color: currentTab == 1
                            ? const Color(0xFF5B67FE)
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
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
                        size: 32,
                        color: currentTab == 2
                            ? const Color(0xFF5B67FE)
                            : Colors.grey,
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = const pages();
                          currentTab = 3;
                        });
                      },
                      child: Icon(
                        currentTab == 3 ? Icons.person : Icons.person_outline,
                        size: 32,
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
