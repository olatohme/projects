import 'package:flutter/material.dart';



class CustomTextField extends StatelessWidget {
  // final Function validator;

  final double width;
  final double hight;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;

  final TextInputType? keyboardType;
  final bool obscureText;
  final Function(String) onchange;
  final Function(String) validator;
  // final Function(String) onSaved;

  CustomTextField({
    required this.validator,
    required this.hintText,
    required this.hight,
    required this.width,
    this.keyboardType,
    required this.obscureText,
    this.prefixIcon,
   this.suffixIcon,
    required this.onchange,
    // required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: hight,
        width: width,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.white.withAlpha(20), width: 1),
            left: BorderSide(color: Colors.white.withAlpha(20), width: 1),
            right: BorderSide(color: Colors.white.withAlpha(20), width: 1),
            top: BorderSide(color: Colors.white.withAlpha(20), width: 1),
          ),
          color: Colors.white.withAlpha(50),
        ),
        child: Center(
          child: TextFormField(
            
            validator: (value) => validator(value!),
            //validator: validator,
            onChanged: onchange,
            //cursorHeight: 30,
            cursorColor: Colors.black,
            keyboardType: keyboardType,
            obscureText: obscureText,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'OleoScript',
            ),
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              fillColor: Colors.white,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle:  TextStyle(
                color: Colors.black.withOpacity(0.30000000298023224),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xEFFFF1E1),
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xEFFFF1E1)),
                borderRadius: BorderRadius.circular(25),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xEFFFF1E1),
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xEFFFF1E1),
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
      
    );
    /* TextField(

          cursorColor: white,
          keyboardType:
              keyboardType == null ? TextInputType.text : keyboardType,
          onChanged: onChange,
          controller: controller,

          style: TextStyle(
            color: white,
            fontFamily: "Acaslon Regular",
            fontSize: 20,

          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            hintText: hintText,
            hintStyle: TextStyle(
              color: white.withAlpha(150),
              fontFamily: "Acaslon Regular",
              fontSize: 20,
            ),
          ),
        ),*/
    // ),
  }
}
