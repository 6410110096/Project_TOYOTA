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
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 2,
              child: Transform.scale(
                scale: 1,
                child: const Image(
                  image: AssetImage(tLock),
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
