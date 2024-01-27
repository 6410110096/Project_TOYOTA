import 'package:evcar/constants/colors.dart';
import 'package:evcar/constants/image_strings.dart';
import 'package:evcar/constants/sizes.dart';
import 'package:flutter/material.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 10,
              child: Image.asset(tWelcomeScreenImage),
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
          style: TextStyle(fontSize: 15, color: tAccentColor),
        ),
        const SizedBox(height: tDefaultSpace),
      ],
    );
  }
}
