import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:new_proj/view/widget/text.dart';
import '../../../../consts/colors.dart';
import '../../../../consts/url.dart';
import '../../../../controller/posts_controller.dart';

class Posts extends StatelessWidget {
  final PostController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
        //  Obx(() {
        //   if (controller.isLoading.value) {
        //     return Center(child: CircularProgressIndicator());
        //   } else if (controller.profile.value.posts.isEmpty) {
        //     return Center(
        //       child: TextUtils(
        //         fontSize: 30,
        //         fontWeight: FontWeight.normal,
        //         text: "No Posts Found",
        //         color: Colors.brown,
        //         underLine: TextDecoration.none,
        //         fontfamily: 'OleoScript',
        //       ),
        //     );
        //   } else {
        //     return 
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: ShapeDecoration(
                gradient: backColor,
                shape: RoundedRectangleBorder(),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.chevron_left),
                        color: Colors.brown,
                        iconSize: 25,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.27),
                      TextUtils(
                        fontSize: 30,
                        fontWeight: FontWeight.normal,
                        text: "Posts",
                        color: Colors.brown,
                        underLine: TextDecoration.none,
                        fontfamily: 'OleoScript',
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width * 0.5),
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/addwork');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown.shade500,
                          minimumSize: Size(MediaQuery.of(context).size.width * 0.08, MediaQuery.of(context).size.height * 0.05),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                          ),
                        ),
                        child: Row(
                          children: [
                            TextUtils(
                              color: Colors.white,
                              text: "Add Your Work  ",
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontfamily: 'OleoScript',
                              underLine: TextDecoration.none,
                            ),
                            Icon(Icons.add, color: Colors.white, size: 25),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Expanded(
                    child:  Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.profile.value.posts.isEmpty) {
            return Center(
              child: TextUtils(
                fontSize: 30,
                fontWeight: FontWeight.normal,
                text: "No Posts Found",
                color: Colors.brown,
                underLine: TextDecoration.none,
                fontfamily: 'OleoScript',
              ),
            );
          } else {
            return Container(
                      height: 350,
                      width: 375,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.2),
                            spreadRadius: 3.0,
                            blurRadius: 5.0,
                          ),
                        ],
                      ),
                      child: ListView.builder(
                        itemCount: controller.profile.value.posts.length,
                        itemBuilder: (context, index) {
                          final post = controller.profile.value.posts[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 2.0),
                            child: Card(
                              color: Color.fromRGBO(238, 224, 203, 1.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    post.imageUrls.isNotEmpty
                                        ? SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.25,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: post.imageUrls.length,
                                        itemBuilder: (context, galleryIndex) {
                                          return Padding(
                                            padding: EdgeInsets.only(right: 10.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(17),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black.withOpacity(0.2),
                                                    spreadRadius: 3.0,
                                                    blurRadius: 5.0,
                                                  ),
                                                ],
                                              ),
                                              height: 280,
                                              width: 200,
                                              child: InstaImageViewer(
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                                  child: Image.network(
                                                    '${Url.domain}${post.imageUrls[galleryIndex]}',
                                                    height: 280,
                                                    width: 200,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                        : SizedBox.shrink(),
                                    SizedBox(height: 5),
                                    TextUtils(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      text: "${post.description}",
                                      color: Colors.black,
                                      fontfamily: 'OleoScript',
                                      underLine: TextDecoration.none,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),);}
                    }))
                ]))));}}
                    
                    
                    
    

