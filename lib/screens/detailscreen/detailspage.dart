import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:rentapp/model/property.dart';
import 'package:rentapp/screens/filldetailspage/editrenteedetails.dart';

import '../../controller/provider.dart';
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
          padding: EdgeInsets.only(
            bottom: 8.h,
            left: 16.w,
            top: 8.h,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(
                color: const Color(0xFFE0E5FF),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 3.w),
              child: IconButton(
                  color: const Color(0xFFBDC1FF),
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 8.w,
              bottom: 5.h,
            ),
            child: PopupMenuButton(
              onSelected: (value) {
                if (value == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditRenteeDetails(
                        getDetails: widget.getdetails,
                      ),
                    ),
                  );
                }
              },
              offset: const Offset(0, 40),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              icon: const Icon(
                Icons.more_vert,
                color: Color(0xFF9f9f9f),
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Text(
                        'Edit',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
              height: 684.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF5b67fe).withOpacity(0.3),
                    blurRadius: 25.r,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10.h,
                    ),
                    //upwardpage(),
                    SizedBox(
                      height: 10.h,
                    ),
                    PieChart(getdetails: widget.getdetails),
                    SizedBox(
                      height: 10.h,
                    ),

                    Consumer<PropertyProvider>(
                        builder: (context, propProvider, child) {
                      Property? foundProperty;

                      var properties = propProvider.property.where((element) {
                        return element.propertyId ==
                            widget.getdetails.propertyId;
                      }).toList();

                      if (properties.length > 0) {
                        foundProperty = properties[0];
                        return UserDetail(getdetails: foundProperty);
                      } else {
                        return const Text("User not found");
                      }
                    }),
                    SizedBox(
                      height: 37.h,
                    ),
                    RentedPropertyDetails(getdetails: widget.getdetails),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            const HistoryTopBar(),
            SizedBox(
              height: 15.h,
            ),
            PaymentHistory(widget.getdetails),
          ],
        ),
      ),
    );
  }
}
