import 'package:absensi_mobile/components/main_page.dart';
import 'package:absensi_mobile/data/data.dart';
import 'package:absensi_mobile/login_form.dart';
import 'package:absensi_mobile/methods/api.dart';
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

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  Future<void> _getUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username')!;
    });
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
                    'Halo,',
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
              Container(
                width: widthScreen * 0.14,
                height: widthScreen * 0.14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: blueColor, 
                    width: 4,
                  ),
                ),
                child: ClipOval(
                  child: Image.network(
                    'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
                    fit: BoxFit.cover,
                    height: widthScreen * 0.14,
                    width: widthScreen * 0.14,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('images/home1.png'),
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
                  'Senin, 12 Januari 2024',
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
                  'Time In: -',
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
          // ElevatedButton(
          //     onPressed: () {
          //       _logout();
          //     },
          //     child: Text('Logout'))
        ]),
      ),
    );
  }

  Future<void> _logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');
    var response = await http.post(
      Uri.parse('${ApiURL.apiUrl}/api/auth/logout'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      // Hapus token autentikasi dari SharedPreferences
      preferences.remove('token');

      // Kembali ke halaman login
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      );
    } else {
      // Tampilkan pesan kesalahan jika logout gagal
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout gagal')),
      );
    }
  }
}
