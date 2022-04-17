import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double? fontSize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final Color? textColor;

  const CustomTextButton(
      {required this.text,
      required this.onPressed,
      this.fontSize = 15.0,
      this.textAlign,
      this.fontWeight,
      this.textColor,});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(text,
          textAlign: textAlign,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
          ),),
      onPressed: () => onPressed,
    );
  }
}
