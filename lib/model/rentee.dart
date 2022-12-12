import 'package:hive/hive.dart';

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

  Rentee({
    required this.renteeName,
    required this.renteeContact,
    required this.renteeEmail,
    required this.businessdetail,
    required this.citizenimage,
    required this.agreementimage,
    required this.renteeId,
  });
}
