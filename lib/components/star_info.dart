import 'package:absensi_mobile/News/detail_news.dart';
import 'package:absensi_mobile/data/data.dart';
import 'package:absensi_mobile/entities/portal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StarInfo extends StatefulWidget {
  const StarInfo({super.key});

  @override
  State<StarInfo> createState() => _StarInfoState();
}

class _StarInfoState extends State<StarInfo> {

  List<Portal> portalsData = [];

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      await getNews();
    });
  }

  Future<void> getNews() async {
    portalsData = await getLatestNews();

    setState(() {});
  }

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
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        image: DecorationImage(
                          image: NetworkImage(e.image ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-RcH3_rFP8ZmSEgjhZy5pv4O4bLl-SwZGsA&s"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: widthScreen * 0.5,
                      margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            e.judul ?? "No Title!",
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
                                    'Pokja',
                                    style: GoogleFonts.poppins(
                                      fontSize: 8,
                                      color: hintText,
                                    ),
                                  ),
                                  Text(
                                    ' ${e.pokja} ',
                                    style: GoogleFonts.poppins(
                                      fontSize: 8,
                                      color: blueSky,
                                    ),
                                  ),
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
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
