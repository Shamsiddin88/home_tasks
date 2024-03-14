import 'dart:math';

import 'package:flutter/material.dart';
class Good extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2);

    var paint = Paint()..color = Colors.blue..style = PaintingStyle.stroke..strokeWidth = 4;
    canvas.drawCircle(center, radius, paint);
    final smilePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4
      ..color=Colors.blue;
    canvas.drawLine(
     Offset(center.dx - radius / 3, center.dy + radius / 3), Offset(center.dx + radius / 3, center.dy + radius / 3), paint);
    canvas.drawCircle(
        Offset(center.dx - radius / 3, center.dy - radius / 3), 3, Paint()..color=Colors.blue);
    canvas.drawCircle(
        Offset(center.dx + radius / 3, center.dy - radius / 3), 3, Paint()..color=Colors.blue
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}