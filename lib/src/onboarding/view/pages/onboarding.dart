import 'package:flutter/material.dart';

import 'package:donut/src/onboarding/widgets/image_display.dart';

class Onboarding extends StatelessWidget {
  final int number;
  final Widget image;
  final Animation<Offset> imageAnimation;
  final Widget textColumn;

  const Onboarding({
    Key? key,
    required this.number,
    required this.image,
    required this.imageAnimation,
    required this.textColumn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ImageDisplay(
          pageNumber: number,
          image: image,
          imageAnimation: imageAnimation,
        ),
        const SizedBox(height: 50.0),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: textColumn,
        ),
      ],
    );
  }
}
