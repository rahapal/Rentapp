import 'package:flutter/material.dart';

class HistoryTopBar extends StatefulWidget {
  const HistoryTopBar({super.key});

  @override
  State<HistoryTopBar> createState() => _HistoryTopBarState();
}

class _HistoryTopBarState extends State<HistoryTopBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'History',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Total 75k',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
