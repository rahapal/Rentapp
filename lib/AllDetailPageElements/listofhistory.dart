import 'package:flutter/material.dart';

class ListOfHistory extends StatefulWidget {
  const ListOfHistory({super.key});

  @override
  State<ListOfHistory> createState() => _ListOfHistoryState();
}

class _ListOfHistoryState extends State<ListOfHistory> {
  List images = [
    'assets/khaltilogo.png',
    'assets/fonepaylogo.png',
    'assets/cashlogo.png',
  ];
  var names = [
    'Khalti',
    'Fonepay',
    'Cash',
  ];
  var paiddate = [
    'Mar 21,2021',
    'Feb 21 2021',
    'Jan 21 2021',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
        ),
        child: ListView.builder(
          itemCount: 3,
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
                            images[index],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              names[index],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              paiddate[index],
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFF9f9f9f),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      '+ 15K',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
