import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

// Warna Uninus Pallete
Color outlineInput = const Color(0xFFA0AEC0);
Color hintText = const Color(0xFF565656);
Color placeHolder = const Color(0xFF7A7A7A);

Color blueColor = const Color(0xFF1A6CB6);
Color blueSky = const Color(0xFF65A4DD);
Color yellowSolid = const Color(0xFFFFE500);
Color blackText = const Color(0xFF323F4B);
Color graySolid = const Color(0xFFEDF2F7);

Color subTitle = const Color(0xFF718096);
Color examResult = const Color(0xFF9B9B9F);
Color darkBlue = const Color(0xFF1A202C);
Color progressBar = const Color(0xFFE2E8F0);

FontWeight textRegular = FontWeight.w400;
FontWeight textBold = FontWeight.w700;
FontWeight textBlack = FontWeight.w900;
FontWeight textMedium = FontWeight.w500;
FontWeight textExtra = FontWeight.w800;
Color borderInput = Color(0xFFE2E2E2);
Color whiteText = Colors.white;
Color whiteBg = Color.fromARGB(255, 243, 243, 243);

const Gradient blueGradient = LinearGradient(
  colors: [
    Color.fromRGBO(55, 197, 242, 1),
    Color.fromRGBO(0, 154, 203, 1)
  ], // Warna gradient
  begin: Alignment.topCenter, // Awal gradient
  end: Alignment.bottomCenter, // Akhir gradient
);

const Gradient orangeGradient = LinearGradient(
  colors: [
    Color.fromRGBO(246, 116, 87, 1),
    Color.fromRGBO(237, 81, 46, 1)
  ], // Warna gradient
  begin: Alignment.topCenter, // Awal gradient
  end: Alignment.bottomCenter, // Akhir gradient
);

List<IconData> listOfIcons = [
  LucideIcons.home,
  LucideIcons.mailbox,
  LucideIcons.wallet,
  LucideIcons.history,
  LucideIcons.user,
];
