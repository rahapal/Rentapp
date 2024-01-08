import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:rentapp/model/activity.dart';
import 'package:rentapp/model/listBox.dart';
import 'package:rentapp/model/payment.dart';
import 'package:rentapp/model/property.dart';
import 'package:rentapp/model/rentee.dart';

class PropertyProvider with ChangeNotifier {
  static const String _boxName = 'property';
  final List<Property> _property = [];
  List<Property> get property => _property;
  List<bool> isSelected = List.generate(20, (index) => false);
  int count = 0;

  final Map<int, List<Payment>> _paymentMap = {};

  void clearPaymentMAp() {
    _paymentMap.clear();
    notifyListeners();
  }

  // void increaseSize() {
  //   count++;
  //   isSelected.add(false);
  //   notifyListeners();
  // }

  void addList() async {
    count++;
    isSelected.add(false);
    var listbox = await Hive.openBox<ListBox>('listbox');

    if (listbox.isNotEmpty) {
      // If the box is not empty, retrieve the existing ListBox and update its selectedList
      var existingListBox = listbox.getAt(0);
      existingListBox?.selectedList = isSelected;
      listbox.putAt(0, existingListBox!);
    } else {
      // If the box is empty, add a new ListBox with selectedList
      listbox.add(ListBox(selectedList: isSelected));
    }
    print('${listbox.values.first.selectedList}');

    // Call the function to show the contents
    notifyListeners();
  }

  Future<void> showList() async {
    var listbox = await Hive.openBox<ListBox>('listbox');

    if (listbox.isNotEmpty) {
      // If the box is not empty, retrieve the existing ListBox and update isSelected
      var existingListBox = listbox.getAt(0);
      isSelected = existingListBox!.selectedList;
    } else {
      // If the box is empty, use the default isSelected list
      isSelected = List.generate(20, (index) => false);
    }

    print('Updated isSelected: $isSelected');
    // Call the function to show the contents
    notifyListeners();
  }

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

  Set<dynamic> addedIndexes = <dynamic>{};

  Future<void> paymentAdd(int index, Payment payment, String name) async {
    var paymentbox = await Hive.openBox<Payment>('payment');
    paymentbox.add(payment);

    var activitybox = await Hive.openBox<Activity>('activity');
    activitybox.add(Activity(
        name: name,
        action: 'Paid the Amount of Rs.${payment.payedAmount}',
        date: payment.paymentDate,
        addedDate: DateTime.now()));
  }

