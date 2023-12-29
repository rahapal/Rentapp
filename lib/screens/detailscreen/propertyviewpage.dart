import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentapp/common/global_variables.dart';

import '../../controller/provider.dart';

class PropertyViewPage extends StatefulWidget {
  int getindex;
  PropertyViewPage({Key? key, required this.getindex}) : super(key: key);

  @override
  State<PropertyViewPage> createState() => _PropertyViewPageState();
}

class _PropertyViewPageState extends State<PropertyViewPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PropertyProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color(0xFFEAECFF),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: const Color(0xFF5B67FE),
        title: Text(
          'Property Detail',
          style: TextStyle(
            fontSize: 18.sp,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
        child: Container(
          height: 400.h,
          width: 398.w,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF5B67FE),
              width: 3,
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 60.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF5B67FE).withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Property Name',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        provider.atIndex(widget.getindex)!.propertyName,
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 60.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF5B67FE).withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Location',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        provider.atIndex(widget.getindex)!.address,
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 60.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF5B67FE).withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Size',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        provider.atIndex(widget.getindex)!.size,
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 60.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF5B67FE).withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Rent Cost',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        provider.atIndex(widget.getindex)!.price.toString(),
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 111.5.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF5B67FE).withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        provider.atIndex(widget.getindex)!.description,
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
