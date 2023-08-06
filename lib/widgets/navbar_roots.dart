import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/mindscreen/chat_screen.dart';
import 'package:healthcare/screens/home_screen.dart';
import 'package:healthcare/screens/new.dart';
import 'package:healthcare/screens/schedule_screen.dart';
import 'package:healthcare/screens/settings_screen.dart';

class NavBarRoots extends StatefulWidget {
  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
  int _selectedIndex = 0;
  final _screens = [
    HealthStatsScreen(),
    ChatScreen(),
    AudioPlayerApp(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF7165D6),
          unselectedItemColor: Colors.black26,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.chat_bubble_text_fill,
                ),
                label: "Chat"),
            BottomNavigationBarItem(
                icon: Icon(Icons.music_note), label: "Play"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
      ),
    );
  }
}
