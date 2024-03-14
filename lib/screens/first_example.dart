import 'dart:math';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class FirstExample extends StatefulWidget {
  const FirstExample({Key? key}) : super(key: key);

  @override
  State<FirstExample> createState() => _FirstExampleState();
}

class _FirstExampleState extends State<FirstExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Flag"),
      ),
      body: Center(
        child: Container(
          color: Colors.blue,
          child: CustomPaint(
            size: const Size(double.infinity, 300),
            painter: MyPainter(sweepAngle: pi),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  MyPainter({required this.sweepAngle});
  final double sweepAngle;

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;




    var paint1 = Paint()..color = Colors.blue;
    var paint2 = Paint()..color = Colors.white;
    var paint3 = Paint()..color = Colors.red..strokeWidth=15;
    var paint4 = Paint()..color = Colors.green;

    Rect rect = const Offset(15, 15) & const Size(70, 70);
    const startAngle = 1.5;
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 4;

    canvas.drawRect(
      const Offset(0, 0) & Size(width, height/3),
      paint1,
    );

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);

    canvas.drawCircle(
        Offset(60, 50), 35, Paint()..color=Colors.blue);


    canvas.drawLine(
      Offset(0,height/3),
      Offset(width,height/3),
      paint3,
    );

    canvas.drawRect(
      Offset(0,height/3) & Size(width, height/3),
      paint2,
    );

    canvas.drawLine(
      Offset(0,(height/3)*2),
      Offset(width,(height/3)*2),
      paint3,
    );

    canvas.drawRect(
      Offset(0,(height/3)*2) & Size(width, height/3),
      paint4,
    );

    canvas.drawPath(getStarPath(size.width / 5, size.height / 4.1, 12, 4), Paint()..color=Colors.white);
    canvas.drawPath(getStarPath(size.width / 5+30, size.height / 4.1, 12, 4), Paint()..color=Colors.white);
    canvas.drawPath(getStarPath(size.width / 5+60, size.height / 4.1, 12, 4), Paint()..color=Colors.white);
    canvas.drawPath(getStarPath(size.width / 5+90, size.height / 4.1, 12, 4), Paint()..color=Colors.white);
    canvas.drawPath(getStarPath(size.width / 5+120, size.height / 4.1, 12, 4), Paint()..color=Colors.white);
    canvas.drawPath(getStarPath(size.width / 5+90, size.height / 4.1-25, 12, 4), Paint()..color=Colors.white);
    canvas.drawPath(getStarPath(size.width / 5+60, size.height / 4.1-25, 12, 4), Paint()..color=Colors.white);
    canvas.drawPath(getStarPath(size.width / 5+30, size.height / 4.1-25, 12, 4), Paint()..color=Colors.white);
    canvas.drawPath(getStarPath(size.width / 5, size.height / 4.1-25, 12, 4), Paint()..color=Colors.white);
    canvas.drawPath(getStarPath(size.width / 5+60, size.height / 4.1-50, 12, 4), Paint()..color=Colors.white);
    canvas.drawPath(getStarPath(size.width / 5+30, size.height / 4.1-50, 12, 4), Paint()..color=Colors.white);
    canvas.drawPath(getStarPath(size.width / 5, size.height / 4.1-50, 12, 4), Paint()..color=Colors.white);



  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

Path getStarPath(double cx, double cy, double outerRadius, double innerRadius) {
  double deltaAngle = 2 * math.pi / 5;
  double rotation = -math.pi / 2;
  Path path = Path();
  double x, y;
  for (int i = 0; i < 5; i++) {
    x = cx + math.cos(rotation + i * deltaAngle) * outerRadius;
    y = cy + math.sin(rotation + i * deltaAngle) * outerRadius;
    if (i == 0) {
      path.moveTo(x, y);
    } else {
      path.lineTo(x, y);
    }
    x = cx + math.cos(rotation + i * deltaAngle + deltaAngle / 2) * innerRadius;
    y = cy + math.sin(rotation + i * deltaAngle + deltaAngle / 2) * innerRadius;
    path.lineTo(x, y);
  }
  path.close();
  return path;
}
