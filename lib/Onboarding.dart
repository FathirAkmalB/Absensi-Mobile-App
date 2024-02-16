import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
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
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top:100),
                width: double.infinity,
                height: 400,
                child: PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: <Widget>[
                    Container(
                      child: Column(children:[
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
                      ])
                    ),
                    Container(
                      child: Column(children:[
                        Image.asset('images/Ob2.png'),
                        SizedBox(height: 50),
              Text(
                'Baca berita hari ini',
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
                      ])
                    ),
                    Container(
                      child: Column(children:[
                        Image.asset('images/Ob3.png'),
                        SizedBox(height: 50),
              Text(
                'Periksa kembali riwayat',
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
                      ])
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.0,
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
              SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage > 0) {
                        _controller.previousPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }
                    },
                    child: Text('Back'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage < 2) {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }
                    },
                    child: Text('Next'),
                  ),
                ],
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}