import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rentapp/controller/provider.dart';
import 'package:rentapp/model/payment.dart';

class CollectionRent extends StatefulWidget {
  const CollectionRent({Key? key});

  @override
  State<CollectionRent> createState() => _CollectionRentState();
}

class _CollectionRentState extends State<CollectionRent> {
  List<String> items = <String>['This Month'];
  String dropdownValue = 'This Month';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PropertyProvider>(context);
    final paymentBox = Hive.box<Payment>('payment');

    int collectedAmount = 0;
    for (var i = 0; i < paymentBox.length; i++) {
      final payment = paymentBox.getAt(i);
      if (payment != null) {
        collectedAmount += payment.payedAmount;
      }
    }

    // Check if provider.property is not empty before reducing
    int totalPendingAmount = provider.property.isEmpty
        ? 0
        : provider.property
            .map((property) => property.rentee.totalAmount)
            .reduce((value, element) => value + element);

    return Container(
      height: 324.h,
      width: 398.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Collection Rent',
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                ),
                DropdownButton<String>(
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  value: dropdownValue,
                  items: items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            Text(
              'Total Amount',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Rs${collectedAmount + totalPendingAmount}',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Container(
                  height: 152.h,
                  width: 178.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      bottomLeft: Radius.circular(10.r),
                    ),
                    color: const Color(0xFFF8F7FE),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Collected',
                        style: TextStyle(
                            fontSize: 21.sp, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Rs$collectedAmount',
                        style: TextStyle(
                            fontSize: 24.sp, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 152.h,
                  width: 178.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    ),
                    color: const Color(0xFF5B67FE).withOpacity(0.85),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Pending',
                        style: TextStyle(
                            fontSize: 21.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Text(
                        'Rs$totalPendingAmount',
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
