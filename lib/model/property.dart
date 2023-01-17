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
  String size;
  @HiveField(5)
  String status;
  @HiveField(6)
  String propertyId;
  @HiveField(7)
  Rentee rentee;
  @HiveField(8)
  int index;
  @HiveField(9)
  bool fieldStatus;

  Property({
    required this.propertyName,
    required this.address,
    required this.description,
    required this.price,
    required this.size,
    this.status = 'empty',
    required this.propertyId,
    required this.rentee,
    required this.index,
    this.fieldStatus = false,
  });
  //print("Property Created, status: $status");

}
