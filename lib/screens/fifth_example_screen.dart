import 'package:flutter/material.dart';

class FifthExampleScreen extends StatefulWidget {
  const FifthExampleScreen({Key? key}) : super(key: key);

  @override
  _FifthExampleScreenState createState() => _FifthExampleScreenState();
}

class _FifthExampleScreenState extends State<FifthExampleScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation colorAnimation;
  late Animation colorBorderAnimation;
  late Animation borderRadiusAnimation;
  late Animation borderSizeAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));

    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller);
    colorBorderAnimation = ColorTween(begin: Colors.red, end: Colors.black).animate(controller);

    borderRadiusAnimation = Tween<double>(begin: 5.0, end: 100.0).animate(controller);

    borderSizeAnimation = Tween<double>(begin: 10.0, end: 1.0).animate(controller);

    controller.addListener(() {
      setState(() {});
    });

    controller.repeat(reverse: true);


  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fifth example"),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: colorAnimation.value,
            borderRadius: BorderRadius.circular(borderRadiusAnimation.value),
            border: Border.all(width: borderSizeAnimation.value, color: colorBorderAnimation.value)
          ),
        ),
      ),
    );
  }
}
