import 'package:flutter/material.dart';

class CustomBooksActionTextButton extends StatelessWidget {
  String text;
  Color textColor;
  Color backgroundColor;
  BorderRadius borderRadius;
  void Function()? onPressed;

  CustomBooksActionTextButton(
      {super.key, required this.text,
      required this.textColor,
      required this.backgroundColor,
      required this.borderRadius,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 48,
        child: TextButton(
          onPressed:onPressed,
          style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: borderRadius)),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 16, color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
