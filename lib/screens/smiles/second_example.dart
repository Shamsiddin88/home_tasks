import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:home_tasks/screens/smiles/widgets/average.dart';
import 'package:home_tasks/screens/smiles/widgets/bad.dart';
import 'package:home_tasks/screens/smiles/widgets/good.dart';
import 'package:home_tasks/screens/smiles/widgets/very_good.dart';

class SecondExample extends StatefulWidget {
  const SecondExample({Key? key}) : super(key: key);

  @override
  State<SecondExample> createState() => _SecondExampleState();
}

class _SecondExampleState extends State<SecondExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Smile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                width: 100,
                height: 90,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.grey.withOpacity(.2), ),
                child: Column(
                  children: [
                    CustomPaint(
                      size: const Size(40, 40),
                      painter: VeryGood(),
                    ),
                    SizedBox(height: 10,),
                    Text("Juda yaxshi")
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                width: 100,
                height: 90,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.grey.withOpacity(.2), ),
                child: Column(
                  children: [
                    CustomPaint(
                      size: const Size(40, 40),
                      painter: Good(),
                    ),
                    SizedBox(height: 10,),
                    Text("Yaxshi")
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                width: 100,
                height: 90,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.grey.withOpacity(.2), ),
                child: Column(
                  children: [
                    CustomPaint(
                      size: const Size(40, 40),
                      painter: Average(sweepAngle: 3.4*pi/4),
                    ),
                    SizedBox(height: 10,),
                    Text("O'rtacha")
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                width: 100,
                height: 90,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.grey.withOpacity(.2), ),
                child: Column(
                  children: [
                    CustomPaint(
                      size: const Size(40, 40),
                      painter: Bad(sweepAngle: 3.4*pi/4),
                    ),
                    SizedBox(height: 10,),
                    Text("Yomon")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


