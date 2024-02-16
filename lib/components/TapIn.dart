import 'package:flutter/material.dart';

class TapIn extends StatefulWidget {
  const TapIn({super.key});

  @override
  State<TapIn> createState() => _TapInState();
}

class _TapInState extends State<TapIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Tap In Terbaru', style: TextStyle(fontSize: 16)),
          SizedBox(height:20),
          Container(
            width: double.infinity,
            height: 100,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Senin 12 januari 2024',
                        style: TextStyle(fontSize: 10, color: Colors.blue),
                      ),

                      Row(children: [
                        Text(
                          'Berhasil Melakukan ',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          ' TAP IN',
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ]),
                      SizedBox(height: 15),
                      Text(
                        'Time In: 06:40 | Senin, 10 Januari 2024',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  Image.asset('images/GreenCheck.png')
                ]),
          )
        ],
      ),
    );
  }
}
