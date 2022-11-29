import 'package:flutter/material.dart';

import '../HomePageElements/bodypart.dart';

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
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w700,
        ),
      ),
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shadowColor: shadowColor,
        elevation: 5,
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
