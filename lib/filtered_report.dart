import 'dart:convert';

import 'package:absensi_mobile/class_detail_screen.dart';
import 'package:absensi_mobile/entities/enum/status_absen.dart';
import 'package:absensi_mobile/entities/kelas.dart';
import 'package:absensi_mobile/extensions/date_time_extensions.dart';
import 'package:absensi_mobile/methods/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilteredReportScreen extends StatefulWidget {

  final String startDate;
  final String endDate;
  final List<Kelas> kelases;
  final String tipe;

  const FilteredReportScreen({super.key, required this.startDate, required this.endDate, required this.kelases, required this.tipe});

  @override
  State<FilteredReportScreen> createState() => _FilteredReportScreenState();
}

class _FilteredReportScreenState extends State<FilteredReportScreen> {

  List <String> selectionDate = [];

  List<dynamic> datas = [];

  List<dynamic> shown = [];

  String selected = "";


  Future<void> getDataReport() async {
    var sp = await SharedPreferences.getInstance();

    var token = sp.getString("token");

    List<int> ids = widget.kelases.map((e) => e.id!).toList();

    String classes_id = ids.join(", ");

    var data = {
      'classes_id': classes_id,
      'type': widget.tipe == "All Tipe" ? "" : widget.tipe,
      'date_start': widget.startDate,
      'date_end': widget.endDate
    };

    Response response = await API().postRequest(route: "/data/report", data: data);

    if(response.statusCode != 200){
      return;
    }

    datas = jsonDecode(response.body);
    setState(() {});
  }

  void showDatasBySelection () {

    shown = [];

    for (var data in datas){

      if(data['tipe'] != null){
        if(data['date_end'] != null){
          if(DateTime.parse(selected).isBetween(DateTime.parse(data['date_start']), DateTime.parse(data['date_end'])) ?? false){
            shown.add(data);
          }
        }
        if(DateTime.parse(selected).isAtSameMomentAs(DateTime.parse(data['date_start']))){
          shown.add(data);
        }
        continue;
      }

      if(DateTime.parse(selected).isAtSameMomentAs(DateTime.parse(data['date_attendance']))){
        shown.add(data);
        continue;
      }

    }

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      for(int i = 0; i <= DateTime.parse(widget.endDate).difference(DateTime.parse(widget.startDate)).inDays; i++){
        selectionDate.add(DateFormat("yyyy-MM-dd").format(DateTime.parse(widget.startDate).add(Duration(days: i))));
      }

      selected = selectionDate[0];

      await getDataReport();
      showDatasBySelection();
      setState(() {});
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
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Text(
                    "Daftar ",
                    style: TextStyle(
                        fontSize: font16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Absen",
                    style: TextStyle(
                        fontSize: font16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ],
              ),
            ),

            Container(
              width: screenW,
              height: screenH * 0.1,
              margin: const EdgeInsetsDirectional.only(
                top: 10,
                bottom: 10,
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: selectionDate.length,
                itemBuilder: (context, index) {

                  Color? boxColor = Color.fromARGB(255, 235, 235, 235);
                  Color? textColor = Colors.black87;

                  String data = selectionDate[index];

                  if(data == selected){
                    boxColor = Colors.blue;
                    textColor = Colors.white;
                  }

                  return GestureDetector(
                    onTap: (){
                      selected = data;
                      setState(() {});

                      showDatasBySelection();
                    },
                    child: Container(
                      width: screenW * 0.18,
                      margin: const EdgeInsets.only(
                          right: 12
                      ),
                      decoration: BoxDecoration(
                          color: boxColor,
                          borderRadius: BorderRadius.circular(18)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat("dd").format(DateTime.parse(data)),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: font14,
                                color: textColor
                            ),
                          ),
                          Text(
                            DateFormat("MMM").format(DateTime.parse(data)),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: font10,
                                color: textColor
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: shown.length,
                itemBuilder: (context, index) {
                  var data = shown[index];

                  return Container(
                    padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 12, vertical: 8),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: screenW * 0.27,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.fromBorderSide(
                        BorderSide(
                            color: Color.fromARGB(255, 124, 124, 124),
                            width: 1),
                      ),
                    ),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: screenW * 0.6,
                              child: Text(
                                "${data['nama_siswa']}",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.nunito(
                                  color: Colors.black,
                                  fontSize: font14,
                                ),
                                maxLines: 2,
                              ),
                            ),

                            Row(
                              children: [

                                if(data['tipe'] != null) ...[
                                  if(data['date_start'] != null && data['date_end'] != null)  ...[
                                    Text(
                                      "From: ${data['date_start'] ?? "-"}",
                                      style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(255, 116, 116, 116)),
                                    ),

                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "To: ${data['date_end'] ?? "-"}",
                                      style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(255, 116, 116, 116)),
                                    ),
                                  ] else ... [
                                    Text(
                                      "From: ${data['jam_start'] ?? "-"}",
                                      style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(255, 116, 116, 116)),
                                    ),

                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "To: ${data['jam_end'] ?? "-"}",
                                      style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(255, 116, 116, 116)),
                                    ),
                                  ],


                                ] else ... [
                                  Text(
                                    "In: ${data['masuk'] ?? "-"}",
                                    style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(255, 116, 116, 116)),
                                  ),

                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "Out: ${data['keluar'] ?? "-"}",
                                    style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(255, 116, 116, 116)),
                                  ),
                                ],

                              ],
                            ),
                          ],
                        ),
                        const Spacer(flex: 1),
                        statusIzinWidget(
                          screenW: screenW,
                          screenH: screenH,
                          statusAbsen: parseToStatusAbsen(data['tipe'] ?? "Hadir"),
                        ),
                        const Spacer(flex: 1),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

