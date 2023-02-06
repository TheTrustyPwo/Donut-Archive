import 'package:flutter/material.dart';

class TextColumn extends StatelessWidget {
  final String title;
  final String text;

  const TextColumn({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: const Color(0xFFaf4d38), fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30.0),
        Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: const Color(0xFF572108)),
        ),
      ],
    );
  }
}
