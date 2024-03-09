import 'package:absensi_mobile/data/data.dart';
import 'package:absensi_mobile/login_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
      child: Container(
        width: widthScreen,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/Onboarding.png'), fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 100),
              width: widthScreen,
              height: heightScreen * 0.7,
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: <Widget>[
                  Container(
                      child: Column(children: [
                    Container(
                      width: widthScreen * 0.7,
                      height: widthScreen * 0.7,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/Ob1.png'),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(height: widthScreen * 0.2),
                    const Text('Periksa Kehadiranmu',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      width: 300,
                      child: const Text(
                        'Ullamcorper purus at ultricies mauris congue mauris tortor molestie tellus.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ])),
                  Container(
                      child: Column(children: [
                    Container(
                      width: widthScreen * 0.7,
                      height: widthScreen * 0.7,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/Ob2.png'),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(height: widthScreen * 0.2),
                    const Text('Baca berita hari ini',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      width: 300,
                      child: const Text(
                        'Ullamcorper purus at ultricies mauris congue mauris tortor molestie tellus.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ])),
                  Container(
                      child: Column(children: [
                    Container(
                      width: widthScreen * 0.7,
                      height: widthScreen * 0.7,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/Ob3.png'),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(height: widthScreen * 0.2),
                    const Text('Periksa kembali riwayat',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      width: 300,
                      child: const Text(
                        'Ullamcorper purus at ultricies mauris congue mauris tortor molestie tellus.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ])),
                ],
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.blue,
                dotWidth: 10,
                dotHeight: 4,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                  ),
                  onPressed: () {
                    if (_currentPage > 0) {
                      _controller.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Text(
                    'Kembali',
                    style: GoogleFonts.mulish(
                        color: blackText, fontWeight: textBold, fontSize: 12),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage < 2) {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: blueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Text('Berikutnya',
                  style: GoogleFonts.mulish(
                    fontSize: 12,
                    fontWeight: textBold,

                  ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
