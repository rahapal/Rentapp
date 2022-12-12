import 'package:hive/hive.dart';
import 'package:rentapp/model/rentee.dart';

part 'property.g.dart';

@HiveType(typeId: 0)
class Property {
  @HiveField(0)
  String name;
  @HiveField(1)
  String address;
  @HiveField(2)
  String description;
  @HiveField(3)
  String price;
  @HiveField(4)
  String image;
  @HiveField(5)
  String size;
  @HiveField(6)
  String status;
  @HiveField(7)
  String propertyId;
  @HiveField(8)
  Rentee rentee;

  Property({
    required this.name,
    required this.address,
    required this.description,
    required this.price,
    required this.image,
    required this.size,
    required this.status,
    required this.propertyId,
    required this.rentee,
  });
}
