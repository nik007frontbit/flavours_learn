import 'package:firebase_core/firebase_core.dart';
import 'package:flavours_learn/app.dart';
import 'package:flutter/cupertino.dart';

import 'api.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await FirebaseApi().initNotification();
  FirebaseApi().initNoti();
  runApp(const App(flavour: "Production"));
}