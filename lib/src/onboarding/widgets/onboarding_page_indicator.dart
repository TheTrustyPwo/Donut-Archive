import 'dart:math';

import 'package:flutter/material.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final double angle;
  final int currentPage;
  final Widget child;

  const OnboardingPageIndicator({
    Key? key,
    required this.angle,
    required this.currentPage,
    required this.child,
  }) : super(key: key);

  Color _getPageIndicatorColor(int pageIndex) {
    return currentPage > pageIndex
        ? const Color(0xFFFFFFFF)
        : const Color(0xFFFFFFFF).withOpacity(0.25);
  }

  double get indicatorGap => pi / 12;
  double get indicatorLength => pi / 3;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _OnboardingPageIndicatorPainter(
        color: _getPageIndicatorColor(0),
        startAngle: 2 * indicatorLength + 0.5 * indicatorGap + angle,
        indicatorLength: indicatorLength,
      ),
      child: CustomPaint(
        painter: _OnboardingPageIndicatorPainter(
          color: _getPageIndicatorColor(1),
          startAngle: 3 * indicatorLength + 1.5 * indicatorGap + angle,
          indicatorLength: indicatorLength,
        ),
        child: CustomPaint(
          painter: _OnboardingPageIndicatorPainter(
            color: _getPageIndicatorColor(2),
            startAngle: 4 * indicatorLength + 2.5 * indicatorGap + angle,
            indicatorLength: indicatorLength,
          ),
          child: CustomPaint(
            painter: _OnboardingPageIndicatorPainter(
              color: _getPageIndicatorColor(3),
              startAngle: 5 * indicatorLength + 3.5 * indicatorGap + angle,
              indicatorLength: indicatorLength,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class _OnboardingPageIndicatorPainter extends CustomPainter {
  final Color color;
  final double startAngle;
  final double indicatorLength;

  const _OnboardingPageIndicatorPainter({
    required this.color,
    required this.startAngle,
    required this.indicatorLength,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: (size.shortestSide + 12.0) / 2,
      ),
      startAngle,
      indicatorLength,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_OnboardingPageIndicatorPainter oldDelegate) {
    return color != oldDelegate.color || startAngle != oldDelegate.startAngle;
  }
}
