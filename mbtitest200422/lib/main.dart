import 'package:flutter/material.dart';

import './screen/main_screen.dart';
import './screen/result_screen.dart';
import './screen/test_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' : (context) => MainScreen(),
        TestScreen.routename : (context) => TestScreen(),
        ResultScreen.routename : (context) => ResultScreen(),
      },
    );
  }
}