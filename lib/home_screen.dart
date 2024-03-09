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
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    double font12 = widthScreen * 0.038;
    double font14 = widthScreen * 0.042;

    return Scaffold(
      appBar: AppBar(
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
                    'Selamat Pagi,',
                    style: GoogleFonts.poppins(
                        fontSize: font12, color: hintText),
                  ),
                  Text(
                    'Yolanda Cheszka',
                    style: GoogleFonts.poppins(
                      fontSize: font14,
                      color: blueColor,
                      fontWeight: textMedium
                    ),
                  ),
                ],
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.blue, // Adjust the border color as needed
                    width: 2.0, // Adjust the border width as needed
                  ),
                ),
                child: ClipOval(
                  child: Image.network(
                    'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('images/home1.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10)),
          width: widthScreen,
          height: widthScreen * 0.3,
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: widthScreen * 0.06),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Senin, 12 Januari 2024',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'kamu Belum TAP IN Hari Ini',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 5),
              Text(
                'Time In: -',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        TapIn(),
        StarInfo(),
        ElevatedButton(onPressed: (){
          _logout();
        }, child:Text('Logout'))
      ]),
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
