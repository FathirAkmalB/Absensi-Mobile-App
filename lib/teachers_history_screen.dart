import 'dart:convert';

import 'package:absensi_mobile/class_detail_screen.dart';
import 'package:absensi_mobile/entities/identity_guru.dart';
import 'package:absensi_mobile/entities/kelas.dart';
import 'package:absensi_mobile/methods/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeachersHistoryScreen extends StatefulWidget {
  const TeachersHistoryScreen({super.key});

  @override
  State<TeachersHistoryScreen> createState() => _TeachersHistoryScreenState();
}

class _TeachersHistoryScreenState extends State<TeachersHistoryScreen> {
  int selected = 0;

  List<Kelas> kelasPPLG = [];
  List<Kelas> kelasTJKT = [];
  List<Kelas> kelasANIMASI = [];
  List<Kelas> kelasBRF = [];
  List<Kelas> kelasTE = [];

  String username = "";

  Future<void> getDataKelas() async {
    var sp = await SharedPreferences.getInstance();

    var identity = sp.getString("identity");
    var token = sp.getString("token");
    username = sp.getString("username")!;

    if (identity != null) {
      IdentityGuru decoded = IdentityGuru.fromJson(jsonDecode(identity));

      if (decoded.kelas == null) {
        return;
      }

      if (decoded.kelas!.isEmpty) {
        return;
      }

      List<int> ids = decoded.kelas!.map((e) => e.id!).toList();

      Response res = await API().postRequest(route: "/absen/get/classes/atn/count", data: {"classes_id": ids.join(", ")}, header: {"Authorization": "Bearer $token", "Content-Type": "application/json"});

      List<dynamic> jsonData = jsonDecode(res.body);

      print(jsonData);

      for (var kelas in decoded.kelas!) {

        if(jsonData.isNotEmpty){
          var find = jsonData.firstWhere((e) {
            return e['nama_kelas'] == kelas.name!;
          }, orElse: () => null);

          if(find != null){
            kelas.countHadir = find['jml_kehadiran'];
          }
        }

        switch (kelas.namaJurusan) {
          case "PPLG":
            kelasPPLG.add(kelas);
            break;
          case "TJKT":
            kelasTJKT.add(kelas);
            break;
          case "ANIMASI":
            kelasANIMASI.add(kelas);
            break;
          case "BRF":
            kelasBRF.add(kelas);
            break;
          case "TE":
            kelasTE.add(kelas);
            break;
        }
      }

      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      await getDataKelas();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    double screenH = MediaQuery.of(context).size.height;
    double font8 = screenW * 0.030;
    double font10 = screenW * 0.034;
    double font12 = screenW * 0.038;
    double font14 = screenW * 0.042;
    double font16 = screenW * 0.046;
    double font18 = screenW * 0.050;
    double font30 = screenW * 0.078;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Riwayat ",
                  style:
                      TextStyle(fontSize: font16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Aktifitas",
                  style: TextStyle(
                      fontSize: font16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ],
            ),
            Container(
              width: screenW,
              height: screenH * 0.1,
              margin: const EdgeInsetsDirectional.only(
                top: 10,
                bottom: 10,
              ),
              child: infoGuruWidget(screenW: screenW, screenH: screenH, username: username)
            ),
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    //ANIMASI START
                    if (kelasANIMASI.isNotEmpty) ...[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: screenW,
                      child: Row(
                        children: [
                          Text(
                            "ANIMASI",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                              fontSize: font12,
                            ),
                          ),
                          SizedBox(
                            width: font14,
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),


                      ...kelasANIMASI.map((e) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClassDetailScreen(kelas: e),));
                          },
                          child: kelasQuickWidget(
                              kelas: e,
                              mainColor: const Color.fromRGBO(142, 207, 60, 1),
                              screenH: screenH,
                              screenW: screenW,
                          ),
                        );
                      })
                    ],
                    //ANIMASI END

                    //BRF START
                    if (kelasBRF.isNotEmpty) ...[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: screenW,
                      child: Row(
                        children: [
                          Text(
                            "BRF",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                              fontSize: font12,
                            ),
                          ),
                          SizedBox(
                            width: font14,
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),


                      ...kelasBRF.map((e) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClassDetailScreen(kelas: e),));
                          },
                          child: kelasQuickWidget(
                            kelas: e,
                            mainColor: const Color.fromRGBO(107, 60, 207, 1),
                            screenH: screenH,
                            screenW: screenW,
                          ),
                        );
                      })
                    ],
                    //BRF END

                    // PPLG START
                    if (kelasPPLG.isNotEmpty) ...[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: screenW,
                      child: Row(
                        children: [
                          Text(
                            "PPLG",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                              fontSize: font12,
                            ),
                          ),
                          SizedBox(
                            width: font14,
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),


                      ...kelasPPLG.map((e) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClassDetailScreen(kelas: e),));
                          },
                          child: kelasQuickWidget(
                            kelas: e,
                            mainColor: const Color.fromRGBO(60, 119, 207, 1),
                            screenH: screenH,
                            screenW: screenW,
                          ),
                        );
                      })
                    ],
                    // PPLG END

                    //TJKT START
                    if (kelasTJKT.isNotEmpty) ...[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: screenW,
                      child: Row(
                        children: [
                          Text(
                            "TJKT",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                              fontSize: font12,
                            ),
                          ),
                          SizedBox(
                            width: font14,
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),


                      ...kelasTJKT.map((e) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClassDetailScreen(kelas: e),));
                          },
                          child: kelasQuickWidget(
                            kelas: e,
                            mainColor: const Color.fromRGBO(207, 60, 175, 1),
                            screenH: screenH,
                            screenW: screenW,
                          ),
                        );
                      })
                    ],

                    //TJKT END

                    //TE START
                    if (kelasTE.isNotEmpty) ...[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: screenW,
                      child: Row(
                        children: [
                          Text(
                            "TEI",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                              fontSize: font12,
                            ),
                          ),
                          SizedBox(
                            width: font14,
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),


                      ...kelasTE.map((e) {

                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClassDetailScreen(kelas: e),));
                          },
                          child: kelasQuickWidget(
                            kelas: e,
                            mainColor: const Color.fromRGBO(225, 229, 0, 1),
                            screenH: screenH,
                            screenW: screenW,
                          ),
                        );
                      })
                    ],
                    //TE END
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

