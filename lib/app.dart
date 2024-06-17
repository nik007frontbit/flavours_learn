import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'main_production.dart';

class App extends StatelessWidget {
  final String flavour;

  const App({super.key, required this.flavour});

  Future<void> showNotification() async {
    AndroidNotificationDetails androidNotificationDetails =
    const AndroidNotificationDetails(
      "notification-leaning",
      "Local Notification",
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
        0, "First notification", "Here i am boy", notificationDetails,
        payload: "notification-0");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(flavour),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: showNotification,
          tooltip: 'Notification',
          child: const Icon(Icons.notification_add),
        ),
      ),
    );
  }
}
