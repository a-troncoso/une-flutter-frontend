import 'package:flutter/material.dart';
import './home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: HomeScreen()
    );
  }
}