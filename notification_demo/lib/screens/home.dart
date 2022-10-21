import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:notification_demo/widgets/Text_Field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();
  late AndroidNotificationChannel channel;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();

    requestPermission();

    loadFCM();

    listenFCM();

    FirebaseMessaging.instance.subscribeToTopic("Animal");
  }

  void sendPushMessage(String token, String title, String body) async {
    try {
      print("inside http post");
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAAPQ9SqvE:APA91bGJoybTmZaJUsegZmi4A-Sd5YLcSakF8y2TroK2-Y27jqJqpUP2TCsXLU7P_OaD3Va3rEFS5qDXfsrWAB27yMZwp8KR21LedKpxqEjTnxn1arLtoU3c403iEKMOUTSHreh1HNSy',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{'title': title, 'body': body},
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            "to": token,
            // "fCQJ9zCFRGuPxAJMS6mFB2:APA91bHT19zW5C45pmIgfWn-toPqOYFOVFSmCVHdEnzOrGD6fXKbYO_J-u4eEB90pR4K_0Y9Hbwy7QDEk2vr8cN9PzKSCF6bJCmuWhy4-v5JJEi409RRbn1oNRV6geTnaiLMMhQSwjyU",
          },
        ),
      );
    } catch (e) {
      print("error push notification");
    }
  }

//   void getToken() async {
//     await FirebaseMessaging.instance.getToken().then((token) {
//       setState(() {
//         mtoken = token;
//       });

// //saveToken(token!);
//     });
//   }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  void listenFCM() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //only for foreground
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: '@mipmap/ic_launcher',
            ),
          ),
        );
      }
    });
  }

  void loadFCM() async {
    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        importance: Importance.high,
        enableVibration: true,
      );

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      /// Create an Android Notification Channel.
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextBox("Title", title, deviceSize),
            SizedBox(height: 10),
            TextBox("Body", body, deviceSize),
            ElevatedButton(
              onPressed: () async {
                String titleText = await title.text;
                String bodyText = await body.text;

                if (titleText != "" && bodyText != "") {
                  final fcmToken = await FirebaseMessaging.instance.getToken();
                  print("fcm token: $fcmToken");

                  sendPushMessage(fcmToken!, titleText, bodyText);
                }
              },
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 8, 84, 217)),
              child: const Text(
                'SUBMIT',
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
