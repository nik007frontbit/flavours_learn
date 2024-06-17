import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final String flavour;

  const App({super.key, required this.flavour});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(flavour),
        ),
      ),
    );
  }
}
