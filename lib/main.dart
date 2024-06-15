import 'package:absensi_mobile/mainlayouts/main_layout.dart';
import 'package:absensi_mobile/splash_screens.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';  
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
    // Initialize date formatting for the 'id_ID' (Indonesian) locale.
    await initializeDateFormatting('id_ID', null);
    WidgetsFlutterBinding.ensureInitialized();
    await SharedPreferences.getInstance(); // Inisialisasi shared_preferences

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final Token = prefs.getString('token');

    print('Token: $Token');  
    runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('Some error has Occurred');
            } else if (snapshot.hasData) {
              final token = snapshot.data!.getString('token'); 
              if (token != null) { // Validate is user has logged in
                return const MainLayout(initialIndex: 0,);
              } else {
                return const SplashScreen();
              }
          }else{
            return const Text('Some Error');
          }}),
      );
    }
}