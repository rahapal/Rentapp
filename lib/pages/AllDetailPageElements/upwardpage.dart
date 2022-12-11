import 'package:flutter/material.dart';

class upwardpage extends StatefulWidget {
  const upwardpage({super.key});

  @override
  State<upwardpage> createState() => _upwardpageState();
}

class _upwardpageState extends State<upwardpage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: const Color(0xFFE0E5FF),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 3),
            child: IconButton(
              color: const Color(0xFFBDC1FF),
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Icon(
                Icons.more_vert,
                color: Color(0xFF9f9f9f),
              ),
            )),
      ],
    );
  }
}
