import 'package:absensi_mobile/News/detail_news.dart';
import 'package:absensi_mobile/data/data.dart';
import 'package:absensi_mobile/mainlayouts/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsLetter extends StatefulWidget {
  const NewsLetter({super.key});

  @override
  State<NewsLetter> createState() => _NewsLetterState();
}

class _NewsLetterState extends State<NewsLetter> {
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: heightScreen * 0.1,
        title: Container(
            margin: EdgeInsets.symmetric(horizontal: widthScreen * 0.02),
            child: Row(
              children: [
                Text(
                  'STARBHAK',
                  style: GoogleFonts.salsa(color: blackText, fontSize: 20),
                ),
                Text(
                  'INFO',
                  style: GoogleFonts.salsa(color: Colors.blue, fontSize: 20),
                ),
              ],
            )),
        actions: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: widthScreen * 0.04),
              child: Icon(
                Icons.search_rounded,
                color: blackText,
                size: 26,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: widthScreen * 0.06),
              width: widthScreen,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Berita Utama',
                    style: GoogleFonts.poppins(
                        color: blackText, fontSize: 18, fontWeight: textMedium),
                  ),
                  Text(
                    'November 2024',
                    style: GoogleFonts.poppins(
                      color: subTitle,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              margin: EdgeInsets.symmetric(
                  horizontal: widthScreen * 0.06, vertical: 12),
              width: widthScreen,
              height: widthScreen * 0.4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/hero_news.png'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '18 November 2023',
                    style: GoogleFonts.poppins(
                        fontWeight: textMedium, fontSize: 14, color: whiteText),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'SMK Taruna Bhakti SIAP PPDB 2024',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.inter(
                      color: whiteText,
                      fontWeight: textBold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: widthScreen * 0.06, vertical: 12),
              width: widthScreen,
              child: Text(
                'Kategori',
                style: GoogleFonts.poppins(
                    color: blackText, fontSize: 16, fontWeight: textMedium),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsScreen(),
                    ));
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: widthScreen * 0.06, vertical: 12),
                width: widthScreen,
                height: widthScreen * 0.35,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: widthScreen * 0.55,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ini 300 murid yang berhasil terdaftar sebagai eligible!',
                            maxLines: 3,
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              color: blackText,
                              fontWeight: textMedium,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Prestasi',
                                style: GoogleFonts.lato(
                                    fontSize: 12,
                                    color: blueSky,
                                    fontWeight: textBold),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Text(
                                  '18 Jan 2024',
                                  style: GoogleFonts.lato(
                                      fontSize: 12,
                                      color: outlineInput,
                                      fontWeight: textMedium),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: widthScreen * 0.32,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          image: DecorationImage(
                              image: AssetImage('images/berita.png'),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsScreen(),
                    ));
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: widthScreen * 0.06, vertical: 12),
                width: widthScreen,
                height: widthScreen * 0.35,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: widthScreen * 0.55,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SMK Taruna Bhakti festival air dalam rangka kenang-kenagan untuk kelas XII 2021-2024',
                            maxLines: 3,
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              color: blackText,
                              fontWeight: textMedium,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Kenangan',
                                style: GoogleFonts.lato(
                                    fontSize: 12,
                                    color: yellowSolid,
                                    fontWeight: textBold),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Text(
                                  '9 Maret 2024',
                                  style: GoogleFonts.lato(
                                      fontSize: 12,
                                      color: outlineInput,
                                      fontWeight: textMedium),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: widthScreen * 0.32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 158, 158, 158)
                                  .withOpacity(0.2), // Warna bayangan
                              spreadRadius: 3, // Lebar penyebaran bayangan
                              blurRadius: 5, // Tingkat kabur bayangan
                              offset: Offset(2, 2), // Offset bayangan (x, y)
                            ),
                          ],
                          image: DecorationImage(
                              image: AssetImage('images/news-2.jpg'),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
