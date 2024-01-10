import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:evcar/Screens/home_page.dart';
import 'package:evcar/Screens/more_page.dart';
import 'package:evcar/Screens/moreone_page.dart';
import 'package:evcar/Screens/Profile/profile_page.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int selectedIndex = 0;
  final screen = [
    Homescreen(),
    Moresonescreen(),
    Morescreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromRGBO(5, 4, 4, 1),
        color: Color.fromRGBO(156, 13, 13, 1),
        index: selectedIndex,
        items: [
          Icon(
            Icons.home,
            size: 40,
            color: Colors.black,
          ),
          Icon(
            Icons.search_rounded,
            size: 40,
            color: Colors.black,
          ),
          Icon(
            Icons.search_rounded,
            size: 40,
            color: Colors.black,
          ),
          Icon(
            Icons.person,
            size: 40,
            color: Colors.black,
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index.clamp(0, screen.length - 1);
          });
        },
        animationCurve: Curves.easeInBack,
        animationDuration: const Duration(milliseconds: 500),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(22, 1, 1, 1),
              Color.fromRGBO(5, 4, 4, 1),
            ],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
          ),
        ),
        child: screen[selectedIndex],
      ),
    );
  }
}
