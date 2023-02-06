import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double size;

  const Logo({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/donut.png", height: size, width: size);
  }
}
