import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:rentapp/controller/provider.dart';

import 'package:rentapp/model/property.dart';

class PaymentHistory extends StatefulWidget {
  final Property property;

  const PaymentHistory(this.property, {super.key});

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PropertyProvider>(context);
    final payments = provider.getPaymentsIn(widget.property.index);
    return SizedBox(
      //height: 300.h,
      child: Padding(
        padding: EdgeInsets.only(
          right: 20.w,
          left: 20.w,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'History',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Total Rs${payments.fold(0, (sum, payment) => sum + payment.payedAmount)}',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 250.h,
              child: ListView.builder(
                itemCount: payments.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 55.h,
                                width: 55.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.r),
                                  border: Border.all(
                                    color: const Color(0xFFE0E5FF),
                                  ),
                                ),
                                child: Image.asset(
                                  "assets/cashlogo.png",
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cash',
                                    // provider.payedList[index]{"paymentId,
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    payments[index].paymentDate,
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        color: const Color(0xFF9f9f9f),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            payments[index].payedAmount.toString(),
                            // payments[index].payedAmount.toString(),
                            style: TextStyle(
                                fontSize: 17.sp, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
