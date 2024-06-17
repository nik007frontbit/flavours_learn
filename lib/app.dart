import 'package:flavours_learn/notification/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'main_production.dart';

class App extends StatelessWidget {
  final String flavour;

  const App({super.key, required this.flavour});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseApi().initForegroundMessageFromFirebase(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flavour"),
      ),
      /*floatingActionButton: FloatingActionButton(
          onPressed: showNotification,
          tooltip: 'Notification',
          child: const Icon(Icons.notification_add),
        ),*/
    );
  }
}

