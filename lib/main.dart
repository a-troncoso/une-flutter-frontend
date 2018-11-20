import 'package:flutter/material.dart';
import './app.dart';

void main() {
  runApp(UneApp());
}

class UneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UNE - Project',
      home: App(),
      theme: new ThemeData(
        primaryColor: Colors.white
      )
    );
  }
}
