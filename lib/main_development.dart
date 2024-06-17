import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'api.dart';
import 'app.dart';
import 'firebase_options.dart';

Future<void> main() async {

  runApp(const App(flavour: "Development"));
}
