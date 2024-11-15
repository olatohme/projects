import 'package:flutter/material.dart';
import 'package:new_proj/consts/colors.dart';


class SearchFormText extends StatelessWidget {
  final text;
  final Function(String) onchange;
  final Function(String) validator;
   final Function() onpressed;
    final Function()? ontap;
  SearchFormText({
    required this.onchange,
    required this.validator,
     required this.onpressed,
     this.ontap,
    required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30,right: 30),
      child: TextFormField(
        onTap: ontap,
        cursorHeight: 15,
        textAlign: TextAlign.start,
        cursorColor: Colors.black26,
          validator: (value) => validator(value!),
            //validator: validator,
            onChanged: onchange,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 8,bottom: 8),
          fillColor: Colors.white,
          focusColor: Colors.red,
          suffixIcon:  IconButton(
                          onPressed: onpressed,
                          //  Get.toNamed('/points'),
                          icon: Icon(Icons.close),
                          color: Colors.black12,
                          iconSize: 15,
                        ), 
          prefixIcon: const Icon(
            Icons.search,
            color: pink,
          ),
          hintText: text,
          hintStyle: const TextStyle(
            color: Colors.black45,
              fontFamily: 'OleoScript',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xEFFFF1E1)),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xEFFFF1E1)),
            borderRadius: BorderRadius.circular(30),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xEFFFF1E1)),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xEFFFF1E1)),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
