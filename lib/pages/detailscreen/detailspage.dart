import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentapp/controller/provider.dart';
import 'package:rentapp/model/property.dart';
import 'package:rentapp/pages/filldetailspage/fillrenteedetails.dart';
import 'package:rentapp/route/route.dart' as route;

import 'historytopbar.dart';
import 'paymenthistory.dart';
import 'piechart.dart';
import 'rentedpropertydetails.dart';
import 'userdetail.dart';

class DetailsPage extends StatefulWidget {
  Property getdetails;
  DetailsPage({Key? key, required this.getdetails}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAECFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(
            bottom: 8,
            left: 16,
            top: 8,
          ),
          child: Container(
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
                  Navigator.pushNamed(context, route.RouteManager.home);
                },
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 8,
              bottom: 5,
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FillRenteeDetails(
                              getDetails: widget.getdetails)));
                },
                icon: const Icon(
                  size: 27,
                  Icons.more_vert,
                  color: Color(0xFF9f9f9f),
                )),
          ),
        ],
        //this helps to disable default back button of appbar
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 520,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF5b67fe).withOpacity(0.3),
                    blurRadius: 25,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    //upwardpage(),
                    SizedBox(
                      height: 10,
                    ),
                    PieChart(),
                    SizedBox(
                      height: 10,
                    ),
                    UserDetail(getdetails: widget.getdetails),
                    SizedBox(
                      height: 37,
                    ),
                    RentedPropertyDetails(getdetails: widget.getdetails),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const HistoryTopBar(),
            const SizedBox(
              height: 15,
            ),
            const PaymentHistory(),
          ],
        ),
      ),
    );
  }
}
