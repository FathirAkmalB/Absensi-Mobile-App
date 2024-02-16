import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/Splash.png'),
            const SizedBox(height: 20),
            const Text('STAR ATTENDANCE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20
            )
            )
          ]
        ),
      )
    );
  }
}