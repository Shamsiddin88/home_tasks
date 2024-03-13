import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ThirteenthExampleScreen extends StatefulWidget {
  const ThirteenthExampleScreen({Key? key}) : super(key: key);

  @override
  _ThirteenthExampleScreenState createState() => _ThirteenthExampleScreenState();
}

class _ThirteenthExampleScreenState extends State<ThirteenthExampleScreen>
    with SingleTickerProviderStateMixin {

  BorderRadiusGeometry borderRadius=BorderRadius.circular(8);
  double heightContainer=0.0;
  double widthContainer=0.0;
  Color color=Colors.white;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thirteenth example"),
      ),
      body: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(duration: Duration(milliseconds: 500),
            width:widthContainer,
                height: heightContainer,
                decoration: BoxDecoration(borderRadius: borderRadius, color: color),),
            TextButton(onPressed: (){
              setState(() {
                Random rand=Random();
                widthContainer=rand.nextInt(300).toDouble();
                heightContainer=rand.nextInt(400).toDouble();
                color=Color.fromRGBO(rand.nextInt(255), rand.nextInt(255), rand.nextInt(255), 1);
                borderRadius=BorderRadius.circular(rand.nextInt(100).toDouble());
              });




            }, child: Text("Click me!"))
          ],
        ),
      ),
    );
  }


}
