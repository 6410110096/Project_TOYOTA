import 'package:flutter/material.dart';

import 'package:evcar/component/config/config.dart';

class SignUpScreenTopImage extends StatelessWidget {
  const SignUpScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Sign Up".toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: defaultPadding),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: Transform.scale(
                scale: 0.75,
                child: Image.asset(
                  tLock,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }
}
