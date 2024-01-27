import 'package:flutter/material.dart';
import '../../../../constants/image_strings.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
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
