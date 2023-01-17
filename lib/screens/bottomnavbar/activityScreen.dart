import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import 'package:rentapp/model/activity.dart';

class ActivityScreenPage extends StatefulWidget {
  const ActivityScreenPage({super.key});

  @override
  State<ActivityScreenPage> createState() => _ActivityScreenPageState();
}

class _ActivityScreenPageState extends State<ActivityScreenPage> {
  // late Box<Activity> Activitybox;

  // @override
  // void initState() {
  //   Activitybox = Hive.box<Activity>('activity');
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final activities = Hive.box<Activity>('activity').values.toList()
      ..sort((a, b) => b.addedDate.compareTo(a.addedDate));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        title: const Text(
          'Activities',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
          final activity = activities[index];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 14.w,
                      height: 14.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF5B67FE),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            activity.name,
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Text(
                          activity.action,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w300,
                              color: const Color(0xFF9F9F9F)),
                        ),
                      ],
                    ),
                    Text(
                      activity.date.toString(),
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFF9F9F9F)),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
            ],
          );
        },
      ),
    );
  }
}
