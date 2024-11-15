// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
// import 'package:get/get.dart';
// import 'package:untitled2/consts/colors.dart';
// import 'package:untitled2/controller/home_controller.dart';
// import 'package:untitled2/view/screens/User/drawer.dart';
// import 'package:untitled2/view/screens/help.dart';
// import 'package:untitled2/view/screens/homepage.dart';

// class main_screen extends StatelessWidget {
 
// var controller = Get.find<HomeController>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//          ZoomDrawer(
//           slideWidth: MediaQuery.of(context).size.width *0.6,
          
//           controller:controller.zoomcontroller ,
//           mainScreenScale: 0.25,
//           borderRadius: 40,
//         menuScreen: drawer(),
//         mainScreen: homepage (),
       
//         angle: 0,
        
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';





class main_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Text('Drawer Header'),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                  ListTile(
                    title: Text('Item 1'),
                    onTap: () {
                      // Handle item 1 tap
                    },
                  ),
                  ListTile(
                    title: Text('Item 2'),
                    onTap: () {
                      // Handle item 2 tap
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Text('Main Content'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
