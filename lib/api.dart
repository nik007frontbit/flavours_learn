import 'package:firebase_messaging/firebase_messaging.dart';

String fcm = "";

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;


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
