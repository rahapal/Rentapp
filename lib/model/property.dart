import 'package:hive/hive.dart';
import 'package:rentapp/model/rentee.dart';

part 'property.g.dart';

@HiveType(typeId: 0)
class Property {
  @HiveField(0)
  String propertyName;
  @HiveField(1)
  String address;
  @HiveField(2)
  String description;
  @HiveField(3)
  int price;
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
  @HiveField(9)
  int index;
  @HiveField(10)
  bool fieldStatus;
  

  Property({
    required this.propertyName,
    required this.address,
    required this.description,
    required this.price,
    required this.image,
    required this.size,
    this.status = 'empty',
    required this.propertyId,
    required this.rentee,
    required this.index,
    this.fieldStatus = false,
  });
  //print("Property Created, status: $status");

}
