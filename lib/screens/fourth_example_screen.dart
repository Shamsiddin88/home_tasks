import 'package:flutter/material.dart';

class FourthExampleScreen extends StatefulWidget {
  const FourthExampleScreen({Key? key}) : super(key: key);

  @override
  State<FourthExampleScreen> createState() => _FourthExampleScreenState();
}

class _FourthExampleScreenState extends State<FourthExampleScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<AlignmentGeometry> _alignAnimation;
  bool _isAlignedTopLeft = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: false);

    _alignAnimation = _controller.drive(
      AlignmentTween(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,        
      ).chain(CurveTween(curve: Curves.bounceIn)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _changeAlignment() {
    setState(() {
      _isAlignedTopLeft = !_isAlignedTopLeft;
      _controller.animateTo(_isAlignedTopLeft ? 0.0 : 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fourth Example"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 400,
              width: 300,
              color: Colors.grey,
              child: AlignTransition(
                alignment: _alignAnimation,
                child: Container(
                  color: Colors.green,
                  child: Text(
                    "Woolha.com",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: _changeAlignment,
              child: Text("Change Alignment"),
            )
          ],
        ),
      ),
    );
  }
}
