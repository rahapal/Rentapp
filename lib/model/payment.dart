import 'package:hive/hive.dart';

part 'payment.g.dart';

@HiveType(typeId: 0)
class Payment {
  @HiveField(0)
  int spaceid;
  @HiveField(1)
  DateTime date;
  @HiveField(2)
  double advanceDeposit;
  @HiveField(3)
  double payedAmount;

  Payment({
    required this.spaceid,
    required this.date,
    required this.advanceDeposit,
    required this.payedAmount,
  });
}
