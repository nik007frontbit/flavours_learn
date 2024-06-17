import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flavours_learn/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'api.dart';
import 'firebase_options.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await FirebaseApi().initNotification();
  FirebaseApi().initNoti();
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

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
  bool? initialized =
      await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(const App(flavour: "Production"));
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message");
}
