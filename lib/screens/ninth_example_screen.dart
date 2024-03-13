import 'package:flutter/material.dart';

class NinthExampleScreen extends StatefulWidget {
  const NinthExampleScreen({Key? key}) : super(key: key);

  @override
  _NinthExampleScreenState createState() => _NinthExampleScreenState();
}

class _NinthExampleScreenState extends State<NinthExampleScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> colorAnimation;
  late Animation<Color?> colorBorderAnimation;
  late Animation<double> borderSizeAnimation;
  late Animation<double> shadowAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));

    colorAnimation = ColorTween(begin: Colors.purple, end: Colors.yellow).animate(controller);
    colorBorderAnimation = ColorTween(begin: Colors.red, end: Colors.orange).animate(controller);
    borderSizeAnimation = Tween<double>(begin: 30.0, end: 10.0).animate(controller);
    shadowAnimation = Tween<double>(begin: 0.0, end: 20.0).animate(controller);

    controller.addListener(() {
      setState(() {});
    });

    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ninth example"),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 20.0,
                spreadRadius: shadowAnimation.value,
                offset: const Offset(15.0, 15.0), // shadow direction: bottom right
              )
            ],
            color: colorAnimation.value,
            shape: BoxShape.circle,
            border: Border.all(width: borderSizeAnimation.value, color: colorBorderAnimation.value!),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
