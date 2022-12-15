import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:rentapp/common/commonbutton.dart';
import 'package:rentapp/controller/provider.dart';
import 'package:rentapp/model/property.dart';

class PieChart extends StatefulWidget {
  Property getdetails;
  PieChart({super.key, required this.getdetails});

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  // final String _phoneNumber = '9816273940';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0, bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircularPercentIndicator(
              animation: true,
              radius: 83,
              lineWidth: 10,
              percent: 0.9,
              progressColor: const Color(0xFF5B67FE),
              backgroundColor: const Color(0xFFB3BBFE),
              circularStrokeCap: CircularStrokeCap.round,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '12',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'days left',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF9f9f9f),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Due Date',
                  style: TextStyle(
                    color: Color(0xFF9f9f9f),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  'May 21,2021',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Due Amount Rs ${widget.getdetails.rentee.dueAmount.toInt()}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF9f9f9f),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'Monthly Rs ${widget.getdetails.price.toInt()}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  shadowColor: Colors.blue,
                  text: 'Paid',
                  textColor: Colors.white,
                  onTap: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
