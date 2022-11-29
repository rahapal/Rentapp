import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rentapp/Hive_db/property.dart';

class RentedProperty extends StatefulWidget {
  const RentedProperty({super.key});

  @override
  State<RentedProperty> createState() => _RentedPropertyState();
}

class _RentedPropertyState extends State<RentedProperty> {
  late Box<Property> Pbox;
  String name = 'Commercial Shutter';
  String address = 'Trademall,Pokhara';
  String description = '12,00 sq.ft·2 rooms';
  String price = '15/month';
  @override
  void initState() {
    Pbox = Hive.box<Property>('property');
    Pbox.add(
      Property(
          name: name,
          address: address,
          description: description,
          price: price,
          image: '',
          type: '',
          status: '',
          id: ''),
    );
    super.initState();
    print("PBOX Values");
    print(Pbox.values);
  }

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
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  Pbox.getAt(0)!.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.5),
                ),
                SizedBox(height: 10),
                Text(
                  Pbox.getAt(0)!.address,
                  style: TextStyle(
                      color: Color(0xFF9f9f9f), fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  Pbox.getAt(0)!.description,
                  style: TextStyle(
                      color: Color(0xFF9f9f9f), fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  Pbox.getAt(0)!.price,
                  style: TextStyle(
                      color: Color(0xFF9f9f9f), fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        )
      ],
    );
    ;
  }
}
