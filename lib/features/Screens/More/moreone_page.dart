import 'package:evcar/component/background.dart';
import 'package:flutter/material.dart';

//Import package
class Moresonescreen extends StatelessWidget {
  const Moresonescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: Stack(
        fit: StackFit.expand,
      ),
    );
  }
}
