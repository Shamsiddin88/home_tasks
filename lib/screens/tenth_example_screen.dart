import 'dart:math';

import 'package:flutter/material.dart';

class TenthExampleScreen extends StatefulWidget {
  const TenthExampleScreen({Key? key}) : super(key: key);

  @override
  _TenthExampleScreenState createState() => _TenthExampleScreenState();
}

class _TenthExampleScreenState extends State<TenthExampleScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<double> sizeAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    animation = Tween<double>(begin: 0, end: 2 * pi).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.linear,
        reverseCurve: Curves.linear,
      ),
    );

    sizeAnimation =
        Tween<double>(begin: 10.0, end: 90.0).animate(animationController);

    animationController
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {});
    animationController.repeat(reverse: true);
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
        title: const Text("Tenth example"),

      ),
      body: Center(
        child: Container(
          width: sizeAnimation.value * 2,
          height: sizeAnimation.value * 2,
          child: Transform.rotate(
            angle: animation.value,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: sizeAnimation.value,
                      height: sizeAnimation.value,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                    ),
                    Container(
                      width: sizeAnimation.value,
                      height: sizeAnimation.value,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: sizeAnimation.value,
                      height: sizeAnimation.value,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.yellow),
                    ),
                    Container(
                      width: sizeAnimation.value,
                      height: sizeAnimation.value,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.green),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
