import 'package:flutter/material.dart';

class EighthExampleScreen extends StatefulWidget {
  const EighthExampleScreen({Key? key}) : super(key: key);

  @override
  State<EighthExampleScreen> createState() => _EighthExampleScreenState();
}

class _EighthExampleScreenState extends State<EighthExampleScreen> {
  double padValue = 0.0;

  void _updatePadding(double value) {
    setState(() {
      padValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Eighth example"),
      ),
      body: GestureDetector(
        onTap: (){ _updatePadding(padValue == 0.0 ? 100.0 : 0.0);},
        child: Center(
          child: AnimatedPadding(
            padding: EdgeInsets.symmetric(horizontal:  padValue),
            duration: const Duration(seconds: 1),
            curve: Curves.linear,
            child: Container(margin: EdgeInsets.symmetric(horizontal: 10),width: double.infinity,height: 100,color: Colors.blue,),
          ),
        ),
      ),

    );
  }
}
