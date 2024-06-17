import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flavours_learn/notification/notification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../main_production.dart';

String fcm = "";

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  initForegroundMessageFromFirebase(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
      initNotificationLocalSetting(context, message);
      showLocalNotification(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');

        handelMessage(context, message);
      }
    });
  }

  initNotificationLocalSetting(
      BuildContext context, RemoteMessage message) async {
    //only local notification
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings("@mipmap/ic_launcher");
    DarwinInitializationSettings darwinInitializationSettings =
        const DarwinInitializationSettings(
      requestBadgePermission: true,
      requestAlertPermission: true,
      requestCriticalPermission: true,
      requestSoundPermission: true,
    );
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );
    bool? initialized = await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        handelMessage(context, message);
      },
    );
  }

  handelMessage(BuildContext context, RemoteMessage message) {
    if (message.data['type'] == 'msg') {
      navigatorKey.currentState!.push(CupertinoPageRoute(
        builder: (context) => NotificationScreen(),
      ));
    }
  }

  showLocalNotification(RemoteMessage message) async {
    AndroidNotificationChannel androidNotificationChannel =
        AndroidNotificationChannel(
      '1',
      "high importance notification",
      importance: Importance.max,
    );
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      androidNotificationChannel.id,
      androidNotificationChannel.name,
      priority: Priority.max,
      importance: Importance.high,
    );
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification!.title.toString(),
      message.notification!.body.toString(),
      notificationDetails,
    );
  }

  initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();

    print("TOken :- $fcmToken");
  }

  initNoti() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    fcm = fcmToken.toString();
    print("TOken :- $fcmToken");
  }
}
