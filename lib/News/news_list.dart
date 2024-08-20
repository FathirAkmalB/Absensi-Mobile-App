import 'package:absensi_mobile/News/detail_news.dart';
import 'package:absensi_mobile/data/data.dart';
import 'package:absensi_mobile/entities/portal.dart';
import 'package:absensi_mobile/mainlayouts/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NewsLetter extends StatefulWidget {
  const NewsLetter({super.key});

  @override
  State<NewsLetter> createState() => _NewsLetterState();
}

class _NewsLetterState extends State<NewsLetter> {

  List<Portal> portalsData = [];

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      await getNews();
    });
  }

  Future<void> getNews() async {
    portalsData = await getAllNews();

    setState(() {});
  }

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
          // Container(
          //     margin: EdgeInsets.symmetric(horizontal: widthScreen * 0.04),
          //     child: Icon(
          //       Icons.search_rounded,
          //       color: blackText,
          //       size: 26,
          //     )),
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
                    'Berita Terbaru',
                    style: GoogleFonts.poppins(
                        color: blackText, fontSize: 18, fontWeight: textMedium),
                  ),
                  Text(
                    DateFormat("MMMM yyyy").format(DateTime.now()),
                    style: GoogleFonts.poppins(
                      color: subTitle,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsScreen(portal: portalsData[0]),
                    ));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                margin: EdgeInsets.symmetric(
                    horizontal: widthScreen * 0.06, vertical: 12),
                width: widthScreen,
                height: widthScreen * 0.4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(portalsData[0].image ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-RcH3_rFP8ZmSEgjhZy5pv4O4bLl-SwZGsA&s"),
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
                      '${portalsData[0].judul}',
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
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: widthScreen * 0.06, vertical: 12),
              width: widthScreen,
              child: Text(
                'Berita lainnya',
                style: GoogleFonts.poppins(
                    color: blackText, fontSize: 16, fontWeight: textMedium),
              ),
            ),

            ...portalsData.map((e) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsScreen(portal: e),
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
                              e.judul ?? "No Title!",
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
                                  '${e.pokja}',
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
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            image: DecorationImage(
                                image: NetworkImage(e.image ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-RcH3_rFP8ZmSEgjhZy5pv4O4bLl-SwZGsA&s"),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
