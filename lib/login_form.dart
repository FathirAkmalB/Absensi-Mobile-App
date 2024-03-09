import 'dart:convert';

import 'package:absensi_mobile/data/data.dart';
import 'package:absensi_mobile/home_screen.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool? rememberMe = false;

  Future<Map<String, dynamic>> loginUser() async {
    final data = {
      'username': username.text,
      'password': password.text,
    };
    print('data: $data');

    final response = await API().postRequest(route: '/auth/login', data: data);
    final jsonData = json.decode(response.body);

    try {
      if (response.statusCode == 200) {
        print('success');
        final userData = jsonData;
        print(userData);
        String token = userData['token'];
        String username = userData['username'];
        String createdUser = userData['created_user'];
        final identity = userData['identity'];
        String type = userData['type'];

        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setString('token', token);
        await preferences.setString('username', username);
        await preferences.setString('created_user', createdUser);
        await preferences.setString('created_user', createdUser);

        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => type == 'siswa'
                ? const MainLayout(
                    initialIndex: 0,
                  )
                : const HomePage()));

        return jsonData;
      } else {
        print(response.body);
        throw Exception('Failed to login');
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
                                        fontSize: 12,
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
                                        loginUser();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: blueColor,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 17),
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
                              color: outlineInput,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('Daftar',
                                style: GoogleFonts.mulish(
                                  fontSize: 12,
                                  color: blueColor,
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
