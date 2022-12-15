import 'package:hive/hive.dart';

part 'payment.g.dart';

@HiveType(typeId: 0)
class Payment {
  @HiveField(0)
  String paymentId;
  @HiveField(1)
  DateTime? paymentDate;
  @HiveField(2)
  int payedAmount;
  @HiveField(3)
  String paymentNote;

  Payment({
    required this.paymentId,
    required this.paymentDate,
    this.payedAmount = 0,
    required this.paymentNote,
  });
}
