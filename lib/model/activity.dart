import 'package:hive/hive.dart';

part 'activity.g.dart';

@HiveType(typeId: 3)
class Activity {
  @HiveField(0)
  String name;
  @HiveField(1)
  String action;
  @HiveField(2)
  String date;

  Activity({
    required this.name,
    required this.action,
    required this.date,
  });
}
