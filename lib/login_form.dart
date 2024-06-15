import 'dart:convert';

import 'package:absensi_mobile/data/data.dart';
import 'package:absensi_mobile/mainlayouts/main_layout.dart';
import 'package:absensi_mobile/methods/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool? rememberMe = false;

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const CircularProgressIndicator(
              color: Color(0xff39BFB7),
            ),
          ),
        );
      },
    );
  }

  void loginUser(BuildContext context) async {
    showLoadingDialog(context);

    final data = {
      'username': username.text,
      'password': password.text,
    };

    final response = await API().postRequest(route: '/auth/login', data: data);
    final jsonData = json.decode(response.body);

    try {
      if (response.statusCode == 401) {
        Navigator.of(context).pop();

        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Login Failed!'),
              content: Text('Check Your Email & Password'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
      if (response.statusCode == 200) {
        Navigator.of(context).pop();
        final userData = jsonData;
        final identity = userData['identity'];

        SharedPreferences preferences = await SharedPreferences.getInstance();

        // General key(student & teacher)
        final id = userData['id'];
        final type = userData['type']==null?"":userData['type'];
        final username = userData['username'];
        print(username);
        final token = userData['token'];

        if (type == 'siswa') {
          final nik = identity['nik'];
          final nis = identity['nis'];
          final email = identity['email'];
          final name = identity['nama_siswa'];
          final gender = identity['jk'];
          final placeOfBirth = identity['tempat_lahir'];
          final dateOfBirth = identity['tgl_lahir'];
          final address = identity['address'] ?? '';

          //save key
          await preferences.setInt('id', id);
          await preferences.setString('username', username);
          await preferences.setString('type', type);
          await preferences.setString('token', token);

          await preferences.setInt('nik', nik);
          await preferences.setString('nis', nis);
          await preferences.setString('email', email);
          await preferences.setString('name', name);
          await preferences.setString('gender', gender);
          await preferences.setString('dateOfBirth', dateOfBirth);
          await preferences.setString('placeOfBirth', placeOfBirth);
          await preferences.setString('address', address) ?? '';
        } else {
          // Teacher key
          final nip = identity['nip'];
          final name = identity['name'];
          final gender = identity['jk'];
          final dateOfBirth = identity['tgl_lahir'];
          final placeOfBirth = identity['tempat_lahir'];
          final address = identity['address'] ?? '';

          await preferences.setInt('id', id);
          await preferences.setString('username', username);
          await preferences.setString('type', type);
          await preferences.setString('token', token);

          //Save Teacher Key
          var _nip = nip==null?"":nip;
          await preferences.setString('nip', _nip);
          await preferences.setString('name', name);
          await preferences.setString('gender', gender);
          await preferences.setString('dateOfBirth', dateOfBirth);
          await preferences.setString('placeOfBirth', placeOfBirth);
          await preferences.setString('address', address) ?? '';
        }

        await preferences.setString("identity", jsonEncode(identity));

        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const MainLayout(initialIndex: 0)));

        return jsonData;
      } else if (response.statusCode == 404) {
        Navigator.of(context).pop();

        //validasi admin
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Akun tidak terdaftar'),
              content: Text('Silahkan Registrasi dulu'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        Navigator.of(context).pop();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Mohon Periksa Koneksi Anda.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  bool _isSecurePassword = true;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: blueColor,
      body: SingleChildScrollView(
        child: Container(
          width: widthScreen,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/Login form.png'),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: heightScreen * 0.08),
                width: widthScreen * 0.45,
                height: widthScreen * 0.45,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/Splash.png'),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 60,
              ),
              Expanded(
                child: Container(
                  width: widthScreen,
                  padding: EdgeInsets.symmetric(vertical: 40),
                  decoration: BoxDecoration(
                      color: whiteText,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(65))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          'Sign in',
                          style: GoogleFonts.salsa(
                              fontSize: 26,
                              color: blueColor,
                              fontWeight: textMedium),
                        ),
                      ),
                      Container(
                        width: widthScreen * 0.8,
                        height: widthScreen * 0.8,
                        child: Form(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  TextFormField(
                                    style: GoogleFonts.mulish(
                                      color: blackText,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    controller: username,
                                    decoration: InputDecoration(
                                      hintText: 'Enter your username',
                                      hintStyle: GoogleFonts.mulish(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: outlineInput),
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      prefixIcon: Align(
                                        widthFactor: 3,
                                        heightFactor: 1.0,
                                        child: Icon(
                                          Icons.person,
                                          color: blueColor,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: outlineInput)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: blueColor)),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  TextFormField(
                                    controller: password,
                                    obscureText: _isSecurePassword,
                                    style: GoogleFonts.mulish(
                                        color: blackText,
                                        fontSize: 14,
                                        fontWeight: textMedium),
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: outlineInput)),
                                      hintText: 'Enter your password',
                                      hintStyle: GoogleFonts.mulish(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.028,
                                          fontWeight: FontWeight.w400,
                                          color: outlineInput),
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      suffixIcon: togglePassword(),
                                      prefixIcon: Align(
                                        widthFactor: 3,
                                        heightFactor: 1.0,
                                        child: Icon(
                                          Icons.lock_outline_rounded,
                                          color: blueColor,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: outlineInput)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide:
                                              BorderSide(color: blueColor)),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                  width: widthScreen,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: blueColor,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        loginUser(context);
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                blueColor),
                                        padding: MaterialStateProperty.all<
                                            EdgeInsetsGeometry>(
                                          const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 17),
                                        ),
                                      ),
                                      child: Container(
                                        child: const Text(
                                          'Masuk Sekarang',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Belum punya akun?',
                            style: GoogleFonts.mulish(
                              fontSize: 12,
                              color: Colors.transparent,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('Daftar',
                                style: GoogleFonts.mulish(
                                  fontSize: 12,
                                  color: Colors.transparent,
                                )),
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
        onPressed: () {
          setState(() {
            _isSecurePassword = !_isSecurePassword;
          });
        },
        icon: _isSecurePassword
            ? Icon(Icons.visibility)
            : Icon(Icons.visibility_off),
        color: outlineInput);
  }
}
