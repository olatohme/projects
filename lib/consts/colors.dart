import 'package:flutter/material.dart';

const darkbeige = Color(0xFF796F14);
const beige = Color(0xFF796F14);
const pink =Color(0xFFFF8F8F);
const deeppink =Color(0x7FD3B398);
const white=Colors.white;



String validationEmail =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

String validationName = r'^[a-z A-Z]+$';
String validationPhone =
    r'^\+?(\d{1,3})?[-.\s]?(\d{3})[-.\s]?(\d{3})[-.\s]?(\d{4})$';

    

 Gradient backColor=     LinearGradient(
              end: Alignment.bottomLeft,
              begin: Alignment.topRight,
             colors: [Colors.white, Color(0xFFFFF1E1)],
            );
  Gradient ColorButton= LinearGradient(
              begin: Alignment(1.00, -0.04),
              end: Alignment(-1, 0.04),
              colors: [Color(0xFFFFF1E1), Color(0xFFEFC38F)],
            );