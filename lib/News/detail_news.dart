import 'dart:convert';

import 'package:absensi_mobile/data/data.dart';
import 'package:absensi_mobile/methods/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsScreen extends StatefulWidget {
  
  const NewsScreen({super.key});

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
                    onPressed: () {},
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
                          'SMK Taruna Bhakti punya lift??',
                          style: GoogleFonts.mulish(
                              height: 1,
                              fontWeight: textExtra,
                              fontSize: font22),
                        ),
                        SizedBox(
                          height: widthScreen * 0.04,
                        ),
                        Text(
                          'Author: Dzulkifli Nakir',
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
                              'Pembangunan',
                              style: GoogleFonts.mulish(
                                  fontWeight: textBold,
                                  fontSize: font12,
                                  color: blackText),
                            ),
                            Text(
                              '- 12 Maret 2024',
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
                         'SMK Taruna Bhakti, yang terletak di pusat Kota, kini menjadi pusat perhatian dengan penambahan fasilitas baru yang tak lazim di kalangan sekolah menengah kejuruan: lift. Keputusan untuk memasang lift ini diambil sebagai bagian dari upaya sekolah untuk memperluas aksesibilitas bagi semua siswa, termasuk mereka yang memiliki mobilitas terbatas.\n\nDalam sebuah pernyataan, Kepala Sekolah SMK Taruna Bhakti, Bapak Ahmad Rizal, menyatakan, "Kami berkomitmen untuk menyediakan lingkungan belajar yang inklusif bagi semua siswa kami. Penambahan lift ini merupakan langkah penting dalam memastikan bahwa siswa kami yang mungkin memiliki keterbatasan fisik juga dapat dengan mudah mengakses semua fasilitas sekolah."\n\nLift baru ini tidak hanya memberikan manfaat bagi siswa dengan mobilitas terbatas, tetapi juga memungkinkan akses yang lebih mudah bagi staf pengajar dan petugas sekolah untuk mengangkut peralatan dan barang-barang penting antar lantai.\n\nMenurut Bapak Rizal, pembangunan lift ini merupakan bagian dari rencana pengembangan sekolah jangka panjang yang bertujuan untuk meningkatkan kualitas pendidikan dan kenyamanan bagi seluruh komunitas sekolah.\n\n"Walaupun merupakan investasi besar, manfaat jangka panjang dari pengadaan lift ini jauh lebih besar dari pada biayanya," tambah Bapak Rizal. "Kami yakin bahwa dengan memperluas aksesibilitas ini, kami dapat menciptakan lingkungan belajar yang lebih inklusif dan ramah bagi semua siswa dan staf kami."\n\nPemasangan lift ini juga disambut baik oleh orangtua siswa dan anggota komunitas sekolah lainnya. Mereka menyatakan apresiasi mereka atas langkah progresif yang diambil oleh sekolah dalam memperhatikan kebutuhan semua individu di dalam lingkungan pendidikan.\n\nDiharapkan, dengan adanya fasilitas ini, SMK Taruna Bhakti dapat menjadi contoh bagi sekolah lainnya dalam upaya meningkatkan aksesibilitas dan inklusi bagi semua individu, memastikan bahwa pendidikan berkualitas tinggi dapat diakses oleh semua orang, tanpa terkecuali.',
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
