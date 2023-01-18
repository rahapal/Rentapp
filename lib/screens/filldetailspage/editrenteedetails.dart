import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rentapp/controller/provider.dart';
import 'package:rentapp/model/payment.dart';
import 'package:rentapp/model/property.dart';
import 'package:rentapp/model/rentee.dart';
import 'package:rentapp/route/route.dart' as route;

import '../../common/global_variables.dart';

class EditRenteeDetail extends StatefulWidget {
  int getIndex;
  EditRenteeDetail({Key? key, required this.getIndex}) : super(key: key);

  @override
  State<EditRenteeDetail> createState() => _EditRenteeDetailState();
}

class _EditRenteeDetailState extends State<EditRenteeDetail> {
  File? _citizenImage;
  File? _agreementImage;
  TextEditingController _renteeName = TextEditingController();
  TextEditingController _renteeContact = TextEditingController();
  TextEditingController _renteeEmail = TextEditingController();
  TextEditingController _renteeBusinessName = TextEditingController();
  TextEditingController _renteeDueAmount = TextEditingController();
  TextEditingController _renteePanNumber = TextEditingController();
  TextEditingController _renteeAdvanceDeposit = TextEditingController();
  TextEditingController _agreementDateStart = TextEditingController();

  Future PickCitizenImage(ImageSource media) async {
    final Cimage = await ImagePicker().pickImage(source: media);
    if (Cimage == null) return;
    final CimageTemp = File(Cimage.path);

    setState(() {
      _citizenImage = CimageTemp;
      // _selected = _image;
    });
    return _citizenImage;
  }

  Future PickAgreementImage(ImageSource media) async {
    final Aimage = await ImagePicker().pickImage(source: media);
    if (Aimage == null) return;
    final AimageTemp = File(Aimage.path);

    setState(() {
      _agreementImage = AimageTemp;
      // _selected = _image;
    });
    return _agreementImage;
  }

  @override
  void initState() {
    var provider = Provider.of<PropertyProvider>(context, listen: false);
    _renteeName.text = provider.atIndex(widget.getIndex)!.rentee.renteeName;
    _renteeContact.text =
        provider.atIndex(widget.getIndex)!.rentee.renteeContact;
    _renteeEmail.text = provider.atIndex(widget.getIndex)!.rentee.renteeEmail;
    _renteeBusinessName.text =
        provider.atIndex(widget.getIndex)!.rentee.businessdetail;
    _renteeDueAmount.text =
        provider.atIndex(widget.getIndex)!.rentee.dueAmount.toString();
    _renteePanNumber.text =
        provider.atIndex(widget.getIndex)!.rentee.renteePanNumber;
    _renteeAdvanceDeposit.text =
        provider.atIndex(widget.getIndex)!.rentee.advanceAmount.toString();

    super.initState();
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
    _agreementDateStart.dispose();
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
                  Navigator.pushNamed(context, route.RouteManager.home);
                },
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 43.w, vertical: 20.w),
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
                    'Add new Profile',
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
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
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
                                'Business Name',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp),
                              ),
                            ),
                            TextFormField(
                              controller: _renteeBusinessName,
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
                                'Pan number',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp),
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _renteePanNumber,
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
                                'Due Amount',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp),
                              ),
                            ),
                            TextFormField(
                              controller: _renteeDueAmount,
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
                padding: EdgeInsets.only(right: 5.w, bottom: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: Text(
                        'Agreement date start',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16.sp),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.none,
                      controller: _agreementDateStart,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.calendar_today,
                        ),
                        filled: true,
                        fillColor: GlobalVariables.textFieldbackgroundColor,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.w),
                        hintText: 'Select date',
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
                      onTap: () async {
                        final DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (date != null) {
                          setState(() {
                            _agreementDateStart.text =
                                DateTime(date.year, date.month, date.day)
                                    .toString()
                                    .substring(0, 10);
                          });
                        }
                      },
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
                          onPressed: () {
                            PickCitizenImage(ImageSource.gallery)
                                .then((value) => setState(() {
                                      _citizenImage = value;
                                    }));
                          },
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
                          onPressed: () {
                            PickAgreementImage(ImageSource.gallery)
                                .then((value) => setState(() {
                                      _agreementImage = value;
                                    }));
                          },
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              width: 2.w,
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
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          _citizenImage != null
                              ? Image.file(
                                  File(_citizenImage!.path),
                                  height: 100,
                                  width: 100,
                                )
                              : const SizedBox.shrink(),
                          SizedBox(
                            width: 10.w,
                          ),
                          _agreementImage != null
                              ? Image.file(
                                  File(_agreementImage!.path),
                                  height: 100,
                                  width: 100,
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50.h),
                ),
                onPressed: () {
                  provider.updateProperty(Property(
                      propertyName:
                          provider.getDetails(widget.getIndex).propertyName,
                      address: provider.getDetails(widget.getIndex).address,
                      description:
                          provider.getDetails(widget.getIndex).description,
                      price: provider.getDetails(widget.getIndex).price,
                      size: provider.getDetails(widget.getIndex).size,
                      propertyId:
                          provider.getDetails(widget.getIndex).propertyId,
                      status: 'paid',
                      index: widget.getIndex,
                      fieldStatus: true,
                      rentee: Rentee(
                        renteeId: provider
                            .getDetails(widget.getIndex)
                            .rentee
                            .renteeId,
                        renteeName: _renteeName.text,
                        renteeEmail: _renteeEmail.text,
                        renteeContact: _renteeContact.text,
                        dueAmount: int.parse(_renteeDueAmount.text),
                        agreementimage: _agreementImage.toString(),
                        citizenimage: _citizenImage.toString(),
                        businessdetail: _renteeBusinessName.text,
                        renteePanNumber: _renteePanNumber.text,
                        agreementDate: '',
                        renteePayment: Payment(
                          paymentId: provider
                              .getDetails(widget.getIndex)
                              .rentee
                              .renteePayment
                              .paymentId,
                          paymentDate: provider
                              .getDetails(widget.getIndex)
                              .rentee
                              .renteePayment
                              .paymentDate,
                          payedAmount: provider
                              .getDetails(widget.getIndex)
                              .rentee
                              .renteePayment
                              .payedAmount,
                          paymentNote: provider
                              .getDetails(widget.getIndex)
                              .rentee
                              .renteePayment
                              .paymentNote,
                          fieldIndex: widget.getIndex,
                        ),
                      )));
                  //Navigator.pushNamed(context, route.RouteManager.viewpage);
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
