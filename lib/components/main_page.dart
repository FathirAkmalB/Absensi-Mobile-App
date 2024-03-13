import 'package:absensi_mobile/data/data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TapIn extends StatefulWidget {
  const TapIn({super.key});

  @override
  State<TapIn> createState() => _TapInState();
}

class _TapInState extends State<TapIn> {
  @override
  Widget build(BuildContext context) {
      double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    double font12 = widthScreen * 0.038;
    double font14 = widthScreen * 0.042;


    return Container(
      margin: EdgeInsets.symmetric(horizontal: widthScreen * 0.06),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Presensi terbaru',
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: textMedium, color: blackText)),
          const SizedBox(height: 15),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: widthScreen,
                height: widthScreen * 0.28,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: whiteBg, borderRadius: BorderRadius.circular(10)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Senin 12 januari 2024',
                            style: TextStyle(fontSize: 12, color: Colors.blue),
                          ),
                          Row(children: [
                            Text(
                              'Berhasil Melakukan ',
                              style: GoogleFonts.poppins(
                                fontWeight: textMedium,
                                  fontSize: 14, color: blackText),
                            ),
                            Text(
                              ' TAP IN',
                              style: GoogleFonts.poppins(
                                fontWeight: textBold,
                                  fontSize: 14, color: Colors.blue),
                            ),
                          ]),
                          SizedBox(height: 15),
                          Text(
                            'Time In: 06:40 | Senin, 12 Januari 2024',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Image.asset('images/GreenCheck.png')
                    ]),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: widthScreen,
                height: widthScreen * 0.28,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: whiteBg, borderRadius: BorderRadius.circular(10)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Senin 12 januari 2024',
                            style: TextStyle(fontSize: 12, color: Colors.blue),
                          ),
                          Row(children: [
                            Text(
                              'Berhasil Melakukan ',
                              style: GoogleFonts.poppins(
                                fontWeight: textMedium,
                                  fontSize: 14, color: blackText),
                            ),
                            Text(
                              ' TAP IN',
                              style: GoogleFonts.poppins(
                                fontWeight: textBold,
                                  fontSize: 14, color: Colors.blue),
                            ),
                          ]),
                          SizedBox(height: 15),
                          Text(
                            'Time In: 06:40 | Senin, 12 Januari 2024',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Image.asset('images/GreenCheck.png')
                    ]),
              ),  ],
          )
        ],
      ),
    );
  }
}
