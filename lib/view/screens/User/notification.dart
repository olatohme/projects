import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';





class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  String _log = 'output:\n';

  // القيم الثابتة التي كانت تُدخل عبر الواجهة
  final String _apiKey = '720a630f4d8593f3a0f9'; // استبدل بـ API Key الخاص بك
  final String _cluster = 'ap1'; // استبدل بـ Cluster الخاص بك
  final String _channelName = 'YOUR_CHANNEL_NAME'; // استبدل بـ Channel Name الخاص بك
  final String _eventName = 'client-event';
  final String _data = 'test';

  void log(String text) {
    print("LOG: $text");
    setState(() {
      _log += text + "\n";
    });
  }

  @override
  void initState() {
    super.initState();
    onConnectPressed(); // الاتصال تلقائيًا عند بدء التطبيق
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
    // هنا يمكن إضافة أي منطق إضافي للتعامل مع الإشعار المستلم
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

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        // عرض السجل فقط في الواجهة بدون أي تفاعل
        // body: Center(child: Text('Connecting to Pusher...')),
      ),
    );
  }
}