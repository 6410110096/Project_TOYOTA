import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:evcar/Screens/Home/home_page.dart';
import 'package:evcar/Screens/More/more_page.dart';
import 'package:evcar/Screens/More/moreone_page.dart';
import 'package:evcar/Screens/Profile/profile_page.dart';
import 'package:evcar/component/background.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int selectedIndex = 0;
  final screen = [
    const Homescreen(),
    const Moresonescreen(),
    const Morescreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: const Color.fromRGBO(5, 4, 4, 1),
          color: const Color.fromRGBO(156, 13, 13, 1),
          index: selectedIndex,
          items: const [
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
          child: screen[selectedIndex],
        ),
      ),
    );
  }
}
