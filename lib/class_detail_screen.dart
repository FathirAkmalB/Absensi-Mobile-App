import 'dart:convert';

import 'package:absensi_mobile/entities/enum/states/adjustment_page_states.dart';
import 'package:absensi_mobile/entities/enum/status_absen.dart';
import 'package:absensi_mobile/entities/kelas.dart';
import 'package:absensi_mobile/entities/siswa.dart';
import 'package:absensi_mobile/extensions/date_time_extensions.dart';
import 'package:absensi_mobile/methods/api.dart';
import 'package:absensi_mobile/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClassDetailScreen extends StatefulWidget {
  final Kelas kelas;

  const ClassDetailScreen({super.key, required this.kelas});

  @override
  State<ClassDetailScreen> createState() => _ClassDetailScreenState();
}

class _ClassDetailScreenState extends State<ClassDetailScreen> {
  Kelas kelasData = Kelas();

  String username = "";

  List<SiswaAtn> siswasDatas = [];

  Map<String, dynamic> adjustmentData = {};

  TextEditingController startMapel = TextEditingController();
  TextEditingController endMapel = TextEditingController();


  List<String> selectionData = ["Not Change","SAKIT", "IZIN", "ALPHA", "DISPENSASI"];

  ClassDetailPageStates state = ClassDetailPageStates.ViewingState;

  Future<void> getDataSiswasAttn() async {
    var sp = await SharedPreferences.getInstance();

    var token = sp.getString("token");
    username = sp.getString("username")!;

    if (token != null) {
      Response res = await API().getRequest(
          route: "/absen/get/class-history/${kelasData.id}",
          header: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json"
          });

      Map<String, dynamic> jsonData = jsonDecode(res.body);

      for (var data in jsonData['siswas']) {
        var find = (jsonData['attendance'] as List<dynamic>).firstWhere(
            (el) => el['id_user'] == data['nik'],
            orElse: () => null);

        if (find != null) {
          siswasDatas.add(SiswaAtn(
            name: data['nama_siswa'],
            nik: data['nik'],
            dateAbsen: DateTime.parse(find["date_attendance"]),
            statusAbsen: StatusAbsen.Hadir,
            timeIn: find["param_time_in"],
          ));

          continue;
        }

        var findIzin = (jsonData['izin'] as List<dynamic>)
            .where((el) => el['nik'] == data['nik'])
            .toList();

        var findIzinExact =  findIzin.firstWhere((element) {

          DateTime start = DateTime.parse(element['date_start']);
          DateTime end = element['date_end'] !=  null ? DateTime.parse(element['date_end']) : DateTime.now().add(const Duration(days: 1));

          return DateTime.now().isBetween(start, end) ?? false;
        }, orElse: () => null,);

        if (findIzinExact != null) {

          StatusAbsen status = StatusAbsen.Alpha;

          switch(findIzinExact['tipe_izin']){
            case "IZIN":
              status = StatusAbsen.Izin;
            case "ALPHA":
              status = StatusAbsen.Alpha;
            case "DISPENSASI":
              status = StatusAbsen.Dispen;
            case "SAKIT":
              status = StatusAbsen.Sakit;
            default:
              status = StatusAbsen.Alpha;
          }

          siswasDatas.add(SiswaAtn(
              name: data['nama_siswa'],
              nik: data['nik'],
              dateAbsen: DateTime.now(),
              statusAbsen: status,
              timeIn: findIzinExact["jam_start"],
              timeOut: findIzinExact["jam_end"]));

          continue;
        }

        siswasDatas.add(SiswaAtn(
          name: data['nama_siswa'],
          nik: data['nik'],
        ));
      }

    }

