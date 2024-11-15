import 'package:flutter/material.dart';
import 'package:new_proj/consts/colors.dart';




// ignore: must_be_immutable
class Basic_Button extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double width;
  final double hight;
  Color?color;
   Basic_Button({
    required this.hight,
    required this.width,
    required this.onPressed,
    required this.text,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: hight ,
       decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(1.00, -0.04),
              end: Alignment(-1, 0.04),
              colors: [Color(0xFFFFF1E1), Color(0xFFEFC38F)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            shadows: [
              BoxShadow(
                color:pink,
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],),
        child: Center(
          child:  Text(
          text,
          style: TextStyle(
            fontFamily: 'OleoScript',
            color:darkbeige,
            fontSize: 20,
            
            fontWeight: FontWeight.w400,
            height: 0,
            letterSpacing: 1.20,
          ),
        ),
        ),
      ),
    );
  }
}
