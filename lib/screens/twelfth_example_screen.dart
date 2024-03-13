import 'package:flutter/material.dart';

class TwelfthExampleScreen extends StatefulWidget {
  const TwelfthExampleScreen({Key? key}) : super(key: key);

  @override
  _TwelfthExampleScreenState createState() => _TwelfthExampleScreenState();
}

class _TwelfthExampleScreenState extends State<TwelfthExampleScreen>
    with SingleTickerProviderStateMixin {
  bool isClicked=false;
  late AnimationController controller;
  late Animation colorAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));

    colorAnimation = ColorTween(begin: Colors.white, end: Colors.black).animate(controller);

    controller.addListener(() {
      setState(() {});
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Twelfth example"),
      ),
      body: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
                height: 200,
                decoration: BoxDecoration(border: Border.all(width: 4, color: Colors.black), color: colorAnimation.value,),

                child: FlutterLogo()),
            TextButton(onPressed: (){
              setState(() {
                isClicked=!isClicked;
                if (isClicked) {
                  controller.forward(from: 0);
                } else {
                  controller.reverse();
                }
              });


            }, child: Text("Click me!"))
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
