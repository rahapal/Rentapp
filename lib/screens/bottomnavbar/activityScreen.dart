import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:rentapp/model/activity.dart';

class ActivityScreenPage extends StatefulWidget {
  const ActivityScreenPage({super.key});

  @override
  State<ActivityScreenPage> createState() => _ActivityScreenPageState();
}

class _ActivityScreenPageState extends State<ActivityScreenPage> {
  late Box<Activity> Activitybox;

  @override
  void initState() {
    Activitybox = Hive.box<Activity>('activity');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
      ),
      body: ListView.builder(
        itemCount: Activitybox.length,
        itemBuilder: (context, index) {
          final activity = Activitybox.getAt(index);
          return ListTile(
            title: Text(activity!.name),
            subtitle: Text(activity.action),
          );
        },
      ),
    );
  }
}
