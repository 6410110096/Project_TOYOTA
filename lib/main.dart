import 'package:evcar/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TOYOTA',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 11, 12, 12),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
