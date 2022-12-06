import 'package:fcm_app/firebase_options.dart';
import 'package:fcm_app/my_app.dart';
import 'package:fcm_app/routers/app_routers.dart';
import 'package:fcm_app/services/notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (kDebugMode) {
    print('A background message just showed up :  ${message.toMap()}');
  }
  if (message.data['screen'] == "home1") {
    Get.offAllNamed(AppRouters.home1);
  } else if (message.data['screen'] == "home2") {
    Get.offAllNamed(AppRouters.home2);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await NotificationService.initLocalNotification();
  runApp(const MyApp());
}
