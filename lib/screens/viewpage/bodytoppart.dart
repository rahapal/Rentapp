import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../controller/provider.dart';

class BodyTopPart extends StatelessWidget {
  const BodyTopPart({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PropertyProvider>(context);
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
            left: 20.0.w, right: 20.0.w, top: 20.h, bottom: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 10.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFF9f9f9f)),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  'Empty (${provider.getEmptyLength()})',
                  style: const TextStyle(
                    color: Color(0xFF9F9F9F),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 10.w,
                  height: 10.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  'Unpaid(${provider.property.where((element) => element.status == 'unpaid').length})',
                  style: const TextStyle(
                    color: Color(0xFF9F9F9F),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 10.w,
                  height: 10.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF3abd40),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  'Paid (${provider.property.where((element) => element.status == 'paid').length})',
                  style: const TextStyle(
                    color: Color(0xFF9F9F9F),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
