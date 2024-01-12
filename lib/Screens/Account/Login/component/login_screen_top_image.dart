import 'package:flutter/material.dart';

import 'package:evcar/component/config/config.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: defaultPadding), // Reduce the top spacing
        const Text(
          "LOGIN",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
            height:
                defaultPadding), // Reduce the spacing between text and image
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: Transform.scale(
                scale: 0.75,
                child: Image.asset(
                  tLock,
                  // You can also use other parameters like width, height, fit, etc.
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(
            height:
                defaultPadding), // Reduce the spacing between image and text field
      ],
    );
  }
}