    setState(() {});
  }

  Future<void> postAdjustment() async {
    var sp = await SharedPreferences.getInstance();

    var token = sp.getString("token");
    username = sp.getString("username")!;

    if(token != null){

      Map<String, dynamic> datas = {
        "startMapel" : startMapel.text,
        "endMapel": endMapel.text,
        "datas": adjustmentData,
      };

      Response res = await API().postRequest(
          route: "/absen/post/adjustment",
          header: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        data: datas,
      );

      Map<String, dynamic> jsonData = jsonDecode(res.body);

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    kelasData = widget.kelas;

    startMapel.text = "00:00";
    endMapel.text = "00:00";

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      await getDataSiswasAttn();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    startMapel.dispose();
    endMapel.dispose();
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_back_rounded,
                    size: font16,
                  ),
                  Text(
                    "Daftar Siswa",
                    style: TextStyle(
                      fontSize: font16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
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
                  child: state == ClassDetailPageStates.ViewingState ? infoKelasWidget(
                    screenW: screenW,
                    screenH: screenH,
                    username: username,
                  ) : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Jam Mapel Mulai", style: GoogleFonts.mulish(
                            fontSize: font16
                          ),),
                          SizedBox.fromSize(
                            size: const Size(0, 10),
                          ),
                          SizedBox(
                            height: 50,
                            width: screenW / 2.4 ,
                            child: TextField(
                              onTap: () async {
                                var data = await showTimePicker(context: context, initialTime: TimeOfDay.now());

                                if(data == null){
                                  return;
                                }

                                startMapel.text = "${twoDigit(digit: data.hour)}:${twoDigit(digit: data.minute)}:00";

                                setState(() {});
                              },
                              maxLines: 1,
                              controller: startMapel,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mulish(),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)
                                )
                              ),
                              readOnly: true,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Jam Mapel Selesai", style: GoogleFonts.mulish(
                              fontSize: font16
                          ),),
                          SizedBox.fromSize(
                            size: const Size(0, 10),
                          ),
                          SizedBox(
                            height: 50,
                            width: screenW / 2.4 ,
                            child: TextField(
                              onTap: () async {
                                var data = await showTimePicker(context: context, initialTime: TimeOfDay.now());

                                if(data == null){
                                  return;
                                }

                                endMapel.text = "${twoDigit(digit: data.hour)}:${twoDigit(digit: data.minute)}:00";

                                setState(() {});
                              },
                              maxLines: 1,
                              controller: endMapel,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mulish(),
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black)
                                  )
                              ),
                              readOnly: true,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              ),

              const Divider(
                color: Colors.grey,
                thickness: 2,
              ),

              const SizedBox(
                height: 10,
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: siswasDatas.length,
                  itemBuilder: (context, index) {

                    var data = siswasDatas[index];

                    if(state == ClassDetailPageStates.ViewingState){
                      return Container(
                        padding: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 8),
                        margin: const EdgeInsets.symmetric(
                            vertical: 10
                        ),
                        height: 110,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.fromBorderSide(
                            BorderSide(color: Colors.grey, width: 1),
                          ),
                        ),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nama Siswa",
                                  style: GoogleFonts.mulish(
                                      color: Colors.black
                                  ),
                                ),
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    "${data.name}",
                                    style: GoogleFonts.mulish(
                                      color: Colors.black,
                                      fontSize: font16,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                                const Spacer(
                                  flex: 1,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Tap In: ${data.timeIn ?? "-"} ",
                                      style: GoogleFonts.mulish(
                                          color: Colors.black
                                      ),
                                    ),
                                    Text(
                                      "Tap Out: ${data.timeIn ?? "-"} ",
                                      style: GoogleFonts.mulish(
                                          color: Colors.black
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                            const Spacer(flex: 1),
                            statusIzinWidget(screenW: screenW, screenH: screenH, statusAbsen: data.statusAbsen),
                            const Spacer(flex: 1),
                          ],
                        ),
                      );
                    }

                    if(state == ClassDetailPageStates.EditingState || state == ClassDetailPageStates.ConfirmationState){
                      return Container(
                        padding: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 8),
                        margin: const EdgeInsets.symmetric(
                            vertical: 10
                        ),
                        height: 110,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.fromBorderSide(
                            BorderSide(color: Colors.grey, width: 1),
                          ),
                        ),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nama Siswa",
                                  style: GoogleFonts.mulish(
                                      color: Colors.black
                                  ),
                                ),
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    "${data.name}",
                                    style: GoogleFonts.mulish(
                                      color: Colors.black,
                                      fontSize: font16,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                                const Spacer(
                                  flex: 1,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Tap In: ${data.timeIn ?? "-"} ",
                                      style: GoogleFonts.mulish(
                                          color: Colors.black
                                      ),
                                    ),
                                    Text(
                                      "Tap Out: ${data.timeIn ?? "-"} ",
                                      style: GoogleFonts.mulish(
                                          color: Colors.black
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                            const Spacer(flex: 1),
                            DropdownButton<String>(
                                hint: Text("Select"),
                                value: adjustmentData[data.nik!] ?? "Not Change" ,
                                items: selectionData.map((e) => DropdownMenuItem(value: e,child: Text(e))).toList(),
                                onChanged: (val) {

                                  if(val == "Not Change"){
                                    adjustmentData.remove(data.nik!);
                                  }

                                  if(data.name != null){
                                    adjustmentData[data.nik!] = val;
                                  }

                                  print(adjustmentData);

                                  setState(() {});
                                },
                            ),
                            const Spacer(flex: 1),
                          ],
                        ),
                      );
                    }

                    return Container();

                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if(state == ClassDetailPageStates.ViewingState){
            state = ClassDetailPageStates.EditingState;
            setState(() {});
            return;
          }

          if(state == ClassDetailPageStates.EditingState){
            state = ClassDetailPageStates.ConfirmationState;
            const snackBar = SnackBar(content: Text("Please Tap the button again to Save it!"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            setState(() {});
            return;
          }

          if(state == ClassDetailPageStates.ConfirmationState){
            showLoading(context);

            await postAdjustment();

            removeLoading(context);

            state == ClassDetailPageStates.ViewingState;

            showSuccess(context);

            setState(() {});
          }
        },
        child: Icon(
          state == ClassDetailPageStates.ViewingState ? Icons.edit : state == ClassDetailPageStates.EditingState ? Icons.check_rounded : state == ClassDetailPageStates.ConfirmationState ? Icons.save : Icons.edit,
        ),
      ),
    );
  }
}

