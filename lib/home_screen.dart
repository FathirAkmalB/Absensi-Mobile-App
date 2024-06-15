import 'package:absensi_mobile/components/main_page.dart';
import 'package:absensi_mobile/data/data.dart';
import 'package:absensi_mobile/login_form.dart';
import 'package:absensi_mobile/mainlayouts/main_layout.dart';
import 'package:absensi_mobile/methods/api.dart';
import 'package:absensi_mobile/profile_user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/star_info.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = '';
  String userType = '';
  String userNip = '';

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  Future<void> _getUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username')!;
      userType = prefs.getString('type')!;
      userNip = prefs.getString('nip')!;
    });

    String test = "";
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    double font12 = widthScreen * 0.038;
    double font14 = widthScreen * 0.042;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[200],
        elevation: 0,
        toolbarHeight: heightScreen * 0.1,
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: widthScreen * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Selamat datang,',
                    style:
                        GoogleFonts.poppins(fontSize: font12, color: hintText),
                  ),
                  Text(
                    username,
                    style: GoogleFonts.poppins(
                        fontSize: font14,
                        color: blueColor,
                        fontWeight: textMedium),
                  ),
                ],
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => const MainLayout(initialIndex: 4,),));
                },
                child: Container(
                  width: widthScreen * 0.14,
                  height: widthScreen * 0.14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: blueColor, 
                      width: 4,
                    ),
                  ),
                  child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.15,
                              backgroundImage: AssetImage('images/defaultprofile.png')),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          userType == 'guru' ?
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('images/home2.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10)),
            width: widthScreen,
            height: widthScreen * 0.3,
            margin: EdgeInsets.symmetric(
                vertical: 20, horizontal: widthScreen * 0.06),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sabtu, 16 Maret 2024',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: whiteText
                  ),
                ),
                Text(
                  'Selamat beraktifitas, $username!',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: whiteText
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  userNip,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: whiteText
                  ),
                ),
              ],
            ),
          )
          : Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('images/home2.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10)),
            width: widthScreen,
            height: widthScreen * 0.3,
            margin: EdgeInsets.symmetric(
                vertical: 20, horizontal: widthScreen * 0.06),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sabtu, 16 Maret 2024',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: whiteText
                  ),
                ),
                Text(
                  'kamu Belum TAP IN Hari Ini',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: whiteText
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'userNis',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: whiteText
                  ),
                ),
              ],
            ),
          ),
          
          TapIn(),
          StarInfo(),
        ]),
      ),
    );
  }

}