Widget kelasQuickWidget({
  required Kelas kelas,
  required Color mainColor,
  required screenH,
  required screenW,
}) {
  double font8 = screenW * 0.030;
  double font14 = screenW * 0.042;
  double font18 = screenW * 0.050;

  return Container(
    margin: const EdgeInsetsDirectional.symmetric(
      vertical: 12,
    ),
    width: screenW,
    height: screenH * 0.118,
    child: Stack(
      children: [
        Container(
          width: screenW,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          margin: EdgeInsets.only(right: (screenH * 0.08) / 2),
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                kelas.name ?? "Kelas Tidak Diketahui!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: font18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Wali kelas: ${kelas.walasName ?? "Walas Tidak Diketahui!"}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: font8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: ((screenH * 0.08) / 2) / 2,
          right: 0,
          width: screenH * 0.08,
          height: screenH * 0.08,
          child: Container(
            alignment: AlignmentDirectional.center,
            clipBehavior: Clip.none,
            decoration: BoxDecoration(
              color: mainColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.white,
                  blurStyle: BlurStyle.solid,
                  spreadRadius: 4,
                ),
              ],
              borderRadius: BorderRadiusDirectional.circular(100),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(

                  top: -((screenH * 0.08) / 2) / 2 / 1.5,
                  left: -((screenH * 0.08) / 2) / 2,

                  child: Text(
                    "${kelas.countHadir}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: font14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  child: Text(
                    "/",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: font14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -((screenH * 0.08) / 2) / 2 / 1.5,
                  right: -((screenH * 0.08) / 2) / 2,
                  child: Text(
                    "${kelas.countSiswa}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: font14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget infoGuruWidget({required screenW, required screenH, required username}){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: screenW * 0.04),
    padding: EdgeInsets.all(12),
    width: screenW,
    height: screenH * 0.1,
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        image: DecorationImage(
            image: AssetImage("images/teacherIcon.png"), fit: BoxFit.cover
        )
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          DateFormat(
            "EEEE, d MMMM yyyy","id_ID"
        ).format(DateTime.now()),
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),),
        Text('Selamat mengajar, $username!',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),),
      ],
    ),
  );
}