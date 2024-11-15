import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:new_proj/consts/colors.dart';
import 'package:new_proj/consts/url.dart';
import 'package:new_proj/controller/create_order_controller.dart';
import 'package:new_proj/view/widget/button.dart';
import 'package:new_proj/view/widget/button_gradient.dart';
import 'package:new_proj/view/widget/custom_textfield.dart';
import 'package:new_proj/view/widget/text.dart';

class create_order extends StatefulWidget{
  @override
  State<create_order> createState() => _create_orderState();
}

class _create_orderState extends State<create_order> {
  Create_Order_Controller controller =    Get.put<Create_Order_Controller>(Create_Order_Controller());

  var k=GlobalKey<FormState>();

  List payment = [
    'cash on delivery',

  ];
   List shipping_methode = [
    'yalla go',
    'bee order',

  ];

  var selcettype;
var selectshipping;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: SingleChildScrollView(
       child:  Container(
       height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.height,
    decoration: ShapeDecoration(
    gradient: LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [ Color(0xFFFFF1E1),Color(0xFFF5F5F5)],
    ),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(29),
    ),
    ),
       child: Form(
         key: k,
         child: SingleChildScrollView(
           child: Column(
             children: [


               Row(
                 children: [
                   IconButton(
                          onPressed: () {
                           Get.back();
                          },
                          //  Get.toNamed('/points'),
                          icon: Icon(Icons.chevron_left),
                          color: darkbeige,
                          iconSize: 25,
                        ),
                   Padding(
                     padding: const EdgeInsets.only(top: 70.0,left: 90),
                     child: TextUtils(text: 'Checkout',  fontfamily: 'OleoScript',fontSize:30,fontWeight: FontWeight.w500,
                         color: darkbeige,
                         underLine: TextDecoration.none,),
                   ),
                 ],
               ),
               Padding(
                 padding: const EdgeInsets.only(top: 25.0),
                 child: Container(
                   height: 160,
                   width: 280,
                   child: Image.asset('assets/images/pay.jpg',fit: BoxFit.cover),
                 ),
               ),

               Padding(
               padding: const EdgeInsets.only(top: 40.0,right: 240,bottom: 10),
               child: TextUtils(text: 'Delivery To',fontSize:13,fontWeight: FontWeight.w700,
                 color: darkbeige,
                 underLine: TextDecoration.none,),
               ),
               Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                 //   Padding(
                 //   padding: const EdgeInsets.only(left: 8.0),
                 //   child: const Text(
                 //     "Cities",
                 //     style: TextStyle(
                 //       fontFamily: 'OleoScript',
                 //       overflow: TextOverflow.ellipsis,
                 //       fontWeight: FontWeight.normal,
                 //       color: Colors.brown,
                 //
                 //       fontSize: 16,
                 //     ),
                 //   ),
                 // ),
                   SizedBox(height: 5,),
                   Obx(() => SizedBox(
                     height: MediaQuery.of(context).size.height * 0.07,
                     width:350,
                     //MediaQuery.of(context).size.width * 0.4,
                     child: DropdownButtonFormField<String>(
                       value: controller.city.value,
                       onChanged: (String? newValue) {
                         controller.city.value = newValue!;
                       },
                       decoration: InputDecoration(
                         contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(25.0), // جعل الحواف مدورة
                           borderSide: BorderSide(color: Color(0xEFFFF1E1),
                           ), // تغيير لون حواف الحقل
                         ),
                         enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(25.0),
                           borderSide: BorderSide(color: Color(0xEFFFF1E1),
                           ), // تغيير لون حواف الحقل عندما يكون غير مفعّل
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(25.0),
                           borderSide: BorderSide(color: Color(0xEFFFF1E1),
                           ), // تغيير لون حواف الحقل عند التركيز عليه
                         ),
                        // fillColor: Colors., // لون الخلفية من الداخل
                         //filled: true,
                         labelStyle: TextStyle( color: Colors.black26,
                           fontSize: 16,
                           fontWeight: FontWeight.w500,),
                       ),

                       items: <String>['Damascus',
                         'Rif Dimashq',
                         'Aleppo',
                         'Homs',
                         'Hama',
                         'Latakia',
                         'Raqqa',
                         'Deir ez-Zor',
                         'Tartus',
                         'Idlib',
                         'Al-Hasakah',
                         'Daraa',
                         'As-Suwayda',
                         'Salamiyah',
                         'Al-Qamishli',
                       ]
                           .map<DropdownMenuItem<String>>((String value) {
                         return DropdownMenuItem<String>(
                           value: value,
                           child: Text(value,  style: TextStyle(color: Colors.black38,
                             fontFamily: 'OleoScript',),
                           ),
                         );
                       }).toList(),
                     ),
                   )
                   ),
                 ],
               ),
               Padding(
               padding: const EdgeInsets.only(top: 1.0,left: 33,right: 33),

                 child: TextFormField(
validator: (value){
  if(value!.isEmpty){
    return 'Delivery must not be empty';
  }

},
                     onChanged:(value){
                       controller.delivery_to=controller.city.value +" _ "+value;
                     },
                   cursorColor: Colors.black,
                   style: const TextStyle(
                     color: darkbeige,
                     fontFamily: 'OleoScript',
                   ),

                   decoration: InputDecoration(


                     suffixIcon: Icon(Icons.edit,color: Colors.black,),
                   )



                 ),
               ),

