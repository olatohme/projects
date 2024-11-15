
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';

import 'package:new_proj/view/screens/Welcome/user_or_provider.dart';




class splash_screen extends StatelessWidget {
  
  
   
    
            // if (controller1.TokenCustomer == null) {

  @override
  Widget build(BuildContext context) {
    
    return AnimatedSplashScreen(
      splash: Container(
        height:MediaQuery.of(context).size.height,
         width:MediaQuery.of(context).size.width,
       // 
       //decoration: gradientBackground,
        
        child: Column(
          children: [
           // SizedBox(height: 40,),
              Image.asset(
                      'assets/images/logosplash.png',
                      width:300,
                      height: 300,
                    ),
                    SizedBox(height: 0,),
                    Text(
                      " FLORISTA",
                      style: TextStyle(
                           fontFamily:  'Caveat',
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: const Color.fromARGB(255, 146, 20, 62),
                          decoration: TextDecoration.none),
                    ),
                     SizedBox(height: 10,),
                    Text(
                       "    Welcome to the Online Flowers \n     and Bouquets Ordering App! ",
                      style: TextStyle(
                           fontFamily:  'Caveat',
                          //fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black54,
                          decoration: TextDecoration.none),
                    ),
            //  Container(
            //           height: 200,
            //           width: 200,
            //           alignment: Alignment.centerLeft,
            //           decoration: BoxDecoration(
            //               shape: BoxShape.circle,
            //               border: Border.all(width: 2, color: Colors.black),
            //               image: DecorationImage(
            //                   image: AssetImage('assets/images/ll.png')))),
          
            // TextUtils(
            //   fontSize: 18,
            //    fontWeight:FontWeight.bold,
            //     text: "WELCOME TO OUR EXHIBITION", 
            //     color: white,
            //      underLine: TextDecoration.none)
          ],
        ),
      ),
      
      backgroundColor:
      Color.fromARGB(255, 248, 222, 193),
      splashIconSize: 600,
      duration: 2500,
      splashTransition: SplashTransition.scaleTransition,
      centered: true,
      
      //  nextScreen: con_
      //troller.Token==null?Login(): MyApp());
      nextScreen:signupfirst() );
  }
}