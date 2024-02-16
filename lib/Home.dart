import 'package:absensi_mobile/components/TapIn.dart';
import 'package:flutter/material.dart';
import 'components/TapIn.dart';
import 'components/StarInfo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle the action when the center button is pressed
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Container(
          height: 56.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                },
                color: _selectedIndex == 0 ? Colors.blue : null,
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                },
                color: _selectedIndex == 1 ? Colors.blue : null,
              ),
              SizedBox(width: 40.0), // Empty space for the center button
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                },
                color: _selectedIndex == 2 ? Colors.blue : null,
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                },
                color: _selectedIndex == 3 ? Colors.blue : null,
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Selamat Pagi,',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                Text(
                  'Nama Orang!',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ],
            ),
            const Spacer(), // Add space to separate left and right texts
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Container(
          decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('images/home1.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10)),
          width: double.infinity,
          height: 100,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          padding: const EdgeInsets.all(20),
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
        StarInfo()
      ]),
    );
  }
}
