import 'package:absensi_mobile/data/data.dart';
import 'package:absensi_mobile/login_form.dart';
import 'package:absensi_mobile/mainlayouts/main_layout.dart';
import 'package:absensi_mobile/methods/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  @override
  void initState() {
    super.initState();
    _getUserProfile();
  }

  // General
  String? name;
  String? type;
  String? username;
  String? gender;
  String? placeOfBirth;
  String? dateOfBirth;


  // Student
  String? nis;
  int? nik;
  String? email;
  String? address;

  // Teacher
  String? nip;

  Future<void> _getUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final keys = prefs.getKeys();
    final userNip = prefs.getString('nip');
    final userNis = prefs.getString('nis');
    final userNik = prefs.getInt('nik');
    final completeName = prefs.getString('name');
    final userName = prefs.getString('username');
    final typeUser = prefs.getString('type');
    final userEmail = prefs.getString('email');
    final userGender = prefs.getString('gender');
    final userAddress = prefs.getString('address');
    final userDateOfBirth = prefs.getString('dateOfBirth');
    final userPlaceOfBirth = prefs.getString('placeOfBirth');

    for (String key in keys) {
      dynamic value = prefs.get(key);
      print('Key: $key, Value: $value');
    }

    setState(() {
      nip = userNip;
      nis = userNis;
      nik = userNik;
      username = userName;
      name = completeName;
      type = typeUser;
      email = userEmail;
      dateOfBirth = userDateOfBirth;
      placeOfBirth = userPlaceOfBirth;
      gender = userGender;
      address = userAddress;
    });

  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    double marginWidth = widthScreen * 0.06;
    double margin = widthScreen * 0.082;
    double font12 = widthScreen * 0.03;
    double font14 = widthScreen * 0.038;
    double font22 = widthScreen * 0.055;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                toolbarHeight: heightScreen * 0.1,
                title: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Profile',
                    style: GoogleFonts.mulish(
                        fontWeight: textExtra,
                        fontSize: font22,
                        color: blackText),
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainLayout(
                                  initialIndex: 0,
                                )));
                  },
                  icon: const Icon(Icons.keyboard_arrow_left_rounded),
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_active,
                        color: Colors.transparent,
                      ))
                ],
              ),
              Column(
                children: [
                  Container(
                    width: widthScreen * 0.3,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.15,
                            backgroundImage:
                                AssetImage('images/defaultprofile.png')),
                        // Align(
                        //   alignment: Alignment.bottomRight,
                        //   child: Container(
                        //       alignment: Alignment.bottomRight,
                        //       width: 50,
                        //       height: 50,
                        //       decoration: BoxDecoration(
                        //         border: Border.all(width: 2, color: whiteText),
                        //         borderRadius: BorderRadius.circular(40),
                        //         color: blueSky,
                        //       ),
                        //       child: Center(
                        //         child: IconButton(
                        //             onPressed: () {},
                        //             icon: Icon(
                        //               Icons.photo_camera_rounded,
                        //               size: 30,
                        //               color: whiteText,
                        //             )),
                        //       )),
                        // )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: heightScreen * 0.02,
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: heightScreen * 0.02,
                        ),
                        Text(
                          '$username',
                          style: GoogleFonts.mulish(
                              fontSize: font22,
                              fontWeight: textExtra,
                              color: blackText),
                        ),
                        SizedBox(
                          height: heightScreen * 0.01,
                        ),
                        Text(
                          type == 'siswa' ? 'Student' : 'Teacher',
                          style: GoogleFonts.mulish(
                              fontSize: font14,
                              fontWeight: textMedium,
                              color: Color(0xFFABABAB)),
                        ),
                        SizedBox(
                          height: heightScreen * 0.03,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: marginWidth),
                          height: 1,
                          color: progressBar,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: marginWidth, vertical: margin),
                child: Column(children: [
                  // Nomor Induk
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(nis != null ? 'Nomor Induk Siswa:' : 'Nomor Induk Pegawai',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.lato(
                                    fontWeight: textRegular, fontSize: 14))
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: widthScreen,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: widthScreen * 0.04),
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: borderInput,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.022),
                          ),
                          child: Text(nis != null ? '$nis' : '$nip'),
                        )
                      ],
                    ),
                  ),
                  // Nomor Induk End

                  SizedBox(height: 15),
                  // Nomor Induk
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Nama lengkap:' ,
                                textAlign: TextAlign.left,
                                style: GoogleFonts.lato(
                                    fontWeight: textRegular, fontSize: 14))
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: widthScreen,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: widthScreen * 0.04),
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: borderInput,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.022),
                          ),
                          child: Text('$name'),
                        )
                      ],
                    ),
                  ),
                  // Nomor Induk End

                  SizedBox(height: 15),

                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Jenis Kelamin:',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.lato(
                                    fontWeight: textRegular, fontSize: 14))
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: widthScreen,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: widthScreen * 0.04),
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: borderInput,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.022),
                          ),
                          child: Text( '$gender' == 'L' ? 'Pria' : 'Wanita'),
                        )
                      ],
                    ),
                  ),
                  // Nomor Induk End

                  SizedBox(height: 15),
                  // Nomor Induk
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Tempat-tanggal lahir:',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.lato(
                                    fontWeight: textRegular, fontSize: 14))
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: widthScreen,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: widthScreen * 0.04),
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: borderInput,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.022),
                          ),
                          child: Text('$placeOfBirth, $dateOfBirth'),
                        )
                      ],
                    ),
                  ),
                  // Nomor Induk End

                  SizedBox(height: 15),
                  // Nomor Induk
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Alamat:',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.lato(
                                    fontWeight: textRegular, fontSize: 14))
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: widthScreen,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(
                              horizontal: widthScreen * 0.04),
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: borderInput,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.022),
                          ),
                          child: Text(
                              address == '' ? 'Alamat belum di terisi.': '$address'),
                        )
                      ],
                    ),
                  ),
                  // Nomor Induk End
                ]),
              ),
              SizedBox(
                height: heightScreen * 0.005,
              ),
              ElevatedButton(
                onPressed: () {
                  _logout();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size(widthScreen * 0.9, heightScreen * 0.058),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.all(16),
                  ),
                ),
                child: Text(
                  'Keluar',
                  style: GoogleFonts.mulish(
                      fontSize: font12, fontWeight: textMedium),
                ),
              ),
              SizedBox(
                height: heightScreen * 0.02,
              ),
            ],
          ),
        ),
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
      print(response.request);
      print('cek token: $token');
      // Tampilkan pesan kesalahan jika logout gagal
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout gagal')),
      );
    }
  }
}
