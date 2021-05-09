import 'package:flutter/material.dart';
import 'animation_test.dart';
import 'animation_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: AnimationButton(),
    );
  }
}

