import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ThirdExample extends StatefulWidget {
  const ThirdExample({Key? key}) : super(key: key);

  @override
  State<ThirdExample> createState() => _ThirdExampleState();
}

class _ThirdExampleState extends State<ThirdExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Snowman"),
      ),
      body: Center(
        child: Container(
          color: Colors.grey,
          child: CustomPaint(
            size: const Size(350, 600),
            painter: MyPainter(),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    var paint = Paint()..color = Colors.white..style=PaintingStyle.fill..strokeWidth=8;
    canvas.drawCircle(Offset(width/2, height/3*2), 130, paint);
    canvas.drawCircle(Offset(width/2, height/3*2), 130, Paint()..style=PaintingStyle.stroke..color=Colors.black..strokeWidth=8);
    canvas.drawCircle(Offset(width/2, height/2.7), 100, Paint()..style=PaintingStyle.stroke..color=Colors.black..strokeWidth=14);
    canvas.drawCircle(Offset(width/2, height/2.7), 100, paint);

    final smilePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;
    canvas.drawArc(
      Rect.fromCenter(center: Offset(width/2, height/2-25),width: 60, height: 30),
      0,
      pi,
      false,
      smilePaint,
    );

    canvas.drawLine(
      Offset(width/5*4, height/4*2+20),
      Offset(width, height/6*1),
      Paint()..strokeWidth=10,
    );

    canvas.drawLine(
      Offset(width/5, height/4*2+20),
      Offset(0, height/6),
      Paint()..strokeWidth=10,
    );

    canvas.drawCircle(
        Offset(width/2+5, height/2.5), 19, Paint()..color=Colors.orange);

    Paint painting = Paint()
      ..color = Colors.orange
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(width/2, height/2.5+20);
    path.lineTo(width/2, height/2.5-20);
    path.lineTo(width/2+60, height/2.5);
    path.close();

    canvas.drawPath(path, painting);



    canvas.drawCircle(
        Offset(width/3+30, height/2-90), 15, Paint()..style=PaintingStyle.stroke..strokeWidth=3);
    canvas.drawCircle(
        Offset(width/3+32, height/2-88), 12, Paint()..style=PaintingStyle.fill..strokeWidth=3);
    canvas.drawCircle(
        Offset(width/3*2-20, height/2-90), 15, Paint()..style=PaintingStyle.stroke..strokeWidth=3);
    canvas.drawCircle(
        Offset(width/3*2-18, height/2-88), 12, Paint()..style=PaintingStyle.fill..strokeWidth=3);

    canvas.drawCircle(
        Offset(width/2, height/4*3), 15, Paint());
    canvas.drawCircle(
        Offset(width/2, height/4*3-50), 15, Paint());
    canvas.drawCircle(
        Offset(width/2, height/4*3-100), 15, Paint());

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
