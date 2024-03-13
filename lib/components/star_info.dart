import 'package:absensi_mobile/data/data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StarInfo extends StatefulWidget {
  const StarInfo({super.key});

  @override
  State<StarInfo> createState() => _StarInfoState();
}

class _StarInfoState extends State<StarInfo> {
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    double font12 = widthScreen * 0.038;
    double font14 = widthScreen * 0.042;

    return Container(
      width: widthScreen,
      margin:
          EdgeInsets.symmetric(horizontal: widthScreen * 0.06, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'STARBHAK ',
                style: GoogleFonts.salsa(
                    fontWeight: textMedium, fontSize: 16, color: blackText),
              ),
              Text('INFO',
                  style: GoogleFonts.salsa(
                      fontWeight: textMedium, fontSize: 16, color: blueSky)),
            ],
          ),
          SizedBox(height: 10,),
          Container(
            margin:const EdgeInsets.only(bottom: 20),
            width: widthScreen,
            height: widthScreen * 0.3,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Row(
              children: [
                Container(
                  width: widthScreen * 0.3,
                  height: widthScreen * 0.3,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                          image: AssetImage('images/berita.png'),
                          fit: BoxFit.cover)),
                ),
                Container(
                  width: widthScreen * 0.5,
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Lorem ipsum dolor sit amet consectetur. Non pharetra diam amet mi.',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: textMedium,
                          color: blackText,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Created at',
                                style: GoogleFonts.poppins(
                                  fontSize: 8,
                                  color: hintText,
                                ),
                              ),
                              Text(
                                ' 12 January',
                                style: GoogleFonts.poppins(
                                  fontSize: 8,
                                  color: blueSky,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Update at',
                                style: GoogleFonts.poppins(
                                  fontSize: 8,
                                  color: hintText,
                                ),
                              ),
                              Text(
                                ' 12 January',
                                style: GoogleFonts.poppins(
                                  fontSize: 8,
                                  color: blueSky,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin:const EdgeInsets.only(bottom: 20),
            width: widthScreen,
            height: widthScreen * 0.3,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Row(
              children: [
                Container(
                  width: widthScreen * 0.3,
                  height: widthScreen * 0.3,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                          image: AssetImage('images/berita.png'),
                          fit: BoxFit.cover)),
                ),
                Container(
                  width: widthScreen * 0.5,
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Lorem ipsum dolor sit amet consectetur. Non pharetra diam amet mi.',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: textMedium,
                          color: blackText,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Created at',
                                style: GoogleFonts.poppins(
                                  fontSize: 8,
                                  color: hintText,
                                ),
                              ),
                              Text(
                                ' 12 January',
                                style: GoogleFonts.poppins(
                                  fontSize: 8,
                                  color: blueSky,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Update at',
                                style: GoogleFonts.poppins(
                                  fontSize: 8,
                                  color: hintText,
                                ),
                              ),
                              Text(
                                ' 12 January',
                                style: GoogleFonts.poppins(
                                  fontSize: 8,
                                  color: blueSky,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
