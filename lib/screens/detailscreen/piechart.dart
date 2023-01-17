import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:rentapp/common/commonbutton.dart';
import 'package:rentapp/controller/provider.dart';

import 'package:rentapp/model/property.dart';
import 'package:uuid/uuid.dart';

import '../../common/global_variables.dart';
import '../../model/payment.dart';

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

  TextEditingController _payAmount = TextEditingController();

  @override
  void dispose() {
    timer.cancel();
    _payAmount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<PropertyProvider>(context);
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
            Consumer<PropertyProvider>(builder: (context, val, child) {
              return Column(
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
                    height: 3.h,
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
                    'Due Amount Rs ${val.getDetails(widget.getdetails.index).rentee.dueAmount.toInt() + val.getDetails(widget.getdetails.index).price.toInt()}',
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: const Color(0xFF9f9f9f),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomButton(
                    shadowColor: Colors.blue,
                    text: 'Pay',
                    textColor: Colors.white,
                    onTap: () async {
                      if (widget.getdetails.rentee.renteeName == '') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Fill the rentee details first'),
                          ),
                        );
                      } else {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (_) {
                              return Dialog(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 200,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2, right: 2),
                                        child: Container(
                                          alignment: FractionalOffset.topRight,
                                          child: GestureDetector(
                                            child: Icon(
                                              size: 30.sp,
                                              Icons.clear,
                                              color: Colors.red,
                                            ),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Paid Amount',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.sp),
                                      ),
                                      SizedBox(
                                        height: 25.h,
                                      ),
                                      SizedBox(
                                        width: 200.w,
                                        child: TextFormField(
                                          controller: _payAmount,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: GlobalVariables
                                                .textFieldbackgroundColor,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 10.h,
                                                    horizontal: 10.w),
                                            hintText: 'Enter Amount paid',
                                            hintStyle: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5.0),
                                              ),
                                            ),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: GlobalVariables
                                                    .textFieldborderColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            if ((widget.getdetails.rentee
                                                        .dueAmount
                                                        .toInt() +
                                                    widget.getdetails.price) <
                                                int.parse(_payAmount.text)) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      'Enter the amount below or equal ${widget.getdetails.rentee.dueAmount.toInt() + widget.getdetails.price}'),
                                                ),
                                              );
                                            } else if ((int.parse(
                                                        _payAmount.text) -
                                                    widget.getdetails.price) ==
                                                widget
                                                    .getdetails.rentee.dueAmount
                                                    .toInt()) {
                                              val.paymentAdd(
                                                widget.getdetails.index,
                                                Payment(
                                                  paymentId: const Uuid().v4(),
                                                  paymentDate: formattedDate,
                                                  paymentNote: '',
                                                  refDate: DateTime.now(),
                                                  payedAmount: int.parse(
                                                      _payAmount.text),
                                                  fieldIndex:
                                                      widget.getdetails.index,
                                                ),
                                                widget.getdetails.rentee
                                                    .renteeName,
                                              );
                                              val.updateDueAmount(
                                                  widget.getdetails.propertyId,
                                                  0);
                                            } else if (int.parse(
                                                    _payAmount.text) <
                                                val
                                                        .getDetails(widget
                                                            .getdetails.index)
                                                        .rentee
                                                        .dueAmount
                                                        .toInt() +
                                                    val
                                                        .getDetails(widget
                                                            .getdetails.index)
                                                        .price
                                                        .toInt()) {
                                              val.paymentAdd(
                                                widget.getdetails.index,
                                                Payment(
                                                  paymentId: const Uuid().v4(),
                                                  paymentDate: formattedDate,
                                                  paymentNote: '',
                                                  refDate: DateTime.now(),
                                                  payedAmount: int.parse(
                                                      _payAmount.text),
                                                  fieldIndex:
                                                      widget.getdetails.index,
                                                ),
                                                widget.getdetails.rentee
                                                    .renteeName,
                                              );
                                              val.updateDueAmount(
                                                  widget.getdetails.propertyId,
                                                  val
                                                          .getDetails(widget
                                                              .getdetails.index)
                                                          .rentee
                                                          .dueAmount
                                                          .toInt() +
                                                      val
                                                          .getDetails(widget
                                                              .getdetails.index)
                                                          .price
                                                          .toInt() -
                                                      int.parse(
                                                          _payAmount.text));
                                            }
                                            _payAmount.clear();
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Pay'))
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                      //  else {
                      //   provider.paymentAdd(
                      //     widget.getdetails.index,
                      //     Payment(
                      //       paymentId: const Uuid().v4(),
                      //       paymentDate: formattedDate,
                      //       paymentNote: '',
                      //       refDate: DateTime.now(),
                      //       payedAmount: widget.getdetails.price.toInt(),
                      //       fieldIndex: widget.getdetails.index,
                      //     ),
                      //     widget.getdetails.rentee.renteeName,
                      //   );
                      // }
                    },
                  ),
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
