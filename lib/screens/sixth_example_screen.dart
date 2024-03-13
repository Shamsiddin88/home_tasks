import 'package:flutter/material.dart';

class SixthExampleScreen extends StatefulWidget {
  const SixthExampleScreen({Key? key}) : super(key: key);

  @override
  _SixthExampleScreenState createState() => _SixthExampleScreenState();
}

class _SixthExampleScreenState extends State<SixthExampleScreen>
    with SingleTickerProviderStateMixin {
  bool isBigger = false;
  late AnimationController controller;
  late Animation<double> textSizeAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    textSizeAnimation = Tween<double>(begin: 14, end: 50).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sixth example"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return Text(
                      '''An parametric animation easing curve, i.e. a mapping of the unit interval to the unit interval.
Easing curves are used to adjust ''',
                      style: TextStyle(fontSize: textSizeAnimation.value),
                    );
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isBigger = !isBigger;
                    if (isBigger) {
                      controller.forward(from: 0);
                    } else {
                      controller.reverse(from: 1);
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  width: double.infinity,
                  color: Colors.grey,
                  child: Text(
                    isBigger ? "Smaller font" : "Bigger font",
                    style: TextStyle(fontSize: 20),
                  ),
                  alignment: Alignment.center,
                ),
              )
            ],
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
