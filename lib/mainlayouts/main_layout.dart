import 'package:absensi_mobile/detail_presence.dart';
import 'package:absensi_mobile/home_screen.dart';
import 'package:absensi_mobile/components/star_info.dart';
import 'package:absensi_mobile/components/main_page.dart';
import 'package:absensi_mobile/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons/lucide_icons.dart';

class MainLayout extends StatefulWidget {
  final int initialIndex;
  const MainLayout({super.key, required this.initialIndex});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> with WidgetsBindingObserver {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;

    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  final List<String> _titles = [
    'Beranda',
    'Starinfo',
    'Presensi',
    'Detail Presensi',
    'Profile',
  ];

  final List<Widget> _screens = [
    const HomePage(),
    const StarInfo(),
    const TapIn(),
    const TapIn(),
    const DetailPresence(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onItemSelected(2);
        },
        child: Icon(Icons.add),
        backgroundColor: _selectedIndex == 2 ? Colors.blue : yellowSolid, // Change the color as needed
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Container(
          height: 56.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(LucideIcons.layoutDashboard),
                onPressed: () {
                  _onItemSelected(0);
                },
                color: _selectedIndex == 0 ? Colors.blue : outlineInput,
              ),
              IconButton(
                icon: Icon(LucideIcons.mailbox),
                onPressed: () {
                  _onItemSelected(1);
                },
                color: _selectedIndex == 1 ? Colors.blue : outlineInput,
              ),
              SizedBox(width: 40.0), // Empty space for the center button
              IconButton(
                icon: const Icon(LucideIcons.history),
                onPressed: () {
                  _onItemSelected(3);
                },
                color: _selectedIndex == 3 ? Colors.blue : outlineInput,
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  _onItemSelected(4);
                },
                color: _selectedIndex == 4 ? Colors.blue : outlineInput,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
