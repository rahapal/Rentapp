import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rentapp/model/property.dart';
import 'package:rentapp/model/rentee.dart';

class RentedPropertyDetails extends StatefulWidget {
  const RentedPropertyDetails({super.key});

  @override
  State<RentedPropertyDetails> createState() => _RentedPropertyDetailsState();
}

class _RentedPropertyDetailsState extends State<RentedPropertyDetails> {
  // late Box<Property> Pbox;
  // String name = 'Commercial Shutter';
  // String address = 'Trademall,Pokhara';
  // String description = '12,00 sq.ft·2 rooms';
  // String price = '15/month';
  // @override
  // void initState() {
  //   Pbox = Hive.box<Property>('property');
  //   Pbox.add(
  //     Property(
  //         name: name,
  //         address: address,
  //         description: description,
  //         price: price,
  //         image: '',
  //         size: '',
  //         status: '',
  //         propertyId: '',
  //         rentee: Rentee(
  //           agreementimage: '',
  //           citizenimage: '',
  //           businessdetail: '',
  //           renteeId: '',
  //           renteeContact: '',
  //           renteeEmail: '',
  //           renteeName: '',
  //         )),
  //   );
  //   super.initState();
  //   print("PBOX Values");
  //   print(Pbox.values);
  // }

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
              children: const [
                Text(
                  'Hi',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.5),
                ),
                SizedBox(height: 10),
                Text(
                  'Hello',
                  style: TextStyle(
                      color: Color(0xFF9f9f9f), fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Kcha',
                  style: TextStyle(
                      color: Color(0xFF9f9f9f), fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'thikcha',
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
