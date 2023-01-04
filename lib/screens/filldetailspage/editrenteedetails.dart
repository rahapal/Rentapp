import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentapp/controller/provider.dart';
import 'package:rentapp/model/payment.dart';
import 'package:rentapp/model/property.dart';
import 'package:rentapp/model/rentee.dart';

import '../../common/global_variables.dart';

class EditRenteeDetails extends StatefulWidget {
  Property getDetails;
  EditRenteeDetails({Key? key, required this.getDetails}) : super(key: key);

  @override
  State<EditRenteeDetails> createState() => _EditRenteeDetailsState();
}

class _EditRenteeDetailsState extends State<EditRenteeDetails> {
  TextEditingController _renteeName = TextEditingController();
  TextEditingController _renteeContact = TextEditingController();
  TextEditingController _renteeEmail = TextEditingController();
  TextEditingController _renteeBusinessName = TextEditingController();
  TextEditingController _renteeDueAmount = TextEditingController();
  TextEditingController _renteePanNumber = TextEditingController();
  TextEditingController _renteeAdvanceDeposit = TextEditingController();

  @override
  void initState() {
    super.initState();
    _renteeName.text = widget.getDetails.rentee.renteeName;
    _renteeContact.text = widget.getDetails.rentee.renteeContact;
    _renteeEmail.text = widget.getDetails.rentee.renteeEmail;
    _renteeBusinessName.text = widget.getDetails.rentee.businessdetail;
    _renteeDueAmount.text = widget.getDetails.rentee.dueAmount.toString();
    _renteePanNumber.text = widget.getDetails.rentee.renteePanNumber;
    _renteeAdvanceDeposit.text =
        widget.getDetails.rentee.advanceAmount.toString();
  }

  @override
  void dispose() {
    _renteeName.dispose();
    _renteeContact.dispose();
    _renteeEmail.dispose();
    _renteeBusinessName.dispose();
    _renteeDueAmount.dispose();
    _renteePanNumber.dispose();
    _renteeAdvanceDeposit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PropertyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        automaticallyImplyLeading: false,
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
                },
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 43.w, vertical: 20.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/user.png',
                    height: 23.h,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'Edit Profile',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 38.h,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 17.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rentee Name',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    TextFormField(
                      controller: _renteeName,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: GlobalVariables.textFieldbackgroundColor,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.w),
                        hintText: 'Enter full name',
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0.r),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: GlobalVariables.textFieldborderColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 17.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mobile number',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    TextFormField(
                      controller: _renteeContact,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: GlobalVariables.textFieldbackgroundColor,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.w),
                        hintText: '+977',
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0.r),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: GlobalVariables.textFieldborderColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 17.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'E-mail',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    TextFormField(
                      controller: _renteeEmail,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: GlobalVariables.textFieldbackgroundColor,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.w),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0.r),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: GlobalVariables.textFieldborderColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 17.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Business name',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    TextFormField(
                      controller: _renteeBusinessName,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: GlobalVariables.textFieldbackgroundColor,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.w),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0.r),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: GlobalVariables.textFieldborderColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 17.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rentee Due Amount',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    TextFormField(
                      controller: _renteeDueAmount,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: GlobalVariables.textFieldbackgroundColor,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.w),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0.r),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: GlobalVariables.textFieldborderColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 12.h),
                              child: Text(
                                'Pan number',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp),
                              ),
                            ),
                            TextFormField(
                              textAlign: TextAlign.end,
                              controller: _renteePanNumber,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    GlobalVariables.textFieldbackgroundColor,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 20.w),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0.r),
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: GlobalVariables.textFieldborderColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 12.h),
                              child: Text(
                                'Advance deposit',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp),
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _renteeAdvanceDeposit,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    GlobalVariables.textFieldbackgroundColor,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 10.w),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0.r),
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: GlobalVariables.textFieldborderColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 17.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Documents',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Citizenship',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16.sp),
                        ),
                        SizedBox(
                          width: 66.w,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              width: 2.0.w,
                              color: const Color(0xFFBDC1FF),
                            ),
                            backgroundColor: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/upload.png',
                                height: 23.h,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'Upload an image',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'Rentee Agreement',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16.sp),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              width: 2.0.w,
                              color: const Color(0xFFBDC1FF),
                            ),
                            backgroundColor: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/upload.png',
                                height: 23.h,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'Upload an image',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50.h),
                ),
                onPressed: () {
                  final property = Property(
                    propertyId: widget.getDetails.propertyId,
                    propertyName: widget.getDetails.propertyName,
                    price: widget.getDetails.price,
                    address: widget.getDetails.address,
                    size: widget.getDetails.size,
                    index: widget.getDetails.index,
                    fieldStatus: widget.getDetails.fieldStatus,
                    rentee: Rentee(
                        renteeId: widget.getDetails.rentee.renteeId,
                        renteeName: _renteeName.text,
                        renteeEmail: _renteeEmail.text,
                        renteeContact: _renteeContact.text,
                        businessdetail: _renteeBusinessName.text,
                        agreementimage: '',
                        citizenimage: '',
                        dueAmount: int.parse(_renteeDueAmount.text),
                        renteePanNumber: _renteePanNumber.text,
                        renteePayment: Payment(
                          paymentId: '',
                          paymentDate: DateTime.now(),
                          paymentNote: '',
                          fieldIndex: widget.getDetails.index,
                        )),
                    description: '',
                    image: '',
                    status: widget.getDetails.status,
                  );

                  provider.addProperty(property);
                  Navigator.pop(context);
                },
                child: const Text('Save Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
