import 'package:flutter/material.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;
import 'package:new_proj/consts/colors.dart';
import 'package:new_proj/consts/url.dart';
import 'package:new_proj/models/category_model.dart';
import 'package:new_proj/consts/storage.dart';
import 'package:new_proj/view/widget/button.dart';
import 'package:new_proj/view/widget/text.dart';

class HomeController extends GetxController {
Categories category=Categories( categories:[]);
var name="";
int status_cat=0;
// Categories category=Categories(categories: []);
// List<Category> list_category =[];
@override
  void onInit() async{
    super.onInit();
    Securestorage storage=new Securestorage();
                                
    Url.Token_user =(await storage.read('token_user')) ;
    await GetCategories();
    
      add();
    
  }
RxString sub= "".obs;
Rx<Category>  current_cat=Category(id: 0, name:"", mainCategory:0, subCategory: [], collections: []).obs;
Rx<Category>  basic_cat=Category(id: 0, name:"", mainCategory:0, subCategory: [], collections: []).obs;
Rx<Category> sub_cat = Category(id: 0, name:"", mainCategory: 0, subCategory: [], collections: [ ]).obs;
List<Category> maincat=[];
RxInt current=0.obs; 
final List<String> items = ["Product", "Collection"];
String? selectedSearch;
RxBool isDrawerOpen = false.obs;
RxBool isCollapsed = true.obs;
RxBool isDialogOpenauth = false.obs;
RxBool isSearch_product = false.obs;
RxBool isSearch_collection = false.obs;
 RxBool isLoading = true.obs;
final ZoomDrawerController zoomcontroller = ZoomDrawerController();

Rx<Category?> selectedCategory = Rx<Category?>(null);
  Rx<Category?> selectedMainCategory = Rx<Category?>(null);
  Rx<Category?> selectedSubCategory = Rx<Category?>(null);

  void updateSelectedCategory(Category? category) {
    selectedCategory.value = category;
  }

  void updateSelectedMainCategory(Category? category) {
    selectedMainCategory.value = category;
    selectedSubCategory.value = null;
  }

  void updateSelectedSubCategory(Category? category) {
    selectedSubCategory.value = category;
  }


// إنشاء عناصر Container بعدد معين
  void add(){
    for (var i = 0; i < category.categories.length; i++) {
           print("cat");
           print("${category.categories[i].mainCategory}");
           if(category.categories[i].mainCategory==null){
            print("name cat");
              print("${category.categories[i].name}");
              maincat.add(category.categories[i]);
              current_cat.value=maincat[0];
               if(current_cat.value.subCategory.length>0)
                                       sub_cat.value= current_cat.value.subCategory[0];
              }

        }
        print( maincat.length);      
    }
  


   List<String> str_sub(Category cat){
    List<String> names =[];
    for (var i = 0; i < cat.subCategory.length; i++) {
        print("${cat.subCategory[i].name}");
        names.add(cat.subCategory[i].name);
        // basic_cat.value=current_cat.value;
       
    }
    return names;
  }

  

  void toggleDrawer() {
    isDrawerOpen.value = !isDrawerOpen.value;
  }

  Future<Categories> GetCategories() async {
     maincat=[];
    print("Getttttttttt");
    try {
       var headers = { 
        'Accept': 'application/json',
         
      };
      print("1111");
      var request = http.Request(
        'GET',
        // Uri.https(Url.domain, "/provider/all"),
        Uri.parse("${Url.domain}/api/v1/category/all")
      );
      print("22222");

      request.headers.addAll(headers);
      print("3333333");
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      print("4444");
      status_cat= response.statusCode;
      if (response.statusCode == 200 || response.statusCode == 201) {
        add();
        print("eeeeeeeeeee");
        status_cat=response.statusCode;
        category=categoriesFromJson(responseBody);
        print("eeeeeeeeeee");
        isLoading.value = false;
        print("yesss getcategory");
        print(maincat.length);
         print("5555");
        print(response.statusCode);
         print("6666");
        print(responseBody);
         print("7777");
        return category;}
         else {
       
 
    print(response.statusCode);
    print(responseBody);
    return category;
  }
        
      
    } catch (e) {
      print("exception");
      print(e.toString());
      return category;
    }
     
        
  
  }
  

   void openDialog(BuildContext context) {
    isDialogOpenauth.value = true;
    Get.dialog(AlertDialog(
        titlePadding: EdgeInsets.only(top: 30, left: 190),
       
        content: Container(
          height: 300,
          width: 100,
          child: Column(
            children: [
              Row(
                children: [
                  // SizedBox(
                  //   width: 5,
                  // ),
                  IconButton(
                      onPressed: () {
                        //  print("Email is ${controller1.profile!.user.email}");

                        Get.back();
                      },
                      icon: Icon(
                        Icons.chevron_left,
                        color: Colors.black87,
                        size: 26,
                      )),
                ],
              ),
              TextUtils(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  fontfamily: 'OleoScript',
                  text: " You must log in to \n do this procedure",
                  color: Colors.black54,
                  underLine: TextDecoration.none),
              
              SizedBox(
                height: 30,
              ),
              Button(
                onPressed: () async {
                  //controller.addprod2();
                  
                  Get.offNamed('/login');
                },
                color: pink,
                text: "  Sign in",
                hight: 40,
                width: 100,
              ),
               SizedBox(
                height: 10,
              ),
              Button(
                onPressed: () async {
                  //controller.addprod2();
                  
                  Get.offNamed('/registeruser');
                },
                color: pink,
                text: "  Sign Up",
                hight: 40,
                width: 100,
              ),
          
            ],
          ),
        )));
  }
  
  
  }


