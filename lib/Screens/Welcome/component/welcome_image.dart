import 'package:flutter/material.dart';

import 'package:evcar/component/config/config.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 10,
              child: Image.asset(blackCar),
            ),
            const Spacer(),
          ],
        ),
        const Text(
          "Welcome",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 40, color: tAccentColor),
        ),
        //const SizedBox(height: defaultPadding * 2),
        const Text(
          "Let's Get Start",
          style: TextStyle(fontSize: 15, color: tColor),
        ),
        const SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
