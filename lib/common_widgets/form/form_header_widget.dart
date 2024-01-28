import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    this.imageColor = Colors.white70,
    this.heightBetween = 35,
    required this.image,
    required this.title,
    required this.subTitle,
    this.imageHeight = 0.25,
    this.textAlign,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final Color? imageColor;
  final double imageHeight;
  final double? heightBetween;
  final String image, title, subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(
            image: AssetImage(image),
            color: imageColor,
            height: size.height * imageHeight),
        SizedBox(height: heightBetween),
        Text(title,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.red)),
        Text(subTitle,
            textAlign: textAlign,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.white54)),
      ],
    );
  }
}
