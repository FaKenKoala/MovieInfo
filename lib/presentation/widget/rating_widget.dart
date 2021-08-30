import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie_info/infrastructure/util/color_util.dart';

class RatingPainter extends CustomPainter {
  final num? valueInTen;
  final double radius;
  RatingPainter({required this.valueInTen, this.radius = 25});

  @override
  void paint(Canvas canvas, Size size) {
    Offset offset = Offset(radius, radius);
    canvas.drawCircle(offset, radius, Paint()..color = ColorUtil.PrimaryColor);

    final value = valueInTen ?? 0;
    var ringPainter = Paint()
      ..color = value < 7.0
          ? Colors.yellow
          : value < 9.0
              ? Colors.green
              : Colors.red
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    canvas.drawArc(
        Rect.fromCenter(
            center: offset, width: radius * 2 - 8, height: radius * 2 - 8),
        -pi / 2,
        2 * pi * (value / 10),
        false,
        ringPainter);

    String valueString = "${valueInTen?.toStringAsFixed(1) ?? 'NR'}";
    final textSpan = TextSpan(
        text: '$valueString',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ));
    TextPainter textPainter =
        TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    textPainter.layout(minWidth: 0, maxWidth: 40);
    final textCenter =
        Offset(radius - textPainter.width / 2, radius - textPainter.height / 2);
    textPainter.paint(canvas, textCenter);
  }

  @override
  bool shouldRepaint(RatingPainter oldDelegate) {
    return false;
  }
}
