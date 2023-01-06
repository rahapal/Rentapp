import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:rentapp/common/commonbutton.dart';
import 'package:rentapp/controller/provider.dart';
import 'package:rentapp/model/payment.dart';
import 'package:rentapp/model/property.dart';
import 'package:uuid/uuid.dart';

class PieChart extends StatefulWidget {
  Property getdetails;
  PieChart({super.key, required this.getdetails});

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  String formattedDate = DateFormat.yMMMEd().format(DateTime.now());
  late Timer timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      Provider.of<PropertyProvider>(context, listen: false)
          .showPaymentsDetails();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PropertyProvider>(context);
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(bottom: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircularPercentIndicator(
              animation: true,
              radius: 90.r,
              lineWidth: 10.w,
              percent: 0.9,
              progressColor: const Color(0xFF5B67FE),
              backgroundColor: const Color(0xFFB3BBFE),
              circularStrokeCap: CircularStrokeCap.round,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '12',
                    style: TextStyle(
                      fontSize: 35.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'days left',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF9f9f9f),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Due Date',
                  style: TextStyle(
                    color: const Color(0xFF9f9f9f),
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  formattedDate,
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Due Amount Rs ${widget.getdetails.rentee.dueAmount.toInt()}',
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: const Color(0xFF9f9f9f),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Monthly Rs ${widget.getdetails.price.toInt()}',
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomButton(
                  shadowColor: Colors.blue,
                  text: 'Pay',
                  textColor: Colors.white,
                  onTap: () async {
                    // var paymentbox = await Hive.openBox<Payment>('payment');
                    provider.paymentAdd(
                      widget.getdetails.index,
                      Payment(
                        paymentId: const Uuid().v4(),
                        paymentDate: formattedDate,
                        paymentNote: '',
                        refDate: DateTime.now(),
                        payedAmount: widget.getdetails.price.toInt(),
                        fieldIndex: widget.getdetails.index,
                      ),
                      widget.getdetails.rentee.renteeName,
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
