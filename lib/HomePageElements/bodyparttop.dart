import 'package:flutter/material.dart';
import 'package:rentapp/HomePageElements/bodypart.dart';

class bodytoppart extends StatelessWidget {
  const bodytoppart({super.key});

  @override
  Widget build(BuildContext context) {
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
                    border: Border.all(color: Color(0xFF9f9f9f)),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Empty(${tables.where((element) => element.statusName == 'empty').length})',
                  style: const TextStyle(
                    color: Color(0xFF9f9f9f),
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
                  'Unpaid(${tables.where((element) => element.statusName == 'unpaid').length})',
                  style: const TextStyle(
                    color: Color(0xFF9f9f9f),
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
                  'Paid(${tables.where((element) => element.statusName == 'paid').length})',
                  style: const TextStyle(
                    color: Color(0xFF9f9f9f),
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
