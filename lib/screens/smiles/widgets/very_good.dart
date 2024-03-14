import 'dart:math';

import 'package:flutter/material.dart';
class VeryGood extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2);

    var paint = Paint()..color = Colors.green..style = PaintingStyle.stroke..strokeWidth = 4;
    canvas.drawCircle(center, radius, paint);
    final smilePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4
      ..color=Colors.green;
    canvas.drawArc(
      Rect.fromCenter(center: center, width: radius, height: radius),
      0.5,
      (pi/3)*2,
      false,
      smilePaint,
    );
    canvas.drawCircle(
        Offset(center.dx - radius / 3, center.dy - radius / 3), 3, Paint()..color=Colors.green);
    canvas.drawCircle(
        Offset(center.dx + radius / 3, center.dy - radius / 3), 3, Paint()..color=Colors.green);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}