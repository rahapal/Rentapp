import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    var provider = Provider.of<PropertyProvider>(context);
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Rented Property',
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
            ),
            const Text(
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
              borderRadius: BorderRadius.circular(10.r),
              child: SizedBox.fromSize(
                size: Size.fromRadius(80.r),
                child: Image.asset(
                  'assets/house.png',
                  // height: 58,
                  // width: 58,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.getdetails.propertyName,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 14.5.sp),
                ),
                SizedBox(height: 10.h),
                Text(
                  widget.getdetails.address,
                  style: const TextStyle(
                      color: Color(0xFF9f9f9f), fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.h),
                Text(
                  widget.getdetails.size,
                  style: const TextStyle(
                      color: Color(0xFF9f9f9f), fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Rs ${provider.getDetails(widget.getdetails.index).price}/ month',
                  style: const TextStyle(
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
