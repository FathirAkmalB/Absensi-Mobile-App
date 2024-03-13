import 'dart:convert';

import 'package:absensi_mobile/data/data.dart';
import 'package:absensi_mobile/methods/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsScreen extends StatefulWidget {
  final newsData;
  const NewsScreen({super.key, required this.newsData});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}
class _NewsScreenState extends State<NewsScreen> {


static const cover = null;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    double font12 = widthScreen * 0.03;
    double font14 = widthScreen * 0.038;
    double font16 = widthScreen * 0.043;
    double font18 = widthScreen * 0.048;
    double font22 = widthScreen * 0.055;

    return Scaffold(
        body: Stack(
      children: [
        Container(
              width: widthScreen,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: cover != null
                          ? NetworkImage('${ApiURL.apiUrl}/storage/$cover')
                          : const AssetImage('assets/img/tesImage (2).jpg')
                              as ImageProvider,
                      fit: BoxFit.cover)),
            ),
        Column(children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: heightScreen * 0.1,
            title: Container(
              alignment: Alignment.center,
              child: Text(
                'STARBHAK INFO',
                style: GoogleFonts.salsa(
                    fontWeight: textBold, fontSize: font22, color: whiteText),
              ),
            ),
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                (Icons.keyboard_arrow_left_rounded),
              ),
            ),
            actions: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_rounded)),
              )
            ],
          ),
          SizedBox(
            height: heightScreen * 0.05,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: widthScreen * 0.04),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20) ),
                color: whiteText,
              ),
              child: ListView(
                      children: [
                        Text(
                          'title',
                          style: GoogleFonts.mulish(
                              height: 1,
                              fontWeight: textExtra,
                              fontSize: font22),
                        ),
                        SizedBox(
                          height: widthScreen * 0.04,
                        ),
                        Text(
                          'Author: nama author',
                          style: GoogleFonts.mulish(
                              fontWeight: textMedium,
                              fontSize: font12,
                              color: blackText),
                        ),
                        SizedBox(
                          height: widthScreen * 0.02,
                        ),
                        Row(
                          children: [
                            Text(
                              'kategori ',
                              style: GoogleFonts.mulish(
                                  fontWeight: textBold,
                                  fontSize: font12,
                                  color: blackText),
                            ),
                            Text(
                              '- waktu',
                              style: GoogleFonts.mulish(
                                  fontWeight: textMedium,
                                  fontSize: font12,
                                  color: blackText),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: widthScreen * 0.06,
                        ),
                        HtmlWidget(
                          'konten berita',
                          textStyle: GoogleFonts.mulish(
                            height: 1.5,
                          ),
                        ),
                        SizedBox(
                          height: widthScreen * 0.02,
                        ),
                        SizedBox(
                          height: widthScreen * 0.2,
                        ),
                      ],
                    )
            ),
          )
        ]),
      ],
    ));
  }

  // Future<void> _refreshData() async {
  //   await ();
  // }
}
