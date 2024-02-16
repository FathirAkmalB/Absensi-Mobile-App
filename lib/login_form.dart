import 'dart:convert';

import 'package:absensi_mobile/home_screen.dart';
import 'package:absensi_mobile/mainlayouts/main_layout.dart';
import 'package:absensi_mobile/methods/api.dart';
import 'package:flutter/material.dart';
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
            builder: (context) => type == 'siswa' ? const MainLayout(initialIndex: 0,) : Home()));

        return jsonData;
      } else {
        print(response.body);
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 35),
              child: Image.asset('images/Splash.png'),
            ),
            Expanded(
              child: Form(
                key: _formKey,
                child: Container(
                    padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(45))),
                    child: Column(children: [
                      Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(bottom: 30),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey, width: 1))),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Sign',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text(' In',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue)),
                              ])),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: username,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16.0),
                            hintText: 'Enter your username',
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: password,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16.0),
                            hintText: 'Enter your password',
                            border: InputBorder.none,
                          ),
                          obscureText: true,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(vertical: 30.0),
                        child: ElevatedButton(
                          onPressed: () {
                            loginUser();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15)),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              'Sign In',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
