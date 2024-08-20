import 'package:absensi_mobile/data/data.dart';
import 'package:absensi_mobile/entities/portal.dart';
import 'package:absensi_mobile/methods/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsScreen extends StatefulWidget {
  final Portal portal;
  
  const NewsScreen({super.key, required this.portal});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}
class _NewsScreenState extends State<NewsScreen> {

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
                      image: widget.portal.image != null
                          ? NetworkImage(widget.portal.image ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-RcH3_rFP8ZmSEgjhZy5pv4O4bLl-SwZGsA&s")
                          : const AssetImage('images/Starbhak-info.png')
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
                    fontWeight: textBold, fontSize: font22, color: Colors.transparent),
              ),
            ),
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                (Icons.arrow_back_rounded),
              ),
            ),
            actions: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_rounded, color: Colors.transparent,)),
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
                          '${widget.portal.judul}',
                          style: GoogleFonts.mulish(
                              height: 1,
                              fontWeight: textExtra,
                              fontSize: font22),
                        ),
                        SizedBox(
                          height: widthScreen * 0.04,
                        ),
                        Text(
                          'Pokja: ${widget.portal.pokja}',
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
                              '12 Maret 2024',
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
                         '${widget.portal.content}',
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
