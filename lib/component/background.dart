import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color.fromRGBO(22, 1, 1, 1), Color.fromRGBO(5, 4, 4, 1)],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter),
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}
