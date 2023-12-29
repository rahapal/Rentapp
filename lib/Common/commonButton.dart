import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final Color? shadowColor;
  final Color? textColor;

  const CustomButton({
    Key? key,
    required this.shadowColor,
    required this.text,
    required this.textColor,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w, // Adjust width to match the parent width
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shadowColor: shadowColor,
          elevation: 5,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding:
              EdgeInsets.symmetric(vertical: 16.0), // Adjust padding as needed
        ),
        child: Text(
          text,
          textAlign: TextAlign.center, // Center align text
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
