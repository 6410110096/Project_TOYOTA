import 'package:evcar/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeDataScreen extends StatelessWidget {
  const HomeDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Padding(
        padding: EdgeInsets.only(top: 10),
      ),
      Text(
        'TOYOTA EV & PSU',
        style: TextStyle(
          fontSize: 33,
          fontWeight: FontWeight.w600,
          color: tPrimaryColor,
        ),
      ),
      Text(
        'Model: CoE33 & EE55',
        style: TextStyle(fontSize: 16, color: tPrimaryColor),
      ),
      Text(
        'Hello PSU, Welcome to EV Car model Coe & EE',
        style: TextStyle(fontSize: 12, color: tPrimaryColor),
      ),
      SizedBox(height: 20),
    ]);
  }
}
