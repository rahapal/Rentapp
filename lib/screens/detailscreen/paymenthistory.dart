import 'package:flutter/material.dart';
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
    var provider = Provider.of<PropertyProvider>(context);

    var payments = provider.getPaymentsIn(widget.property.index);
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
        ),
        child: ListView.builder(
          itemCount: payments.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: const Color(0xFFE0E5FF),
                            ),
                          ),
                          child: Image.asset(
                            "assets/cashlogo.png",
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Cash',
                              // provider.payedList[index]{"paymentId,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              payments[index].paymentDate.toString(),
                              style: const TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFF9f9f9f),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      payments[index].payedAmount.toString(),
                      // payments[index].payedAmount.toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
