import 'dart:async';

import 'package:absensi_mobile/onboarding_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Onboarding(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
      width: widthScreen,
      decoration: const BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
            image: AssetImage('images/SplashScreen.png'), fit: BoxFit.cover),
      ),
    ));
  }
}
