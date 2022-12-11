import 'package:flutter/material.dart';

import 'package:rentapp/Common/commonButton.dart';

import 'package:rentapp/Routes/Route.dart';
import 'package:rentapp/pages/viewpage/bodytoppart.dart';

class TableTileData {
  int status;
  int number;
  TableTileData({this.status = 0, required this.number});
  String get statusName => status == 0
      ? 'empty'
      : status == 1
          ? "unpaid"
          : "paid";
}

class bodypart extends StatefulWidget {
  const bodypart({super.key});

  @override
  State<bodypart> createState() => _bodypartState();
}

List<TableTileData> tables = [
  TableTileData(status: 0, number: 1),
  TableTileData(status: 1, number: 2),
  TableTileData(status: 2, number: 3),
  TableTileData(status: 2, number: 4),
  TableTileData(status: 0, number: 5),
  TableTileData(status: 2, number: 6),
  TableTileData(status: 2, number: 7),
  TableTileData(status: 2, number: 8),
  TableTileData(status: 2, number: 9),
  TableTileData(status: 2, number: 10),
  TableTileData(status: 2, number: 11),
  TableTileData(status: 2, number: 12),
  TableTileData(status: 1, number: 13),
  TableTileData(status: 2, number: 14),
  TableTileData(status: 1, number: 15),
  TableTileData(status: 1, number: 16),
  TableTileData(status: 1, number: 17),
  TableTileData(status: 2, number: 18),
  TableTileData(status: 2, number: 19),
  TableTileData(status: 1, number: 20),
  TableTileData(status: 0, number: 21),
  TableTileData(status: 2, number: 22),
  TableTileData(status: 2, number: 23),
  TableTileData(status: 1, number: 24),
  TableTileData(status: 2, number: 25),
  TableTileData(status: 2, number: 26),
  TableTileData(status: 1, number: 27),
  TableTileData(status: 1, number: 28),
  TableTileData(status: 1, number: 29),
  TableTileData(status: 1, number: 30),
  TableTileData(status: 2, number: 31),
  TableTileData(status: 0, number: 32),
  TableTileData(status: 2, number: 33),
  TableTileData(status: 1, number: 34),
  TableTileData(status: 1, number: 35),
  TableTileData(status: 0, number: 36),
  TableTileData(status: 0, number: 37),
  TableTileData(status: 1, number: 38),
  TableTileData(status: 2, number: 39),
  TableTileData(status: 2, number: 40),
  TableTileData(status: 1, number: 41),
  TableTileData(status: 1, number: 42),
  TableTileData(status: 1, number: 43),
  TableTileData(status: 0, number: 44),
  TableTileData(status: 1, number: 45),
];

// List<Trying> trying = [
//   Trying(status: 'empty'),
//   Trying(status: 'unpaid'),
//   Trying(status: 'paid'),
//   Trying(status: 'paid'),
//   Trying(status: 'empty'),
//   Trying(status: 'paid'),
//   Trying(status: 'paid'),
//   Trying(status: 'paid'),
//   Trying(status: 'paid'),
//   Trying(status: 'paid'),
//   Trying(status: 'paid'),
//   Trying(status: 'paid'),
//   Trying(status: 'unpaid'),
//   Trying(status: 'paid'),
//   Trying(status: 'unpaid'),
//   Trying(status: 'unpaid'),
//   Trying(status: 'unpaid'),
//   Trying(status: 'paid'),
//   Trying(status: 'paid'),
//   Trying(status: 'unpaid'),
//   Trying(status: 'empty'),
//   Trying(status: 'paid'),
//   Trying(status: 'paid'),
//   Trying(status: 'unpaid'),
//   Trying(status: 'paid'),
//   Trying(status: 'paid'),
//   Trying(status: 'unpaid'),
//   Trying(status: 'unpaid'),
//   Trying(status: 'unpaid'),
//   Trying(status: 'unpaid'),
//   Trying(status: 'unpaid'),
//   Trying(status: 'paid'),
//   Trying(status: 'paid'),
//   Trying(status: 'paid'),
//   Trying(status: 'unpaid'),
//   Trying(status: 'unpaid'),
//   Trying(status: 'paid'),
//   Trying(status: 'paid'),
//   Trying(status: 'paid'),
//   Trying(status: 'unpaid'),
//   Trying(status: 'unpaid'),
//   Trying(status: 'paid'),
//   Trying(status: 'empty'),
//   Trying(status: 'paid'),
//   Trying(status: 'empty'),
// ];
// final List<int> number = [
//   1,
//   2,
//   3,
//   4,
//   10,
//   11,
//   12,
//   13,
//   14,
//   15,
//   16,
//   17,
//   18,
//   19,
//   20,
//   21,
//   22,
//   23,
//   24,
//   25,
//   26,
//   27,
//   28,
//   29,
//   30,
//   31,
//   32,
//   33,
//   34,
//   35,
//   36,
//   37,
//   38,
//   39,
//   40,
//   41,
//   42,
//   43,
//   44,
//   45,
//   46,
//   47,
//   48,
//   49,
//   50
// ];

// class Trying {
//   String status;

//   Trying({
//     required this.status,
//   });
// }

class _bodypartState extends State<bodypart> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BodyTopPart(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: GridView.builder(
                  itemCount: tables.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        height: 100,
                        width: 100,
                        child: CustomButton(
                          shadowColor: Colors.black,
                          onTap: () {
                            // print('${trying.elementAt(index).status}');

                            //length of paid
                            // print(trying
                            // .where((element) => element.status == 'paid')
                            // .length);

                            //navigate to second page
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => Secondpage(),
                            //   ),
                            // );
                            Navigator.pushNamed(
                                context, RouteManager.secondpage);
                          },
                          text: '${tables.elementAt(index).number}',
                          textColor:
                              tables.elementAt(index).statusName == 'empty'
                                  ? Colors.black
                                  : Colors.white,
                          color: tables.elementAt(index).statusName == 'paid'
                              ? Color(0xFF3abd40)
                              : tables.elementAt(index).statusName == 'unpaid'
                                  ? Color(0xFFef4646)
                                  : tables.elementAt(index).statusName ==
                                          'empty'
                                      ? Colors.white
                                      : Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
