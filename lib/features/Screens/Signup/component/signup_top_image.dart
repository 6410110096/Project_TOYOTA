import 'package:evcar/constants/image_strings.dart';
import 'package:flutter/material.dart';

class SignUpScreenTopImage extends StatelessWidget {
  const SignUpScreenTopImage({
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
              flex: 2,
              child: Transform.scale(
                scale: 1,
                child: const Image(
                  image: AssetImage(tWelcomeScreenImage),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
