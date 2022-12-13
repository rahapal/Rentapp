import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:rentapp/model/property.dart';

class PropertyProvider with ChangeNotifier {
  static const String _boxName = 'property';
  List<Property> _property = [];
  List<Property> get property => _property;
  List<bool> isSelected = List.generate(30, (index) => false);

  Property? atIndex(int index) {
    // var matches = _property.where((element) => element.index == index).toList();
    // if (matches.isNotEmpty) {
    //   return matches.first;
    // }
    // return null;

    var found = null;

    for (int i = 0; i < _property.length; i++) {
      if (_property[i].index == index) {
        found = _property[i];
        break;
      }
    }

    return found;
  }

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
    print('Recieved : $index');
    notifyListeners();
  }
}
