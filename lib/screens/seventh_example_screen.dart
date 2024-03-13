import 'package:flutter/material.dart';

class SeventhExampleScreen extends StatefulWidget {
  const SeventhExampleScreen({Key? key}) : super(key: key);

  @override
  _SeventhExampleScreenState createState() => _SeventhExampleScreenState();
}

class _SeventhExampleScreenState extends State<SeventhExampleScreen>
    with SingleTickerProviderStateMixin {
  bool isClicked = false;
  late AnimationController controller;
  late Animation<Color?> colorAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.yellow)
        .animate(controller);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seventh example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Container(
                  height: 200,
                  width: 200,
                  color: colorAnimation.value,
                  child: colorAnimation.value != Colors.blue
                      ? Center(child: Text("This is Second Widget"))
                      : Center(child: Text("This is First Widget")),
                );
              },
            ),
            TextButton(
              onPressed: () {
                isClicked=!isClicked;
                if (isClicked) {
                  controller.forward(from: 0);
                } else {
                  controller.reverse(from: 1);
                }

              },
              child: Text("Click here"),
            )
          ],
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
