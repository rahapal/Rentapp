import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentapp/model/property.dart';

import '../../controller/provider.dart';
import '../filldetailspage/fillrenteedetails.dart';

class UserDetail extends StatefulWidget {
  Property getdetails;
  UserDetail({super.key, required this.getdetails});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PropertyProvider>(context);
    return GestureDetector(
      onTap: () {
        if (widget.getdetails.rentee.renteeName.isEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  FillRenteeDetails(getDetails: widget.getdetails),
            ),
          );
        }
      },
      child: Container(
        width: double.infinity,
        height: 120.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 25.r,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0.h),
          child: widget.getdetails.rentee.renteeName.isEmpty
              ? Center(
                  child: Text(
                    'Tap to Add Rentee Details',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(45.r),
                            child: Image.asset(
                              'assets/userface.png',
                              // height: 58,
                              // width: 58,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.getdetails.rentee.renteeName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.sp),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              widget.getdetails.rentee.renteeContact,
                              style: TextStyle(
                                color: const Color(0xFF9f9f9f),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    PhysicalModel(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Colors.white,
                      elevation: 5.0,
                      shadowColor: const Color(0xFF69AC65),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: const Color(0xFF69AC65),
                        ),
                        child: IconButton(
                          onPressed: () {
                            //show details name which is at index 0
                            //print(Rbox.getAt(0)!.name);
                          },
                          icon: const Icon(
                            Icons.message_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
