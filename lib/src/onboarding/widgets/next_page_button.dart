import 'package:flutter/material.dart';

class NextPageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextPageButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.all(16.0),
      elevation: 0.0,
      shape: const CircleBorder(),
      fillColor: const Color(0xFFFFFFFF),
      onPressed: onPressed,
      child: const Icon(
        Icons.arrow_forward,
        color: Color(0xFFEB5757),
        size: 32.0,
      ),
    );
  }
}
