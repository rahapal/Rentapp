import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bodypart.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 5.h,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: PhysicalModel(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.white,
                    elevation: 5.0.h,
                    shadowColor: Colors.black,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          top: 30.h,
                        ),
                        hintText: "Search",
                        hintStyle: const TextStyle(color: Color(0xFF9F9F9F)),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color(0xFF9F9F9F),
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.13),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0.r),
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.13),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0.r),
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.13),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // const SizedBox(
                //   width: 10,
                // ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: PhysicalModel(
                    borderRadius: BorderRadius.circular(20.r),
                    color: const Color(0xFF5B67FE),
                    elevation: 5.0.h,
                    shadowColor: const Color(0xFF5B67FE),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: const Color(0xFF5B67FE),
                      ),
                      height: 55.h,
                      width: 45.w,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.tune,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              //),
            ),
          ),
          const BodyPart(),
        ],
      ),
    );
  }
}