               Padding(
               padding: const EdgeInsets.only(top: 24.0),
               child: Container(
                 height: MediaQuery.of(context).size.height*0.01,
                 width: MediaQuery.of(context).size.width*0.89,
                 decoration: ShapeDecoration(
                   gradient: LinearGradient(
                     begin: Alignment.bottomLeft,
                     end: Alignment.topRight,
                     colors: [ Colors.black12,Colors.black12],
                   ),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(29),
                   ),
                 ),
               ),
               ),
             /*  Padding(
               padding: const EdgeInsets.only(top: 20.0,right: 170),
               child: TextUtils(text: 'Payment Methode',fontSize:13,fontWeight: FontWeight.w700,
                 color: darkbeige,
                 underLine: TextDecoration.none,),
               ),
               Padding(
               padding: const EdgeInsets.only(top: 1.0,left: 33,right: 33),

               child: TextFormField(
                   validator: (value){
                     if(value!.isEmpty){
                       return 'Payment Methode must not be empty';
                     }

                   },
                   onChanged:(value){
                     controller.payment_methode=value;
                   },
                   cursorColor: Colors.black,
                   style: const TextStyle(
                     color: darkbeige,
                     fontFamily: 'OleoScript',
                   ),

                   decoration: InputDecoration(


                     suffixIcon: Icon(Icons.edit,color: Colors.black,),
                   )



               ),
               ),
*/
               Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left: 40.0),
                     child:  TextUtils(text: 'Payment Methode',fontSize:13,fontWeight: FontWeight.w700,
                       color: darkbeige,
                       underLine: TextDecoration.none,),

                   ),
                   SizedBox(
                     width: 39,
                   ),
                   DropdownButton(
                     hint: Text(''),
                     value: selcettype,
                     items: payment.map((e) {
                       return DropdownMenuItem(
                         child: Text(e,style: TextStyle(color: darkbeige,fontSize: 13,fontWeight: FontWeight.bold),),
                         value: e,
                       );
                     }).toList(),
                     onChanged: (newvalue) {
                       setState(() {
                         selcettype = newvalue;
                         print(selcettype);
                         controller.payment_methode = selcettype;
                       });
                     },
                   ),
                 ],
               ),
               Padding(
               padding: const EdgeInsets.only(top: 24.0),
                child: Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left: 40.0),
                     child:  TextUtils(text: 'Shipping_Method',fontSize:13,fontWeight: FontWeight.w700,
                       color: darkbeige,
                       underLine: TextDecoration.none,),

                   ),
                   SizedBox(
                     width: 89,
                   ),
                   DropdownButton(
                     hint: Text(''),
                     value: selectshipping,
                     items: shipping_methode.map((e) {
                       return DropdownMenuItem(
                         child: Text(e,style: TextStyle(color: darkbeige,fontSize: 13,fontWeight: FontWeight.bold),),
                         value: e,
                       );
                     }).toList(),
                     onChanged: (newvalue) {
                       setState(() {
                         selectshipping = newvalue;
                         print(selectshipping);
                         controller.shipping_methoe = selectshipping;
                       });
                     },
                   ),
                 ],
               ),
              //  child: Container(
              //    height: MediaQuery.of(context).size.height*0.01,
              //    width: MediaQuery.of(context).size.width*0.89,
              //    decoration: ShapeDecoration(
              //      gradient: LinearGradient(
              //        begin: Alignment.bottomLeft,
              //        end: Alignment.topRight,
              //        colors: [ Colors.black12,Colors.black12],
              //      ),
              //      shape: RoundedRectangleBorder(
              //        borderRadius: BorderRadius.circular(29),
              //      ),
              //    ),
              //  ),
              //  ),
              //  Padding(
              //  padding: const EdgeInsets.only(top: 20.0,right: 170),
              //  child: TextUtils(text: 'Shipping_Method',fontSize:13,fontWeight: FontWeight.w700,
              //    color: darkbeige,
              //    underLine: TextDecoration.none,),
              //  ),
              //  Padding(
              //  padding: const EdgeInsets.only(top: 1.0,left: 33,right: 33),

              //  child: TextFormField(
              //      validator: (value){
              //        if(value!.isEmpty){
              //          return 'Shipping_Method must not be empty';
              //        }

              //      },
              //      onChanged:(value){
              //        controller.shipping_methoe=value;
              //      },
              //      cursorColor: Colors.black,
              //      style: const TextStyle(
              //        color: darkbeige,
              //        fontFamily: 'OleoScript',
              //      ),

              //      decoration: InputDecoration(


              //        suffixIcon: Icon(Icons.edit,color: Colors.black,),
              //      )



              //  ),
               ),


               Padding(
               padding: const EdgeInsets.only(top: 24.0),
               child: Container(
                 height: MediaQuery.of(context).size.height*0.01,
                 width: MediaQuery.of(context).size.width*0.89,
                 decoration: ShapeDecoration(
                   gradient: LinearGradient(
                     begin: Alignment.bottomLeft,
                     end: Alignment.topRight,
                     colors: [ Colors.black12,Colors.black12],
                   ),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(29),
                   ),
                 ),
               ),
               ),
               Padding(
               padding: const EdgeInsets.only(top: 20.0,right: 220),
               child: TextUtils(text: 'Notes',fontSize:13,fontWeight: FontWeight.w700,
                 color: darkbeige,
                 underLine: TextDecoration.none,),
               ),
               Padding(
               padding: const EdgeInsets.only(top: 1.0,left: 33,right: 33),

               child: TextFormField(
                   validator: (value)
                   {
                     if(value!.isEmpty){
                       return 'Notes must not be empty';
                     }

                   },
                   onChanged:(value){
                     controller.notes=value;
                   },
                   cursorColor: Colors.black,
                   style: const TextStyle(
                     color: darkbeige,
                     fontFamily: 'OleoScript',
                   ),

                   decoration: InputDecoration(


                     suffixIcon: Icon(Icons.edit,color: Colors.black,),
                   )



               ),
               ),

           Padding(
             padding: const EdgeInsets.only(top: 44.0,bottom: 40),
             child:  Basic_Button(
               hight: 40,
               text: 'Confirm',
               width: 270,
               onPressed: () async{
    if (k.currentState!.validate()) {
       controller.isreplace.value=false;
      // _showBottomSheet(context); 
       onclickcreate(context);
       
     
    }
               },


               ),
           ),
             ],

           ),
         ),
       ),
     ),
     ),
   );
  }

 


  void _showBottomSheet(BuildContext context) {
    
     // ignore: unused_local_variable
     final animationController = AnimationController(
      vsync: Navigator.of(context),
      duration: Duration(seconds: 2), // تعديل مدة الحركة هنا
    );
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return  Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
          ),
         
            height:MediaQuery.of(context).size.height * 0.25 ,
             width: MediaQuery.of(context).size.width , // ارتفاع الشيت بوتوم
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                                          "        Do you want to exchange your points for a discount? ",
                                          style: TextStyle(
                                            fontFamily: 'OleoScript',
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black54,
                                
                                            fontSize: 16,
                                          ),
                                        ),
                                         SizedBox(
                  height: 50,
                ),

              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: InkWell(
                  onTap: () {
                    print("fffffffffff");
                     Get.back();
                     openDialog(context);
                     
                     
                  },
                  child: Row(
                    children: [
                      Icon(
                          Icons.done,
                          size: 28,
                          color: Color.fromARGB(255, 187, 165, 99),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width *0.07),
                      Text(
                                            "Yes , I want to get a discount",
                                            style: TextStyle(
                                              fontFamily: 'OleoScript',
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black54,
                                  
                                              fontSize: 16,
                                            ),
                                          ),
                      
                    ],
                  ),
                ),
              ),
              
                               SizedBox(
                  height: 20,
                ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: InkWell(
                      onTap: () {
                        // controller.getImage();
                        
                        // onclickcreate();
                        Get.back();
                        Get.offAllNamed('/home');

                      },
                      child:Row(
                  children: [
                    Icon(
                        Icons.close,
                        size: 28,
                        color:Color.fromARGB(255, 187, 165, 99),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width *0.07),
                     Text(
                                          "No , confirm order without discount",
                                          style: TextStyle(
                                            fontFamily: 'OleoScript',
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black54,
                                
                                            fontSize: 16,
                                          ),
                                        ),
                    
                  ],
                ),)
              ),
                
              ],
            ),
          
        );
      },
    );
  }

  void openDialog(BuildContext context) {
    var k=GlobalKey<FormState>();
    controller.isDialogOpen.value = true;
    Get.dialog(
      // barrierColor: Colors.transparent,
      SizedBox(
      // width: 200,
      // height: 500,
        child: AlertDialog(
          backgroundColor:Color.fromARGB(255, 243, 243, 233),
           insetPadding: EdgeInsets.symmetric(vertical: 120,horizontal:0 ),
           
          // titlePadding: EdgeInsets.only(top: 0,bottom: 0, left: 170),
          // title: TextUtils(
          //     fontSize: 17,
          //     fontWeight: FontWeight.normal,
          //     text: "",
          //     color: Colors.black,
          //     underLine: TextDecoration.none),
          
          content: SizedBox(
          width: MediaQuery.of(context).size.width *0.7, // جعل عرض الـ dialog يمتد على عرض الشاشة
          child: Form(
            key: k,
            child: SingleChildScrollView(
              child:
                Column(children: [  
                   SizedBox(height: 30,),
                    TextUtils(text: 'Total price befor discount ${Url.totalprice} :',  fontfamily: 'OleoScript',fontSize:20,fontWeight: FontWeight.w200,
                           color: Colors.black54,
                           underLine: TextDecoration.none,),
                            SizedBox(height: 20,),
                Padding(
                             padding: const EdgeInsets.only(left: 10,right: 10),
                             child:
                             CustomTextField(
                               validator: (value) {
                                 if (value.isEmpty) {
                                   return 'Please enter points number';
                                 }
                                 else {
                                   return null;
                                 }
                               },
                               onchange: (value ) {
                                 controller.points=value;
                               },
                               hight: 10,
                               width: 350,
                               hintText: 'points number',
                               obscureText:false,
                               prefixIcon:  Text(""),
                               suffixIcon:  Text(""),
                               keyboardType: TextInputType.number,
                             ),
                           ),
                             SizedBox(height: 30,),
                           Button(
                            color: Color.fromARGB(255, 187, 165, 99),
                    onPressed: () async {
                     if (k.currentState!.validate()){
                      EasyLoading.show(status: "loading");
                        await controller.replace_point() ;
                        controller.isreplace.value=true;
                        Get.back();
                        Get.offAllNamed('/home');
                
                     }
                       
                    },
                    text: "Replace",
                    hight: 40,
                    width: 160,
                  ),
                   SizedBox(height: 10,),
                  //  controller.isreplace.value==true?
                  //  InkWell(onTap: () {
                  //    onclickcreate();
                  //  },
                  //  child:  TextUtils(text: 'Confirm order',  fontfamily: 'OleoScript',fontSize:20,fontWeight: FontWeight.w200,
                  //          color: darkbeige,
                  //          underLine: TextDecoration.underline,),):SizedBox(height: 0,)
                        ],)
            ),
          )
          
          // actions: [
          //   Center(
          //     child: Button(
          //       onPressed: () async {
                 
          //       },
          //       text: "ارسال",
          //       hight: 50,
          //       width: 200,
          //     ),
          //   ),
          //   SizedBox(
          //     height: 20,
          //   )
          // ],
        ),),
      ),
      barrierDismissible: true,
    );
  }
  Future  <void>  onclickcreate(BuildContext context) async{
    EasyLoading.show(status: 'loading');
    await  controller.onclickcreate();
    if( controller.loginstatus){
      EasyLoading.showSuccess('${controller.message}',duration:Duration (seconds:4));
      _showBottomSheet(context); 
      // Get.offAllNamed('/home');
    }
    else{
      // print('${controller.error}');
      EasyLoading.showError('${controller.error}'
          ,duration:Duration (seconds:4));

    }
  }
}