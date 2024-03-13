import 'package:flutter/material.dart';

class EleventhExampleScreen extends StatefulWidget {
  const EleventhExampleScreen({Key? key}) : super(key: key);

  @override
  _EleventhExampleScreenState createState() => _EleventhExampleScreenState();
}

class _EleventhExampleScreenState extends State<EleventhExampleScreen>
    with SingleTickerProviderStateMixin {
  bool isBigger = false;
  late AnimationController controller;
  late Animation<double> textSizeAnimation;
  late Animation textColorAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    textSizeAnimation = Tween<double>(begin: 20, end: 70).animate(controller);
    textColorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.red).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Eleventh example"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 150,),
              Container(
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return Text(
                      "Hello Flutter World",
                      style: TextStyle(
                          fontStyle:
                              isBigger ? FontStyle.normal : FontStyle.italic,
                          fontWeight: isBigger? FontWeight.w400:FontWeight.w800,
                          fontSize: textSizeAnimation.value,
                          color: textColorAnimation.value),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.grey),
                    onPressed: () {
                      setState(() {
                        controller.forward(from: 0);
                        isBigger = false;
                      });
                    },
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.grey),
                    onPressed: () {
                      setState(() {
                        controller.reverse(from: 1);
                        isBigger = true;
                      });
                    },
                    child: Icon(
                      Icons.settings_backup_restore_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
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
