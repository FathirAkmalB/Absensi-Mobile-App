import 'package:flutter/material.dart';

class TeachersHistoryScreen extends StatefulWidget {
  const TeachersHistoryScreen({super.key});

  @override
  State<TeachersHistoryScreen> createState() => _TeachersHistoryScreenState();
}

class _TeachersHistoryScreenState extends State<TeachersHistoryScreen> {

  int selected = 0;

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
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Riwayat ",
                  style: TextStyle(
                    fontSize: font16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "Aktifitas",
                  style: TextStyle(
                      fontSize: font16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue
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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 12,
                itemBuilder: (context, index) {

                  Color? boxColor = Color.fromARGB(255, 235, 235, 235);
                  Color? textColor = Colors.black87;

                  if(index == selected){
                    boxColor = Colors.blue;
                    textColor = Colors.white;
                  }

                  return GestureDetector(
                    onTap: (){
                      selected = index;
                      setState(() {});
                    },
                    child: Container(
                      width: screenW * 0.18,
                      margin: const EdgeInsets.only(
                        right: 12
                      ),
                      decoration: BoxDecoration(
                        color: boxColor,
                        borderRadius: BorderRadius.circular(18)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "12",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: font14,
                              color: textColor
                            ),
                          ),
                          Text(
                            "MON",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: font10,
                                color: textColor
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: screenW,
                      child: Row(
                        children: [
                          Text(
                            "PPLG",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                              fontSize: font12,
                            ),
                          ),
                          SizedBox(
                            width: font14,
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenW,
                      height: screenH * 0.118,
                      child: Stack(
                        children: [
                          Container(
                            width: screenW,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 12
                            ),
                            margin: EdgeInsets.only(right: (screenH * 0.08) / 2),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(60, 119, 207, 1),
                              borderRadius: BorderRadius.circular(18)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "27 kehadiran",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: font8,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  "XI PPLG 1",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: font18,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                const Spacer(
                                  flex: 8,
                                ),
                                Text(
                                  "Wali kelas: Sinta Awaliyah Saputri",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: font8,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: ((screenH * 0.08) / 2) / 2,
                            right: 0,
                            width:  screenH * 0.08,
                            height: screenH * 0.08,
                            child: Container(
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(60, 119, 207, 1),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.white,
                                    blurStyle: BlurStyle.solid,
                                    spreadRadius: 4,
                                  ),
                                ],
                                borderRadius: BorderRadiusDirectional.circular(100),
                              ),
                              child: Text(
                                "34",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: font30,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: screenW,
                      child: Row(
                        children: [
                          Text(
                            "ANIMASI",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                              fontSize: font12,
                            ),
                          ),
                          SizedBox(
                            width: font14,
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenW,
                      height: screenH * 0.118,
                      child: Stack(
                        children: [
                          Container(
                            width: screenW,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 12
                            ),
                            margin: EdgeInsets.only(right: (screenH * 0.08) / 2),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(142, 207, 60, 1),
                                borderRadius: BorderRadius.circular(18)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "27 kehadiran",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: font8,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  "XI PPLG 1",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: font18,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                const Spacer(
                                  flex: 8,
                                ),
                                Text(
                                  "Wali kelas: Sinta Awaliyah Saputri",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: font8,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: ((screenH * 0.08) / 2) / 2,
                            right: 0,
                            width:  screenH * 0.08,
                            height: screenH * 0.08,
                            child: Container(
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(142, 207, 60, 1),

                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.white,
                                    blurStyle: BlurStyle.solid,
                                    spreadRadius: 4,
                                  ),
                                ],
                                borderRadius: BorderRadiusDirectional.circular(100),
                              ),
                              child: Text(
                                "34",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: font30,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: screenW,
                      child: Row(
                        children: [
                          Text(
                            "BRF",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                              fontSize: font12,
                            ),
                          ),
                          SizedBox(
                            width: font14,
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenW,
                      height: screenH * 0.118,
                      child: Stack(
                        children: [
                          Container(
                            width: screenW,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 12
                            ),
                            margin: EdgeInsets.only(right: (screenH * 0.08) / 2),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(107, 60, 207, 1),
                                borderRadius: BorderRadius.circular(18)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "27 kehadiran",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: font8,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  "XI PPLG 1",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: font18,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                const Spacer(
                                  flex: 8,
                                ),
                                Text(
                                  "Wali kelas: Budi Yanto Setya",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: font8,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: ((screenH * 0.08) / 2) / 2,
                            right: 0,
                            width:  screenH * 0.08,
                            height: screenH * 0.08,
                            child: Container(
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(107, 60, 207, 1),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.white,
                                    blurStyle: BlurStyle.solid,
                                    spreadRadius: 4,
                                  ),
                                ],
                                borderRadius: BorderRadiusDirectional.circular(100),
                              ),
                              child: Text(
                                "34",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: font30,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: screenW,
                      child: Row(
                        children: [
                          Text(
                            "TJKT",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                              fontSize: font12,
                            ),
                          ),
                          SizedBox(
                            width: font14,
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenW,
                      height: screenH * 0.118,
                      child: Stack(
                        children: [
                          Container(
                            width: screenW,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 12
                            ),
                            margin: EdgeInsets.only(right: (screenH * 0.08) / 2),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(207, 60, 175, 1),
                                borderRadius: BorderRadius.circular(18)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "27 kehadiran",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: font8,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  "XI PPLG 1",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: font18,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                const Spacer(
                                  flex: 8,
                                ),
                                Text(
                                  "Wali kelas: Sandra Revalina",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: font8,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: ((screenH * 0.08) / 2) / 2,
                            right: 0,
                            width:  screenH * 0.08,
                            height: screenH * 0.08,
                            child: Container(
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(207, 60, 175, 1),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.white,
                                    blurStyle: BlurStyle.solid,
                                    spreadRadius: 4,
                                  ),
                                ],
                                borderRadius: BorderRadiusDirectional.circular(100),
                              ),
                              child: Text(
                                "34",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: font30,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: screenW,
                      child: Row(
                        children: [
                          Text(
                            "TEI",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                              fontSize: font12,
                            ),
                          ),
                          SizedBox(
                            width: font14,
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenW,
                      height: screenH * 0.118,
                      child: Stack(
                        children: [
                          Container(
                            width: screenW,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 12
                            ),
                            margin: EdgeInsets.only(right: (screenH * 0.08) / 2),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(225, 229, 0, 1),
                                borderRadius: BorderRadius.circular(18)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "27 kehadiran",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: font8,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  "XI PPLG 1",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: font18,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                const Spacer(
                                  flex: 8,
                                ),
                                Text(
                                  "Wali kelas: Ardiansyah Dony",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: font8,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: ((screenH * 0.08) / 2) / 2,
                            right: 0,
                            width:  screenH * 0.08,
                            height: screenH * 0.08,
                            child: Container(
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(225, 229, 0, 1),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.white,
                                    blurStyle: BlurStyle.solid,
                                    spreadRadius: 4,
                                  ),
                                ],
                                borderRadius: BorderRadiusDirectional.circular(100),
                              ),
                              child: Text(
                                "34",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: font30,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
