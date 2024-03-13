import 'package:flutter/material.dart';

class ThirdExampleScreen extends StatefulWidget {
  const ThirdExampleScreen({Key? key}) : super(key: key);

  @override
  State<ThirdExampleScreen> createState() => _ThirdExampleScreenState();
}

class _ThirdExampleScreenState extends State<ThirdExampleScreen> {
  double _size = 200.0;
  bool _large = false;

  void _updateSize() {
    setState(() {
      _size = _large ? 350.0 : 200.0;
      _large = !_large;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,border: Border.all(color: Colors.black, width: 1)
              ),

              child: AnimatedSize(
                curve: Curves.easeIn,
                duration: const Duration(seconds: 3),
                child: Container(
                  width: _size,
                  height: _size,
                  color: Colors.lightBlue,
                  child: Center(child: Text("Woolha.com", style: TextStyle(color: Colors.white, fontSize: 60),)),
                ),
              ),
            ),
            TextButton(style: TextButton.styleFrom(backgroundColor: Colors.lightBlue),onPressed: () => _updateSize(), child: Text("Change Size", style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
    );
  }
}
