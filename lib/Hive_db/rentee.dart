import 'package:hive/hive.dart';

part 'rentee.g.dart';

@HiveType(typeId: 1)
class Rentee {
  @HiveField(0)
  String name;
  @HiveField(1)
  String contact;
  @HiveField(2)
  String email;
  @HiveField(3)
  String businessdetail;
  @HiveField(4)
  String citizenimage;
  @HiveField(5)
  String agreementimage;

  Rentee({
    required this.name,
    required this.contact,
    required this.email,
    required this.businessdetail,
    required this.citizenimage,
    required this.agreementimage,
  });
}