  Future<void> showPaymentsDetails() async {
    var paymentbox = await Hive.openBox<Payment>('payment');

    for (int i = 0; i < paymentbox.length; i++) {
      if (!addedIndexes.contains(paymentbox.getAt(i)!.refDate)) {
        addedIndexes.add(paymentbox.getAt(i)!.refDate);
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

  void updateDueAmount(String propertyId, int amount) async {
    var propertybox = await Hive.openBox<Property>(_boxName);
    var property = propertybox.get(propertyId);
    property!.rentee.totalAmount = amount;
    if (amount == 0) {
      property.status = 'paid';
    } else {
      property.status = 'unpaid';
    }
    propertybox.put(propertyId, property);
    notifyListeners();
  }

  void updateProperty(Property property) async {
    var propertybox = await Hive.openBox<Property>(_boxName);
    propertybox.put(property.propertyId, property);
    notifyListeners();
  }

  void updateRentee(Rentee rentee) async {
    var renteebox = await Hive.openBox<Rentee>('rentee');
    renteebox.put(rentee.renteeId, rentee);
    notifyListeners();
  }

  //added
  void rentPriceAdd(Property property) async {
    var rentdate = property.rentee.rentDate;
    //for same year  and date but different month
    if (rentdate.year == DateTime.now().year &&
        rentdate.month != DateTime.now().month &&
        rentdate.day == DateTime.now().day) {
      property.rentee.totalAmount =
          (property.rentee.totalAmount - property.price).abs() +
              property.price * (DateTime.now().month - rentdate.month);

      property.rentee.rentDate =
          DateTime(DateTime.now().year, DateTime.now().month, rentdate.day);

      updateProperty(property);
    }
    //for same year but different month and date
    else if (rentdate.year == DateTime.now().year &&
        rentdate.month != DateTime.now().month &&
        rentdate.day > DateTime.now().day) {
      property.rentee.totalAmount =
          (property.rentee.totalAmount - property.price).abs() +
              property.price * ((DateTime.now().month - rentdate.month) - 1);

      property.rentee.rentDate =
          DateTime(DateTime.now().year, DateTime.now().month, rentdate.day);
      updateProperty(property);
    } else if (rentdate.year == DateTime.now().year &&
        rentdate.month != DateTime.now().month &&
        rentdate.day < DateTime.now().day) {
      property.rentee.totalAmount =
          (property.rentee.totalAmount - property.price).abs() +
              property.price * ((DateTime.now().month - rentdate.month));

      property.rentee.rentDate =
          DateTime(DateTime.now().year, DateTime.now().month, rentdate.day);
      updateProperty(property);
    }
    //for same month and date but different year
    else if (rentdate.year != DateTime.now().year &&
        rentdate.month == DateTime.now().month &&
        rentdate.day == DateTime.now().day) {
      property.rentee.totalAmount =
          (property.rentee.totalAmount - property.price).abs() +
              property.price *
                  ((rentdate.year - DateTime.now().year).abs() * 12);

      property.rentee.rentDate =
          DateTime(DateTime.now().year, DateTime.now().month, rentdate.day);
      updateProperty(property);
    }
    //for same month  but different year and date
    else if (rentdate.year != DateTime.now().year &&
        rentdate.month == DateTime.now().month &&
        rentdate.day > DateTime.now().day) {
      property.rentee.totalAmount =
          (property.rentee.totalAmount - property.price).abs() +
              property.price *
                  (((rentdate.year - DateTime.now().year).abs() * 12) - 1);

      property.rentee.rentDate =
          DateTime(DateTime.now().year, DateTime.now().month, rentdate.day);
      updateProperty(property);
    } else if (rentdate.year != DateTime.now().year &&
        rentdate.month == DateTime.now().month &&
        rentdate.day < DateTime.now().day) {
      property.rentee.totalAmount =
          (property.rentee.totalAmount - property.price).abs() +
              property.price *
                  ((rentdate.year - DateTime.now().year).abs() * 12);

      property.rentee.rentDate =
          DateTime(DateTime.now().year, DateTime.now().month, rentdate.day);
      updateProperty(property);
    }

    //for not same month and year
    else if (rentdate.year != DateTime.now().year &&
        rentdate.month != DateTime.now().month &&
        rentdate.day == DateTime.now().day) {
      property.rentee.totalAmount =
          (property.rentee.totalAmount - property.price).abs() +
              (property.price *
                      ((rentdate.year - DateTime.now().year).abs() * 12) +
                  property.price * (DateTime.now().month - rentdate.month));

      property.rentee.rentDate =
          DateTime(DateTime.now().year, DateTime.now().month, rentdate.day);
      updateProperty(property);
    }
    //for not same month and year and date
    else if (rentdate.year != DateTime.now().year &&
        rentdate.month != DateTime.now().month &&
        rentdate.day > DateTime.now().day) {
      property.rentee.totalAmount = (property.rentee.totalAmount -
                  property.price)
              .abs() +
          (property.price * ((rentdate.year - DateTime.now().year).abs() * 12) +
              property.price * ((DateTime.now().month - rentdate.month) - 1));

      property.rentee.rentDate =
          DateTime(DateTime.now().year, DateTime.now().month, rentdate.day);
      updateProperty(property);
    } else if (rentdate.year != DateTime.now().year &&
        rentdate.month != DateTime.now().month &&
        rentdate.day < DateTime.now().day) {
      property.rentee.totalAmount =
          (property.rentee.totalAmount - property.price).abs() +
              (property.price *
                      ((rentdate.year - DateTime.now().year).abs() * 12) +
                  property.price * (DateTime.now().month - rentdate.month));

      property.rentee.rentDate =
          DateTime(DateTime.now().year, DateTime.now().month, rentdate.day);
      updateProperty(property);
    }

    notifyListeners();
  }
}
