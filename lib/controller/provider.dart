import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:rentapp/model/property.dart';

class PropertyProvider extends ChangeNotifier {
  static const String _boxName = 'property';
  List<Property> _property = [];
  List<Property> get property => _property;
  List<bool> isSelected = List.generate(30, (index) => false);

  void addProperty(Property property) async {
    var propertybox = await Hive.openBox<Property>(_boxName);
    await propertybox.put(property.propertyId, property);
    _property = propertybox.values.toList();
    notifyListeners();
  }

  Property getDetails(index) {
    return _property[index];
  }

  void setAllTrue(index) {
    isSelected[index] = true;
    notifyListeners();
  }
}
