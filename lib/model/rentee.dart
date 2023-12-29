import 'package:hive/hive.dart';
import 'package:rentapp/model/payment.dart';

part 'rentee.g.dart';

@HiveType(typeId: 1)
class Rentee {
  @HiveField(0)
  String renteeName;
  @HiveField(1)
  String renteeContact;
  @HiveField(2)
  String renteeEmail;
  @HiveField(3)
  String businessdetail;
  @HiveField(4)
  String citizenimage;
  @HiveField(5)
  String agreementimage;
  @HiveField(6)
  String renteeId;
  @HiveField(7)
  int dueAmount;
  @HiveField(8)
  int advanceAmount;
  @HiveField(9)
  String renteePanNumber;
  @HiveField(10)
  String agreementDate;
  @HiveField(11)
  Payment renteePayment;
  //added
  @HiveField(12)
  DateTime rentDate;
  @HiveField(13)
  int totalAmount;

  //

  Rentee({
    required this.renteeName,
    required this.renteeContact,
    required this.renteeEmail,
    required this.businessdetail,
    required this.citizenimage,
    required this.agreementimage,
    required this.renteeId,
    required this.agreementDate,
    this.dueAmount = 0,
    this.advanceAmount = 0,
    required this.renteePayment,
    required this.renteePanNumber,
    required this.rentDate,
    this.totalAmount = 0,
  });
}
