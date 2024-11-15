import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:new_proj/consts/colors.dart';
import 'package:new_proj/controller/registeruser_controller.dart';
import 'package:new_proj/view/widget/button2.dart';
import 'package:new_proj/view/widget/custom_textfield.dart';
import 'package:new_proj/view/widget/text.dart';



// ignore: must_be_immutable
class registeruser extends StatelessWidget{
  var k=GlobalKey<FormState>();
  final RxBool _obscureText = true.obs;
  final RxBool _obscureText2 = true.obs;
  var passwordcontroller = TextEditingController();
  registeruserController controller = Get.put<registeruserController>(
      registeruserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: SingleChildScrollView(
          child:  Container(
            height:MediaQuery.of(context).size.height ,
            width: MediaQuery.of(context).size.width,
            child: Stack(
            children: [
              Positioned(
                  top: MediaQuery.of(context).size.height*0.01,
                  left: MediaQuery.of(context).size.width*0.25,
                  child:  TextUtils(text: 'Welcome Back !',fontSize:30,fontWeight: FontWeight.w500,fontfamily: 'OleoScript',
                    color: darkbeige,underLine:
                    TextDecoration.none),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),

              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Stack(
                  children:[

                 
                     Positioned(
                  top: MediaQuery.of(context).size.height*0.15,
                  left: MediaQuery.of(context).size.width*0.01,
                  child: Form(
                    key: k,
                    child: Container(
                        height: MediaQuery.of(context).size.height*0.83,
                        width: MediaQuery.of(context).size.height*0.4,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
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



                          SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [



                                SizedBox(height: MediaQuery.of(context).size.height*0.099,),


                              Padding(
                                  padding: const EdgeInsets.only(right: 205.0,bottom: 6),
                                  child: TextUtils(text: 'name',fontSize:13,fontWeight: FontWeight.normal,fontfamily: 'OleoScript',
                                      color: darkbeige,underLine:
                                      TextDecoration.none),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 25,right: 25),
                                  child:       CustomTextField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter a name';
                                      }
                                      else{ return null;}
                                    },
                                    onchange: (value ) {
                                      controller.first_name=value;
                                    },
                                    hight: 10,
                                    width: 350,
                                    hintText: 'Name',
                                    obscureText:false,
                                    prefixIcon:  Text(""),
                                    suffixIcon:  Text(""),
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height*0.02,),


                                Padding(
                                  padding: const EdgeInsets.only(right: 205.0,bottom: 6),
                                  child: TextUtils(text: 'Email',fontSize:13,fontWeight: FontWeight.normal,fontfamily: 'OleoScript',
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
                                    hintText: 'email',
                                    obscureText:false,
                                    prefixIcon:  Text(""),
                                    suffixIcon:  Text(""),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),

                                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 205.0,bottom: 6),
                                  child: TextUtils(text: 'Phone',fontSize:13,fontWeight: FontWeight.normal,fontfamily: 'OleoScript',
                                      color: darkbeige,underLine:
                                      TextDecoration.none),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 25,right: 25),
                                  child: CustomTextField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter a phone';
                                      }
                                      else if (!RegExp(validationPhone).hasMatch(value)) {
                                        return 'Invalid Phone';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onchange: (value ) {
                                      controller.phone=value;
                                    },
                                    hight: 10,
                                    width: 350,
                                    hintText: 'phone',
                                    obscureText:false,
                                    prefixIcon:  Text(""),
                                    suffixIcon:  Text(""),
                                  ),),
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
                                  Obx(
                                        () =>
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
                                          hight: 10,
                                          width: 350,
                                          hintText: 'password',
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
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 140.0,bottom: 6),
                                  child: TextUtils(text: 'Confirm Password',fontSize:13,fontWeight: FontWeight.normal,fontfamily: 'OleoScript',
                                      color: darkbeige,underLine:
                                      TextDecoration.none),
                                ),
                                 Padding(
                                  padding: const EdgeInsets.only(left: 25,right: 25),
                                  child:
                                  Obx(
                                        () =>CustomTextField(
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter a confirm password ';
                                        }
                                        if (value != controller.password) {
                                          return 'The password and its confirmation are not the same';
                                        } else {
                                          return null;
                                        }
                                      },
                                      onchange: (String ) {
                                        controller.confirm_password=String;

                                      },
                                      hight: 10,
                                      width: 350,
                                      hintText: 'password',
                                      prefixIcon: GestureDetector(
                                          onTap: () {
                                            _obscureText2.toggle();
                                            print(_obscureText2
                                                .value); // تبديل قيمة الـ RxBool بين true و false
                                          },
                                          child: Icon(
                                            _obscureText2.value
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: _obscureText2.value ? Colors.brown : Colors.brown,
                                          )),
                                      obscureText: _obscureText2.value,
                                      suffixIcon:Text(''),

                                    ),),
                                 ),

                                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                             Padding(
                               padding: const EdgeInsets.only(left:50,right: 50),
                               child: B_Button(
                                  hight: 45,
                                  text: 'Sign up',
                                  width: 270,
                                  onPressed: () {
    if (k.currentState!.validate()) {
       if (controller.image == null)
         EasyLoading.showInfo("please choose image");
         else
          onclickregisteruser();
    }
                                   //   Get.to(login());

                                  },


                                ),
                             ),


                              ],
                            ),
                          ),

                        ),
                      ),
                  ),),
                         Positioned(
                            top: MediaQuery.of(context).size.height*0.07,
                  left: MediaQuery.of(context).size.width*0.15,
                          child:     Stack(children: [
                            Container(
                              width: 180,
                              height: 150,
                            ),
                            Container(
                              width: 210,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color.fromRGBO(136, 102, 15, 0.5),
                                  width: 2,
                                ),
                                color: Colors.white,
                              ),
                              child: Obx(() {
                                if (controller.image == null &&
                                    controller.updat.value == false)
                                  return Icon(
                                    Icons.image,
                                    size: 40,
                                    color: Colors.grey.shade400,
                                  );
                                else
                                  return CircleAvatar(
                                      radius: 100, // قطر الدائرة
                                      backgroundImage: FileImage(controller.image!) // المسار لصورتك
                                  );
                                // Image.file(
                                //   controller.image!,
                                //   fit: BoxFit.cover,
                                // );
                              }),
                            ),
                            Positioned(
                              top: 80,
                              left: 134,
                              child: InkWell(
                                onTap: () {
                                  //  controller.getImage();
                                  _showBottomSheet(context);
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color.fromRGBO(136, 102, 15, 0.5),
                                      width: 1,
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Icon(
                                      Icons.add,
                                      size: 28,
                                      color: pink
                                  ),
                                ),
                              ),
                            )
                          ]),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

     ) );

  }
  void  onclickregisteruser() async{
   EasyLoading.show(status: 'loading');
    await  controller.onclickregisteruser();
    if( controller.registerstatus){
      EasyLoading.showSuccess('${controller.message}',duration:Duration (seconds:4));
     Get.offAllNamed('/login');
    }
    else{
      // print('${controller.error}');
      EasyLoading.showError('${controller.error}'
          ,duration:Duration (seconds:4));

    }
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
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Icon(
                        Icons.add_a_photo_outlined,
                        size: 28,
                        color: pink
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width *0.07),
                    InkWell(
                      onTap: () async{
                      await  controller.getImageCamera();
                        Get.back();
                      },
                      child: Text(
                        "Take the picture with the camera",
                        style: TextStyle(
                          fontFamily: 'OleoScript',
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.normal,
                          color: darkbeige,

                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Icon(
                        Icons.perm_media_outlined,
                        size: 28,
                        color: pink
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width *0.07),
                    InkWell(
                      onTap: () async{
                         await controller.getImage();
                        Get.back();
                      },
                      child: Text(
                        "Choose an image from the gallery",
                        style: TextStyle(
                          fontFamily: 'OleoScript',
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.normal,
                          color: darkbeige,

                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),

        );
      },
    );
  }
}