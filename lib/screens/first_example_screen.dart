import 'dart:math';

import 'package:flutter/material.dart';

class FirstExampleScreen extends StatefulWidget {
  const FirstExampleScreen({super.key});

  @override
  State<FirstExampleScreen> createState() => _FirstExampleScreenState();
}

class _FirstExampleScreenState extends State<FirstExampleScreen> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    animation = Tween<double>(begin: 0, end: 2 * pi).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.linear,
        reverseCurve: Curves.linear,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {});
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First example"),

      ),
      body: Center(
        child: Transform.rotate(
          angle: animation.value,
          child: Container(width: 200,height: 200, color: Colors.blue,),
        ),
      ),
    );
  }
}