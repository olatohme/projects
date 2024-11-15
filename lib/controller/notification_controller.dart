import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_proj/consts/colors.dart';
import '../models/my_favorite _model.dart';
import '../consts/url.dart';

import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
class notificationController extends GetxController {



 
  @override
  void onInit() {
    
    onConnectPressed(); 
    super.onInit();
  }


   PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  String _log = 'output:\n';

  // القيم الثابتة التي كانت تُدخل عبر الواجهة
  final String _apiKey = '904165ee74882b2c44dd'; // استبدل بـ API Key الخاص بك
  final String _cluster = 'eu'; // استبدل بـ Cluster الخاص بك
  final String _channelName = 'ola_channel'; // استبدل بـ Channel Name الخاص بك
  final String _eventName = 'my_event';
  final String _data = 'test';

  void log(String text) {
    print("LOG: $text");
    
      _log += text + "\n";
    
  }
  Future<void> Notification() async {


    try {
     
      final response = await http.get(
        Uri.parse('${Url.domain}'+'/customer/notifications'),
        headers: {
          'Authorization': 'Bearer ${Url.Token_user}',
               'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print("200  notiifi");
        final List<dynamic> data = json.decode(response.body);
        print(data);
      } else {
        Get.snackbar('Error', 'Failed notifi');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      
    }
  }


  void onConnectPressed() async {
    try {
      await pusher.init(
        apiKey: _apiKey,
        cluster: _cluster,
        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: onEvent, // استقبال الأحداث
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
        onSubscriptionCount: onSubscriptionCount,
      );
      await pusher.subscribe(channelName: _channelName);
      await pusher.connect();
    } catch (e) {
      log("ERROR: $e");
    }
  }

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    log("Connection: $currentState");
  }

  void onError(String message, int? code, dynamic e) {
    log("onError: $message code: $code exception: $e");
  }

  void onEvent(PusherEvent event) {
    // طباعة الرسالة عند استلام إشعار
    log("Received event: ${event.eventName} with data: ${event.data}");
    if(event.data != null)
      Get.snackbar("", event.data,
    backgroundColor: Colors.white12
    );
      onConnectPressed(); 
    // هنا يمكن إضافة أي منطق إضافي لل  تعامل مع الإشعار المستلم
  }

  void onSubscriptionSucceeded(String channelName, dynamic data) {
    log("onSubscriptionSucceeded: $channelName data: $data");
    final me = pusher.getChannel(channelName)?.me;
    log("Me: $me");
  }

  void onSubscriptionError(String message, dynamic e) {
    log("onSubscriptionError: $message Exception: $e");
  }

  void onDecryptionFailure(String event, String reason) {
    log("onDecryptionFailure: $event reason: $reason");
  }

  void onMemberAdded(String channelName, PusherMember member) {
    log("onMemberAdded: $channelName user: $member");
  }

  void onMemberRemoved(String channelName, PusherMember member) {
    log("onMemberRemoved: $channelName user: $member");
  }

  void onSubscriptionCount(String channelName, int subscriptionCount) {
    log("onSubscriptionCount: $channelName subscriptionCount: $subscriptionCount");
  }

  dynamic onAuthorizer(String channelName, String socketId, dynamic options) {
    return {
      "auth": "foo:bar",
      "channel_data": '{"user_id": 1}',
      "shared_secret": "foobar"
    };
  }
 void _showTopSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('This is a top snackbar!'),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05, // نسبة من ارتفاع الشاشة
        left: 20,
        right: 20,
      ),
      duration: Duration(seconds: 3), // مدة عرض الاشعار
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
