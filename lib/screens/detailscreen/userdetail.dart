import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentapp/controller/provider.dart';
import 'package:rentapp/model/property.dart';
import 'package:url_launcher/url_launcher.dart';

import '../filldetailspage/fillrenteedetails.dart';

class UserDetail extends StatefulWidget {
  Property getdetails;
  UserDetail({super.key, required this.getdetails});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  Future<void>? _launched;
  bool _hasCallSupport = false;
  @override
  void initState() {
    super.initState();
    // Check for phone call support.
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (!await launchUrl(launchUri)) {
      throw 'Could not launch $launchUri';
    }
  }

  Future<void> _makeSms(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
    );
    if (!await launchUrl(launchUri)) {
      throw 'Could not launch $launchUri';
    }
  }

  Future<void> _makeMail(String email) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (!await launchUrl(launchUri)) {
      throw 'Could not launch $launchUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PropertyProvider>(context);
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
          padding: EdgeInsets.all(15.0.h),
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
                      children: [
                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(10.r),
                        //   child: SizedBox.fromSize(
                        //     size: Size.fromRadius(45.r),
                        //     child: Image.file(
                        //       File(widget.getdetails.rentee.citizenimage),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              provider
                                  .getDetails(widget.getdetails.index)
                                  .rentee
                                  .renteeName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.sp),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              provider
                                  .getDetails(widget.getdetails.index)
                                  .rentee
                                  .renteeContact,
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
                    // PhysicalModel(
                    //   borderRadius: BorderRadius.circular(15.r),
                    //   color: Colors.white,
                    //   elevation: 5.0,
                    //   shadowColor: const Color(0xFF69AC65),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(15.r),
                    //       color: const Color(0xFF69AC65),
                    //     ),
                    // child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: _hasCallSupport
                              ? () => setState(() {
                                    _launched = _makePhoneCall(
                                        widget.getdetails.rentee.renteeContact);
                                  })
                              : null,
                          icon: _hasCallSupport
                              ? Icon(
                                  size: 30.h,
                                  Icons.call_outlined,
                                  color: Colors.black,
                                )
                              : Icon(
                                  size: 30.h,
                                  Icons.do_not_disturb,
                                  color: Colors.black,
                                ),
                        ),
                        IconButton(
                          onPressed: () => _makeSms(
                              '+977${widget.getdetails.rentee.renteeContact}'),
                          icon: _hasCallSupport
                              ? Icon(
                                  size: 30.h,
                                  Icons.message_outlined,
                                  color: Colors.black,
                                )
                              : Icon(
                                  size: 30.h,
                                  Icons.do_not_disturb,
                                  color: Colors.black,
                                ),
                        ),
                        IconButton(
                          onPressed: _hasCallSupport
                              ? () => setState(() {
                                    _launched = _makeMail(
                                        widget.getdetails.rentee.renteeEmail);
                                  })
                              : null,
                          icon: _hasCallSupport
                              ? Icon(
                                  size: 30.h,
                                  Icons.mail_outline,
                                  color: Colors.black,
                                )
                              : Icon(
                                  size: 30.h,
                                  Icons.do_not_disturb,
                                  color: Colors.black,
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
