import 'package:evcar/component/background.dart';
import 'package:flutter/material.dart';

//Import package
class Moresonescreen extends StatelessWidget {
  const Moresonescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: Stack(
        fit: StackFit.expand,
      ),
    );
  }
}
