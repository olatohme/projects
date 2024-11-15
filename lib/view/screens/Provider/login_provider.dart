import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:new_proj/consts/colors.dart';
import 'package:new_proj/consts/url.dart';

import 'package:new_proj/controller/loginprovider_controller.dart';
import 'package:new_proj/controller/tasks_controller.dart';
import 'package:new_proj/consts/storage.dart';
import 'package:new_proj/view/screens/Provider/register_provider_screen.dart';
import 'package:new_proj/view/widget/button2.dart';
import 'package:new_proj/view/widget/custom_textfield.dart';
import 'package:new_proj/view/widget/gradient_text.dart';
import 'package:new_proj/view/widget/text.dart';



// ignore: must_be_immutable
class loginprovider extends StatelessWidget{
  var k=GlobalKey<FormState>();
  final RxBool _obscureText = true.obs;
  var controller1 = Get.find<TasksController>();
  loginproviderController controller = Get.put<loginproviderController>(
      loginproviderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: SingleChildScrollView(
          child: Container(
            height:MediaQuery.of(context).size.height ,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                  top: MediaQuery.of(context).size.height*0.1,
                  left: MediaQuery.of(context).size.width*0.25,
                  child:  TextUtils(text: 'Welcome Back !',  fontfamily: 'OleoScript',fontSize:30,fontWeight: FontWeight.w500,
                    color: darkbeige,
                    underLine: TextDecoration.none,),
                ),

                // SizedBox(height: MediaQuery.of(context).size.height*0.08,),




                Positioned(
                  top: MediaQuery.of(context).size.height*0.3,
                  left: MediaQuery.of(context).size.width*0.1,
                  child:

                  Form(
                    key: k,
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.66,
                      width: MediaQuery.of(context).size.height*0.4,
                      decoration: ShapeDecoration(
                        gradient:LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [ Color(0xFFFFF1E1),Color(0xFFF5F5F5)],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(29),
                        ),
                      ),
                      child: SafeArea(
                        child:



                      Obx(  () =>
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            SizedBox(height: MediaQuery.of(context).size.height*0.13,),

                            Padding(
                              padding: const EdgeInsets.only(right: 200.0,bottom: 6),
                              child: TextUtils(text: 'User Name',fontSize:13,fontWeight: FontWeight.normal,fontfamily: 'OleoScript',
                                  color: darkbeige,underLine:
                                  TextDecoration.none),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25,right: 25),
                              child:
                              CustomTextField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter an email';
                                  }
                                  else if (!RegExp(validationEmail).hasMatch(value)) {
                                    return 'Invalid email';
                                  } else {
                                    return null;
                                  }
                                },
                                onchange: (value ) {
                                  controller.email=value;
                                },
                                hight: 10,
                                width: 350,
                                hintText: '',
                                obscureText:false,
                                prefixIcon:  Text(""),
                                suffixIcon:  Text(""),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                            Padding(
                              padding: const EdgeInsets.only(right: 200.0,bottom: 6),
                              child: TextUtils(text: 'Password',fontSize:13,fontWeight: FontWeight.normal,fontfamily: 'OleoScript',
                                  color: darkbeige,underLine:
                                  TextDecoration.none),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25,right: 25),
                              child:
                              CustomTextField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter a password ';
                                  }
                                  if (value.toString().length < 6) {
                                    return 'Password should be longer or equal to 6 characters';
                                  } else {
                                    return null;
                                  }
                                },
                                onchange: (value ) {
                                  controller.password=value;
                                },
                                hight: 12,
                                width: 350,
                                hintText: '',
                                prefixIcon: GestureDetector(
                                    onTap: () {
                                      _obscureText.toggle();
                                      print(_obscureText
                                          .value); // تبديل قيمة الـ RxBool بين true و false
                                    },
                                    child: Icon(
                                      _obscureText.value
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: _obscureText.value ? Colors.brown : Colors.brown,
                                    )),
                                obscureText: _obscureText.value,
                                suffixIcon:  Text(""),
                              ),
                            ),

                            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                            Padding(
                              padding: const EdgeInsets.only(left: 50,right: 50),
                              child: B_Button(
                                hight: 40,
                                text: 'Sign in',
                                width: 270,
                                onPressed: () {
                                  if (k.currentState!.validate()) {
                                    onclicklogin();
                                  }

                                  // Get.toNamed('/providers');
                                },


                              ),),
                            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                            Row(
                              children: [

                                SizedBox(width: MediaQuery.of(context).size.width*0.25,),
                                TextUtils(text: 'New Provider ?',fontSize:13,fontWeight: FontWeight.w400,fontfamily: 'OleoScript',
                                    color: Colors.black,underLine:
                                    TextDecoration.none),
                                SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                                TextButton(onPressed: (){
                                  Get.to(registerprovider());
                                },
                                  child: GradientText(
                                    'Sign up ',
                                    style: const TextStyle(fontSize: 12,fontFamily: 'OleoScript',),
                                    gradient: LinearGradient(colors: [
                                      darkbeige,
                                      pink,
                                    ]),
                                  ),),


                              ],
                            ),


                          ],
                        ),
                      ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height*0.22,
                  left: MediaQuery.of(context).size.width*0.32,
                  child: Container(

                    width: 150,
                    height: 150,

                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image:AssetImage("assets/images/logo.png"),

                        fit: BoxFit.cover,
                      ),
                      color: white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                      ),
                    ),
                    //    color: Colors.deepOrangeAccent,

                  ),
                ),
              ],
            ),


          ),
        ),

      ),

    );

  }
  void  onclicklogin() async{
    EasyLoading.show(status: 'loading');
    await  controller.onclicklogin();
    if( controller.loginstatus){
      EasyLoading.showSuccess('${controller.message}',duration:Duration (seconds:4));
        Securestorage storage=new Securestorage();
       Url.Token_prov=await storage.read('token_provider') ;
       
        Url.saved_id_prov=await storage.read('id_provider') ;
      if(controller1.task.myTasks.name=="")
      {await controller1.GetTasks();}
         Get.offNamed('/tasks');
     
    }
    else{
      // print('${controller.error}');
      EasyLoading.showError('${controller.error}'
          ,duration:Duration (seconds:4));

    }
  }
}