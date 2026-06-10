import 'package:flutter/material.dart';
import 'package:login_screens/forgot.dart';
import 'package:login_screens/login.dart';
import 'package:login_screens/signup.dart';
import 'package:login_screens/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Forgot(),
    );
  }
}