import 'package:flutter/material.dart';

import 'package:donut/src/widgets/widgets.dart';

class Header extends StatelessWidget {
  final VoidCallback onSkip;

  const Header({
    Key? key,
    required this.onSkip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Logo(
          size: 50.0,
        ),
        GestureDetector(
          onTap: onSkip,
          child: Text(
            'Skip',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.brown.shade600,
                ),
          ),
        ),
      ],
    );
  }
}
