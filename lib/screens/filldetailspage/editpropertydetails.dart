import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rentapp/common/global_variables.dart';
import 'package:rentapp/controller/provider.dart';
import 'package:rentapp/model/payment.dart';
import 'package:rentapp/model/property.dart';
import 'package:rentapp/model/rentee.dart';
import 'package:rentapp/route/route.dart' as route;
import 'package:uuid/uuid.dart';

class EditPropertyDetail extends StatefulWidget {
  final int getindex;
  const EditPropertyDetail({Key? key, required this.getindex})
      : super(key: key);

  @override
  State<EditPropertyDetail> createState() => _EditPropertyDetailState();
}

class _EditPropertyDetailState extends State<EditPropertyDetail> {
  TextEditingController _propertyName = TextEditingController();
  TextEditingController _propertyAddress = TextEditingController();
  TextEditingController _propertySize = TextEditingController();
  TextEditingController _propertyDescription = TextEditingController();
  TextEditingController _propertyPrice = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    var provider = Provider.of<PropertyProvider>(context, listen: false);
    _propertyName.text = provider.atIndex(widget.getindex)!.propertyName;
    _propertyAddress.text = provider.atIndex(widget.getindex)!.address;
    _propertySize.text = provider.atIndex(widget.getindex)!.size;
    _propertyDescription.text = provider.atIndex(widget.getindex)!.description;
    _propertyPrice.text = provider.atIndex(widget.getindex)!.price.toString();

    super.initState();
  }

  @override
  void dispose() {
    _propertyName.dispose();
    _propertyAddress.dispose();
    _propertySize.dispose();
    _propertyDescription.dispose();
    _propertyPrice.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PropertyProvider>(context, listen: false);
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
          padding: EdgeInsets.symmetric(horizontal: 43.h, vertical: 20.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/home.png',
                    height: 23.h,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'Edit Properties',
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
                      'Property Name',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    TextFormField(
                      controller: _propertyName,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: GlobalVariables.textFieldbackgroundColor,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.w),
                        hintText: 'Enter property name',
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
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
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: Text(
                        'Location',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16.sp),
                      ),
                    ),
                    TextFormField(
                      controller: _propertyAddress,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: GlobalVariables.textFieldbackgroundColor,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.w),
                        hintText: 'Enter property location',
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
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 33.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 12.h),
                              child: Text(
                                'Size',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp),
                              ),
                            ),
                            TextFormField(
                              textAlign: TextAlign.end,
                              controller: _propertySize,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    GlobalVariables.textFieldbackgroundColor,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 10.w),
                                hintText: 'sq.ft',
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
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 33.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 12.h),
                              child: Text(
                                'Rent Cost',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp),
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _propertyPrice,
                              decoration: InputDecoration(
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
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
                    Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: Text(
                        'Description',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16.sp),
                      ),
                    ),
                    TextFormField(
                      controller: _propertyDescription,
                      minLines: 5,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
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

              // Expanded(
              //   child: Padding(
              //     padding: EdgeInsets.only(right: 5.w),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Padding(
              //           padding: EdgeInsets.only(bottom: 12.h),
              //           child: Text(
              //             'Agreement date start',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.w400,
              //                 fontSize: 16.sp),
              //           ),
              //         ),
              //         TextFormField(
              //           keyboardType: TextInputType.none,
              //           controller: _agreementDateStart,
              //           decoration: InputDecoration(
              //             prefixIcon: const Icon(
              //               Icons.calendar_today,
              //             ),
              //             filled: true,
              //             fillColor:
              //                 GlobalVariables.textFieldbackgroundColor,
              //             contentPadding: EdgeInsets.symmetric(
              //                 vertical: 10.h, horizontal: 10.w),
              //             hintText: 'Select date',
              //             hintStyle: TextStyle(
              //               fontSize: 14.sp,
              //               fontWeight: FontWeight.w300,
              //             ),
              //             border: OutlineInputBorder(
              //               borderRadius: BorderRadius.all(
              //                 Radius.circular(5.0.r),
              //               ),
              //             ),
              //             enabledBorder: const OutlineInputBorder(
              //               borderSide: BorderSide(
              //                 color: GlobalVariables.textFieldborderColor,
              //               ),
              //             ),
              //           ),
              //           onTap: () async {
              //             final DateTime? date = await showDatePicker(
              //               context: context,
              //               initialDate: DateTime.now(),
              //               firstDate: DateTime(2000),
              //               lastDate: DateTime(2100),
              //             );
              //             if (date != null) {
              //               setState(() {
              //                 _agreementDateStart.text = DateTime(
              //                         date.year, date.month, date.day)
              //                     .toString()
              //                     .substring(0, 10);
              //               });
              //             }
              //           },
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(145.w, 50.h),
                  ),
                  onPressed: () {
                    provider.updateProperty(
                      Property(
                        propertyId: const Uuid().v4(),
                        propertyName: _propertyName.text,
                        address: _propertyAddress.text,
                        description: _propertyDescription.text,
                        price: int.parse(_propertyPrice.text),

                        size: _propertySize.text,
                        //yesai ho herna test garns cha
                        status: 'paid',
                        index: widget.getindex,

                        fieldStatus: true,
                        rentee: Rentee(
                          renteeId: const Uuid().v4(),
                          agreementimage: '',
                          businessdetail: '',
                          citizenimage: '',
                          renteeContact: '',
                          renteeEmail: '',
                          renteeName: '',
                          renteePanNumber: '',
                          agreementDate: '',
                          renteePayment: Payment(
                            paymentId: '',
                            paymentNote: '',
                            paymentDate:
                                DateFormat.yMMMEd().format(DateTime.now()),
                            fieldIndex: widget.getindex,
                          ),
                        ),
                      ),
                    );
                    print('Index at fill : ${widget.getindex}');
                    Navigator.pushNamed(context, route.RouteManager.home);
                    // provider.setboolVal(widget.getindex).then(
                    //       (value) => provider.getboolVal(),
                    //     );

                    //provider.getIndexTrue(widget.getindex);
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(
                    //     content: Text('Property Successfully added'),
                    //   ),
                    // );
                  },
                  child: const Text(
                    'Save',
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
