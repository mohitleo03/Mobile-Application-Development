import 'dart:developer';

import 'package:fcm_app/routers/app_routers.dart';
import 'package:fcm_app/routers/routers.dart';
import 'package:fcm_app/services/notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.getToken().then((value) {
      String? tokenFcm = value;
      log('FCM Token User: $tokenFcm');
    });

    FirebaseMessaging.instance.getInitialMessage().then((message) async {
      if (message != null) {
        final redirectRoute = message.data['screen'];
        if (redirectRoute != null) {
          if (redirectRoute == "home1") {
            Get.offAllNamed(AppRouters.home1);
          } else if (redirectRoute == "home2") {
            Get.offAllNamed(AppRouters.home2);
          }
        }
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('onMessage data is ${message.data}');
      log('onMessage notification is ${message.notification}');

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null) {
        NotificationService.displayNotification(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('Just received a notification when app is opened');
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FCM App',
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouters.root,
      getPages: Routers.route,
    );
  }
}
