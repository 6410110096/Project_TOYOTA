import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:evcar/Screens/home_page.dart';
import 'package:evcar/Screens/more_page.dart';
import 'package:evcar/Screens/profile_page.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int selectedIndex = 0;
  final screen = [HomeScreen(), ProfileScreen(), MoreScreen(), MoreScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(255, 11, 12, 12),
        color: Color.fromRGBO(179, 19, 19, 1),
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
            selectedIndex = index;
          });
        },
        animationCurve: Curves.easeInBack,
        animationDuration: const Duration(milliseconds: 300),
      ),
      body: screen[selectedIndex],
    );
  }
}
