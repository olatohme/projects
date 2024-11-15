

import 'package:get/get.dart';
import 'package:new_proj/bindings/Addwork_binding.dart';
import 'package:new_proj/bindings/Tasks_binding.dart';
import 'package:new_proj/bindings/add_address_binding.dart';
import 'package:new_proj/bindings/add_report_binding.dart';
import 'package:new_proj/bindings/cart_bindings.dart';
import 'package:new_proj/bindings/contact_binding.dart';
import 'package:new_proj/bindings/create_order_bindings.dart';
import 'package:new_proj/bindings/loginprovider_bindings.dart';
import 'package:new_proj/bindings/my_favorite_binding.dart';
import 'package:new_proj/bindings/order_success_binding.dart';
import 'package:new_proj/bindings/posts_binding.dart';
import 'package:new_proj/bindings/product_details_binding.dart';
import 'package:new_proj/bindings/profile_provider_binding.dart';
import 'package:new_proj/bindings/login_binding.dart';


import 'package:new_proj/bindings/profile_update_provider_binding.dart';
import 'package:new_proj/bindings/profile_update_user_binding.dart';
import 'package:new_proj/bindings/profile_user_binding.dart';
import 'package:new_proj/bindings/registeruser_bindings.dart';
import 'package:new_proj/bindings/search_provider_binding.dart';
import 'package:new_proj/bindings/show_provider_binding.dart';
import 'package:new_proj/view/screens/Provider/accept.dart';

import 'package:new_proj/view/screens/Provider/addwork.dart';
import 'package:new_proj/view/screens/Provider/login_provider.dart';
import 'package:new_proj/view/screens/Provider/posts.dart';
import 'package:new_proj/view/screens/Provider/profile_provider.dart';
import 'package:new_proj/view/screens/Provider/wait.dart';
import 'package:new_proj/view/screens/User/add_reports.dart';
import 'package:new_proj/view/screens/User/cart2.dart';
import 'package:new_proj/view/screens/User/map.dart';
import 'package:new_proj/view/screens/User/my_favorite.dart';
import 'package:new_proj/view/screens/User/myorders.dart';
import 'package:new_proj/view/screens/User/posts_user.dart';
import 'package:new_proj/view/screens/User/profile_update_user.dart';
import 'package:new_proj/view/screens/User/profile_user.dart';
import 'package:new_proj/view/screens/Provider/show_provider.dart';
import 'package:new_proj/view/screens/User/search_provider_view.dart';
import 'package:new_proj/view/screens/User/bouqets.dart';
import 'package:new_proj/view/screens/User/cart.dart';
import 'package:new_proj/view/screens/User/create_order.dart';
import 'package:new_proj/view/screens/User/product_details.dart';

import 'package:new_proj/view/screens/User/add_address.dart';
import 'package:new_proj/view/screens/User/drawer.dart';
import 'package:new_proj/view/screens/User/main_screen.dart';

import 'package:new_proj/view/screens/User/contact_us.dart';

import 'package:new_proj/view/screens/User/homepage.dart';

import 'package:new_proj/view/screens/User/login_screen.dart';

import 'package:new_proj/view/screens/User/order1.dart';
import 'package:new_proj/view/screens/User/order_successful.dart';

import 'package:new_proj/view/screens/User/providers.dart';
import 'package:new_proj/view/screens/User/regiseruser_screen.dart';
import 'package:new_proj/view/screens/Provider/register_provider_screen.dart';
import 'package:new_proj/view/screens/User/transaction.dart';

import 'package:new_proj/view/screens/Welcome/splash_screen.dart';
import 'package:new_proj/view/screens/Welcome/user_or_provider.dart';

import 'package:new_proj/view/screens/Provider/tasks.dart';
import 'package:new_proj/view/screens/User/signup_or_signin.dart';


import '../bindings/providers_binding.dart';
import '../view/screens/Provider/profile_update_provider.dart';
import '../view/screens/Welcome/welcome_screen.dart';


//import 'package:loyalty/bindings/addoffer_binding.dart';



class AppRoutes {
  //initialRoute

  static const Home =  '/splach';
  
  //getPagess

