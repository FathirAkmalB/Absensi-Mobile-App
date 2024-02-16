import 'package:absensi_mobile/Onboarding.dart';
import 'package:flutter/material.dart';
import 'Splash.dart';
import 'Home.dart';
import 'tes.dart';
import 'Login.dart';
import 'tes.dart';
import 'Onboarding.dart';
import 'DetailPrecense.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}