Widget statusIzinWidget({required screenW, required screenH, required StatusAbsen statusAbsen}){

  Color bgColor = Colors.blue;
  Color textColor = Colors.white;
  String text = "Hadir";

  switch(statusAbsen){
    case StatusAbsen.Hadir:
      bgColor = Colors.blue;
      textColor = Colors.white;
      text = "Hadir";
    case StatusAbsen.Sakit:
      bgColor = Colors.green;
      textColor = Colors.white;
      text = "Sakit";
    case StatusAbsen.Alpha:
      bgColor = Colors.red[800]!;
      textColor = Colors.white;
      text = "Alpha";
    case StatusAbsen.Dispen:
      bgColor = Colors.purple;
      textColor = Colors.white;
      text = "Dispen";
    case StatusAbsen.Izin:
      bgColor = Colors.deepOrange;
      textColor = Colors.white;
      text = "Izin";
    case StatusAbsen.AlreadyOut:
      bgColor = Colors.blue;
      textColor = Colors.white;
      text = "Hadir";
  }

  double font16 = screenW * 0.046;

  return Container(
    padding: const EdgeInsetsDirectional.symmetric(
      horizontal: 16,
      vertical: 4
    ),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadiusDirectional.circular(20)
    ),
    child: Text(
      text,
      style: GoogleFonts.mulish(
        color: textColor,
        fontSize: font16,
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}

Widget infoKelasWidget({required screenW, required screenH, required username}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: screenW * 0.04),
    padding: EdgeInsets.all(12),
    width: screenW,
    height: screenH * 0.1,
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        image: DecorationImage(
            image: AssetImage("images/teacherIcon.png"), fit: BoxFit.cover)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          DateFormat("EEEE, d MMMM yyyy", "id_ID").format(DateTime.now()),
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Text(
          'Selamat mengajar, $username!',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}
