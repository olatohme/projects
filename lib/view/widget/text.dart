import 'package:flutter/material.dart';
class TextUtils extends StatelessWidget {
  final String text;
  final String? fontfamily;
  final Color color;
  final double fontSize;
  final int? maxline;
  final FontWeight fontWeight;
  final TextDecoration underLine;

  TextUtils({
    required this.fontSize,
    required this.fontWeight,
    required this.text,
    required this.color,
    required this.underLine,
    Key? key,  this.fontfamily, 
    this.maxline
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines:maxline, 
      text,
      style:
     TextStyle(
          decoration: underLine,
          color: color,
          fontSize: fontSize,
          fontFamily: fontfamily,
          fontWeight: fontWeight,
        ),
      
    );
  }
}
