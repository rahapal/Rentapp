import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentapp/model/property.dart';

import '../../controller/provider.dart';

class RentedPropertyDetails extends StatefulWidget {
  Property getdetails;
  RentedPropertyDetails({super.key, required this.getdetails});

  @override
  State<RentedPropertyDetails> createState() => _RentedPropertyDetailsState();
}

class _RentedPropertyDetailsState extends State<RentedPropertyDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            Text(
              'Rented Property',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'View all',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF9f9f9f)),
            ),
          ],
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox.fromSize(
                size: Size.fromRadius(70),
                child: Image.asset(
                  'assets/house.png',
                  // height: 58,
                  // width: 58,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.getdetails.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.5),
                ),
                SizedBox(height: 10),
                Text(
                  widget.getdetails.address,
                  style: TextStyle(
                      color: Color(0xFF9f9f9f), fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  widget.getdetails.size,
                  style: TextStyle(
                      color: Color(0xFF9f9f9f), fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '${widget.getdetails.price}/month',
                  style: TextStyle(
                      color: Color(0xFF9f9f9f), fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