  static final routes = [

      // GetPage(name: '/cart2', page: ()=> cart2(),),
    GetPage(name: '/MyFavorite', page: ()=> MyFavorite(),binding: MyFavoriteBinding()),
    GetPage(name: '/splach', page: ()=> splash_screen()),
      GetPage(name: '/myorders', page: ()=> myorders()),
    GetPage(name: '/transaction', page: ()=> transaction_screen()),
    GetPage(name: '/AddReport', page: ()=> AddReport(),binding: AddReportBinding()),
      GetPage(name: '/profileUser', page: ()=> ProfileUser(),binding: ProfileUserBinding()),
       GetPage(name: '/accept', page: ()=> Accept()),
         GetPage(name: '/wait', page: ()=> Wait()),
    GetPage(name: '/profileUpUser', page: ()=> ProfileUPdateUser(),binding:ProfileUpdateUser_Binding()),
    GetPage(name: '/profileProvider', page: ()=> ProfileProvider(),binding: ProfileProviderBinding()),
    GetPage(name: '/profileUPProvider', page: ()=> ProfileUPdatePro(),binding: ProfileUpdateProvider_Binding()),
    GetPage(name: '/ContactUS', page: ()=> ContactUs(),binding: ContactBinding()),
    GetPage(name: '/AddAddress', page: ()=> AddAddress(),binding: addAddressbinding()),
    GetPage(name: '/ProductDetails', page: ()=> ProductDetails(),binding: ProductDetails_binding()),
    GetPage(name: '/posts', page: ()=> Posts(),binding: PostsBinding()),
    GetPage(name: '/posts_user', page: ()=> Posts_user(),binding: PostsBinding()),

    GetPage(name: '/OrderSuccess', page: ()=> OrderSuccess(),binding: OrderSuccessBinding()),
     GetPage(name: '/bouqets', page: ()=> bouqets()),
      GetPage(name: '/providers', 
            page: ()=> Providers ( ),
             binding: providerbinding()),
    // GetPage(name: '/userorprovidersignin',
    //     page: ()=> signinuserorprovider ( ),
    //   ),

    GetPage(name: '/SearchProv', page: ()=> SearchProviderView(),binding: SearchProviderBinding()),
    GetPage(name: '/loginprovider',
        page: ()=> loginprovider ( ),binding: loginproviderbinding()),
              GetPage(name: '/order', 
            page: ()=> order(),
             ),
    GetPage(name: '/create_order',
        page: ()=> create_order ( ),
        binding: create_order_binding()),
    GetPage(name: '/cart',
        page: ()=> cart2 ( ),
        binding: cartbinding()),
            //  GetPage(name: '/map',
            // page: ()=> MyMap(),),
                   GetPage(name: '/drawer', 
            page: ()=>drawer ( ),
             ),
              GetPage(name: '/main', 
            page: ()=>main_screen( ),
             ),
             
           
             GetPage(name: '/home', 
            page: ()=> homepage( ),
            ),
      GetPage(name: '/tasks',
              page: ()=> Tasks ( ),
              binding: tasksbinding()),
      GetPage(name: '/addwork',
              page: ()=> AddWork ( ),
              binding: addworkbinding()),
      GetPage(name: '/welcome', 
              page: ()=> screens( )),
                 
        GetPage(
            name: '/login',
            page: () => login(),
          //  binding: loginbinding(),
            binding: loginbinding()
      ),
        GetPage(
            name: '/registeruser',
            page: () => registeruser(),
            binding: registeruserbinding()
        ),
        
        //  GetPage(
        //     name: '/signorlogin_prov',
        //     page: () => signorlogin_prov(),
        //   //  binding: registeruserbinding()
        // ),
        GetPage(
            name: '/signorlogin',
            page: () => signorlogin(),
          //  binding: registeruserbinding()
        ),

        GetPage(
          name: '/signupfirst',
          page: () => signupfirst(),
          //  binding: registeruserbinding()
        ),
        GetPage(
          name: '/registerprovider',
          page: () => registerprovider(),
          //  binding: registeruserbinding()
        ),
     GetPage(name: '/showprovider', page: ()=> ShowProvider(),binding: ShowProviderBinding()),
    
  ];
}

