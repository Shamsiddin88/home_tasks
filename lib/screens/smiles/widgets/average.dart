import 'dart:math';

import 'package:flutter/material.dart';
class Average extends CustomPainter {Average({required this.sweepAngle});
  final double sweepAngle;
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect =
    Offset(size.width * 0.26, size.height / 1.8) & const Size(20, 20);
    const startAngle = 9.8;

    final radius = min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2);

    var paint = Paint()..color = Colors.yellow..style = PaintingStyle.stroke..strokeWidth = 4;
    canvas.drawCircle(center, radius, paint);
    final smilePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4
      ..color=Colors.yellow;
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
    canvas.drawCircle(
        Offset(center.dx - radius / 3, center.dy - radius / 3), 3, Paint()..color=Colors.yellow);
    canvas.drawCircle(
        Offset(center.dx + radius / 3, center.dy - radius / 3), 3, Paint()..color=Colors.yellow);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}