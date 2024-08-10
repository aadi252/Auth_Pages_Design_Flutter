import 'package:flutter/material.dart';
import 'package:auth_pages/Authentication/RegisterPage.dart';


import 'Authentication/MobileNO.dart';
import 'Authentication/OTPVerification.dart';
import 'LoginPage.dart';

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
        title: 'Flutter Demo',


        home: LoginPage()
    );
  }
}

