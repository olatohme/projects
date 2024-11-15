import 'package:flutter/material.dart';

//import 'package:insta_image_viewer/insta_image_viewer.dart';

import 'package:new_proj/view/widget/text.dart';

class post_card extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return    SizedBox(
      height: MediaQuery.of(context).size.height * 0.42,
     // width: MediaQuery.of(context).size.width * 0.80,
      child:    ListView.separated(
        scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return _contain();
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
          itemCount:10
      ),
    );
  }

  Container _contain () {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
      height: 350,
      width: 375,
      decoration: BoxDecoration(
        color: Color.fromRGBO(238, 229, 215, 1.0),
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             /* Container(
// padding: EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(175, 166, 128, 1.0),
                  borderRadius: BorderRadius.circular(17),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 3.0,
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                height: 250,
                width: double.infinity,
                child: InstaImageViewer(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/flowers.jpg', fit: BoxFit.cover,),
                  ),
                ),
              ),*/
              SizedBox(
                height: 10,
              ),
              TextUtils(fontSize: 16,
                  fontWeight: FontWeight.bold,
                  text: "This is my Decoration ghgfhvkhn cxhgvjmn chgjhfcjh hgvjfhgvjv jbb hvjvj hgcghjvc ",
                  color: Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}