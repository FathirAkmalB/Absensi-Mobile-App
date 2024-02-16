import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Stack(
         children: [
           Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset('images/Onboarding.png', fit: BoxFit.fill)
           ),

           Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top:100),
            child: Column(children:[

              PageView(
                              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
                children:[
                  Column(children:[
                    Image.asset('images/Ob1.png'),
              SizedBox(height: 50),
              Text(
                'Periksa Kehadiranmu',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                )
                ),
              Container(
                margin: EdgeInsets.only(top:15),
                width: 300,
                child: Text(
                  'Ullamcorper purus at ultricies mauris congue mauris tortor molestie tellus.',
                  textAlign: TextAlign.center,
                ),
              ),
                  ]),
                  
                  Column(children:[
                    Image.asset('images/Ob2.png'),
              SizedBox(height: 50),
              Text(
                'Baca Berita Hari Ini',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                )
                ),
              Container(
                margin: EdgeInsets.only(top:15),
                width: 300,
                child: Text(
                  'Ullamcorper purus at ultricies mauris congue mauris tortor molestie tellus.',
                  textAlign: TextAlign.center,
                ),
              ),
                  ]),
                  
                  Column(children:[
                    Image.asset('images/Ob3.png'),
              SizedBox(height: 50),
              Text(
                'Periksa kembali riwayat-mu',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                )
                ),
              Container(
                margin: EdgeInsets.only(top:15),
                width: 300,
                child: Text(
                  'Ullamcorper purus at ultricies mauris congue mauris tortor molestie tellus.',
                  textAlign: TextAlign.center,
                ),
              ),
                  ]),
                  
                ]
              ),

              SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.blue,
              dotWidth: 10,
              dotHeight: 10,
            ),
          ),
            ])
           )
         ],
       )
    );
  }
}