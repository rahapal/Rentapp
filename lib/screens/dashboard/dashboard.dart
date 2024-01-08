import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentapp/screens/dashboard/LineChart.dart';

import 'package:rentapp/screens/dashboard/collectionSection.dart';
import 'package:rentapp/screens/dashboard/propertiesRent.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FE),
      appBar: AppBar(
        toolbarHeight: 5.h,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF8F7FE),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 15),
                child: Text(
                  'Dashboard',
                  style:
                      TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w600),
                ),
              ),
              const CollectionRent(),
              const SizedBox(
                height: 20,
              ),
              const PropertiesRent(),
              const SizedBox(
                height: 20,
              ),
              const LineChartBar()
            ],
          ),
        ),
      ),
    );
  }
}
