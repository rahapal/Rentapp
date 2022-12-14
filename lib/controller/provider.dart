import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:rentapp/model/property.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/rentee.dart';

class PropertyProvider with ChangeNotifier {
  static const String _boxName = 'property';
  final List<Property> _property = [];
  List<Property> get property => _property;
  List<bool> isSelected = List.generate(30, (index) => false);

  void addProperty(Property property) async {
    var propertybox = await Hive.openBox<Property>(_boxName);
    await propertybox.put(property.propertyId, property);

    _property.insert(property.index, property);
    print('Property Added');
    print('Index: ${property.index}');
    notifyListeners();
  }

  Property getDetails(index) {
    return _property[index];
  }

  Property? atIndex(int index) {
    // var matches = _property.where((element) => element.index == index).toList();
    // if (matches.isNotEmpty) {
    //   return matches.first;
    // }
    // return null;

    var found = null;

    for (int i = 0; i < _property.length; i++) {
      if (_property[i].index == index) {
        found = property[i];
        break;
      }
    }

    return found;
  }

  Future<void> getProperties() async {
    var propertybox = await Hive.openBox<Property>(_boxName);
    _property.clear();
    for (int i = 0; i < propertybox.length; i++) {
      _property.add(propertybox.getAt(i)!);
    }
    notifyListeners();
  }

  void clear() {
    _property.clear();

    var Pbox = Hive.box<Property>(_boxName);
    Pbox.clear();
    var Rbox = Hive.box<Rentee>('Rentee');
    Rbox.clear();
    notifyListeners();
  }
  // Future<void> setIndexTrue(index) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   isSelected[index] = true;
  //   prefs.setBool('isSelected', isSelected[index]);
  //   notifyListeners();
  // }

  // Future<void> getIndexTrue(index) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   isSelected[index] = prefs.getBool('isSelected') ?? false;
  //   notifyListeners();
  // }

  // void setIndexTrue(index) {
  //   isSelected[index] = true;

  //   notifyListeners();
  // }

  // Future<void> setboolVal(index) async {
  //   setIndexTrue(index);
  //   final prefs = await SharedPreferences.getInstance();

  //   prefs.setStringList(
  //       'isSelected', isSelected.map((e) => e.toString()).toList());
  //   print(isSelected);
  //   print('Index: ${index}');
  //   notifyListeners();
  // }

  // Future<void> getboolVal() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final list = prefs.getStringList('isSelected');
  //   if (list == null) {
  //     return;
  //   } else {
  //     isSelected = list.map((e) => e == 'true').toList();
  //   }
  //   print(isSelected);

  //   notifyListeners();
  // }

  // removeValues() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.clear();
  // }
}
