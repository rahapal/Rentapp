import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFF9f9f9f)),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Empty (${provider.property.where((element) => element.status == 'Empty').length})',
                  //'Empty(${tables.where((element) => element.statusName == 'empty').length})',

                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Unpaid(${provider.property.where((element) => element.status == 'Unpaid').length})',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF3abd40),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Paid (${provider.property.where((element) => element.status == 'Paid').length})',
                  style: const TextStyle(
                    color: Colors.black,
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
