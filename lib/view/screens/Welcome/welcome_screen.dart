import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:new_proj/view/screens/Welcome/user_or_provider.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:new_proj/view/widget/text.dart';
// ignore: must_be_immutable

import 'package:new_proj/consts/colors.dart';
// ignore: must_be_immutable
class screens extends StatelessWidget {
  screens({Key? key}) : super(key: key);
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        PageView(
          controller: controller,
          children: [
            Stack(
              children: [
                Container(
                 decoration:  ShapeDecoration(
                        gradient: backColor,  shape: RoundedRectangleBorder(
                       
                        ),),
                ),
                Positioned(
                    top: 1,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        /// color: white,
                        color: const Color.fromRGBO(231, 203, 159, 0.3),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(400),
                          bottomRight: Radius.circular(400),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.40,
                    )),
                Positioned(
                    top: 170,
                    left: 50,
                    child: Image.asset(
                      "assets/images/wel5.png",
                      width: 300,
                      height: 400,
                    )),
                Positioned(
                  bottom: 150,
                  left: 100,
                  child:TextUtils(
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                       fontfamily: 'BadScript',
                      text: 'Welcome to the Online Flowers\n and Bouquets Ordering App! ',
                      color: Colors.black,
                      underLine: TextDecoration.none),
                ),
               
              ],
            ),
            Stack(
              children: [
                Container(
                 decoration:  ShapeDecoration(
                        gradient: backColor,  shape: RoundedRectangleBorder(
                       
                        ),),
                ),
         
                Positioned(
                    top: 1,
                    left: 100,
                    child: Container(
                      decoration: BoxDecoration(
                        /// color: white,
                        color: const Color.fromRGBO(231, 203, 159, 0.3),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(400),
                          bottomRight: Radius.circular(400),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * 0.50,
                      height: MediaQuery.of(context).size.height * 0.50,
                    )),
                Positioned(
                    top: 180,
                    left: 30,
                    child: Image.asset(
                      "assets/images/wel3.png",
                      width: 350,
                      height: 400,
                    )),
                Positioned(
                  bottom: 150,
                  left: 30,
                  child: TextUtils(
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                       fontfamily: 'BadScript',
                      text:   "      Explore our diverse collection of\n luxurious and delightful flowers and bouquets, \n    and make every occasion unforgettable. ",
                      color: Colors.black,
                      underLine: TextDecoration.none),
                ),]),
                         Stack(
              children: [
                Container(
                  decoration:  ShapeDecoration(
                        gradient: backColor,  shape: RoundedRectangleBorder(
                       
                        ),),
                ),
                Positioned(
                    top: 1,
                    left: 100,
                    child: Container(
                      decoration: BoxDecoration(
                        /// color: white,
                        color: const Color.fromRGBO(231, 203, 159, 0.3),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(400),
                          bottomRight: Radius.circular(400),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * 0.50,
                      height: MediaQuery.of(context).size.height * 0.50,
                    )),
                Positioned(
                    top: 180,
                    left: 20,
                    child: Image.asset(
                      "assets/images/wel2.png",
                      width: 350,
                      height: 400,
                    )),
                Positioned(
                  bottom: 150,
                  left: 30,
                  child:TextUtils(
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                       fontfamily: 'BadScript',
                      text:    "Let us accompany you on your shopping journey\n     We wish you a pleasant and joyful\n         shopping experience with us! ",
                      color: Colors.black,
                      underLine: TextDecoration.none),
                  
                ),
                Positioned(
                  bottom: 55,
                  left: 340,
                  child: GestureDetector(
                    onTap: () {
                      Get.off( signupfirst());
                    },
                    child: Center(
                      child:  TextUtils(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                           fontfamily: 'OleoScript',
                          text:    "Skip",
                          color: pink,
                          underLine: TextDecoration.none),
                    ),
                  ),
                ),
           ],
        ),
        Container(
          alignment: Alignment(0, 0.85),
          child: SmoothPageIndicator(
            controller: controller,
            count: 3,
             effect: ScrollingDotsEffect(
                // لون النقطة النشطة (الصفحة الحالية)
                activeDotColor: pink,
                // لون النقط غير النشطة
                dotColor: Colors.grey,
                // عرض النقطة
                dotWidth: 12,  
                // ارتفاع النقطة
                dotHeight: 12,
          ),
        ))
      ]),
      ]),
    );
  }
}
