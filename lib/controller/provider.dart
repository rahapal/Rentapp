import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:rentapp/model/payment.dart';
import 'package:rentapp/model/property.dart';

import '../model/rentee.dart';

class PropertyProvider with ChangeNotifier {
  static const String _boxName = 'property';
  final List<Property> _property = [];
  List<Property> get property => _property;
  List<bool> isSelected = List.generate(30, (index) => false);

  Map<int, List<Payment>> _paymentMap = {};

  void addProperty(Property property) async {
    var propertybox = await Hive.openBox<Property>(_boxName);
    await propertybox.put(property.propertyId, property);
    //add the propertbox elements to property
    _property.add(property);
    print('Property Added');
    print('Index added at: ${property.index}');
    notifyListeners();
  }

  Property getDetails(index) {
    //done this because we don't have index if we click 1st and then 7
    var found = null;

    for (int i = 0; i < _property.length; i++) {
      if (_property[i].index == index) {
        found = property[i];
        break;
      }
    }

    return found;
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
      // insert the propertybox to the _property at the index of the propertybox
      _property.add(propertybox.getAt(i)!);
      //add(propertybox.getAt(i)!);
      //print('property at index: ${propertybox.getAt(i)!.index}');
    }

    //property index
    //print('property length: ${_property.length}');
    notifyListeners();
  }

  getEmptyLength() {
    var isSelectLength = isSelected.length;
    var propertyLength = _property.length;
    var emptyLength = isSelectLength - propertyLength;
    return emptyLength;
  }

  Set<dynamic> addedIndexes = Set<dynamic>();

  Future<void> paymentAdd(int index, Payment payment) async {
    var paymentbox = await Hive.openBox<Payment>('payment');
    paymentbox.add(payment);
  }

  Future<void> showPaymentsDetails() async {
    var paymentbox = await Hive.openBox<Payment>('payment');
    for (int i = 0; i < paymentbox.length; i++) {
      if (!addedIndexes.contains(paymentbox.getAt(i)!.paymentDate)) {
        addedIndexes.add(paymentbox.getAt(i)!.paymentDate);
        addPayment(paymentbox.getAt(i)!.fieldIndex, paymentbox.getAt(i)!);
      }
    }
    // addPayment(index, payment);
    notifyListeners();
  }

  bool _hasSomePayments(int index) {
    return _paymentMap.containsKey(index) && _paymentMap[index]!.isNotEmpty;
  }

  List<Payment> getPaymentsIn(int index) {
    if (_hasSomePayments(index)) {
      return _paymentMap[index]!;
    }
    return [];
  }

  void addPayment(int index, Payment payment) async {
    if (_hasSomePayments(index)) {
      _paymentMap[index]!.add(payment);
    } else {
      _paymentMap[index] = [payment];
    }

    notifyListeners();
  }

  Future<List<Payment>> getPaymentHistory(int index) async {
    var paymentbox = await Hive.openBox<Payment>('payment');
    return paymentbox.values.toList();
  }
}
