import 'package:flutter/material.dart';
import 'package:new_proj/view/widget/button_gradient.dart';
import 'package:new_proj/view/widget/text.dart';



class OrderSuccess extends StatelessWidget {
  const OrderSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        body: Stack(
          alignment:Alignment.center,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.brown    ),
              //PRODUCT.IMAGE
              child: Image.asset('assets/images/splash.png',fit: BoxFit.cover,),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [

                  SizedBox(height: 480,),
                  Center(
                    child: TextUtils(fontSize:20,
                      fontWeight: FontWeight.bold,
                      text: 'Order Successfully Placed',
                      color: Color(0xFF8B7475) ,
                      underLine: TextDecoration.none,
                      fontfamily: 'OleoScript',
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: TextUtils(fontSize:15,
                      fontWeight: FontWeight.bold,
                      text: 'your order has been successfully placed and has been processed for delivery',
                      color: Color(0xFF858181) ,
                      underLine: TextDecoration.none,
                     // fontfamily: 'OleoScript',
                    ),
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  Basic_Button(text: 'Continue Shopping',
                    width:  MediaQuery.of(context).size.width *0.5 ,
                    hight:40,
                    onPressed: (){

                    },),
                  SizedBox(
                    height: 20,
                  ),

                  Basic_Button(text: 'Track Your Order',
                    width:  MediaQuery.of(context).size.width *0.5 ,
                    hight:40,
                    onPressed: (){

                    },),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}
