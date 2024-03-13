import 'package:flutter/material.dart';
import 'package:home_tasks/screens/eighth_example_screen.dart';
import 'package:home_tasks/screens/eleventh_example_screen.dart';
import 'package:home_tasks/screens/fifth_example_screen.dart';
import 'package:home_tasks/screens/first_example_screen.dart';
import 'package:home_tasks/screens/fourth_example_screen.dart';
import 'package:home_tasks/screens/ninth_example_screen.dart';
import 'package:home_tasks/screens/second_example_screen.dart';
import 'package:home_tasks/screens/seventh_example_screen.dart';
import 'package:home_tasks/screens/sixth_example_screen.dart';
import 'package:home_tasks/screens/tenth_example_screen.dart';
import 'package:home_tasks/screens/third_example_screen.dart';
import 'package:home_tasks/screens/thirteenth_example_screen.dart';
import 'package:home_tasks/screens/twelfth_example_screen.dart';

class HelperScreen extends StatelessWidget {
  const HelperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>FirstExampleScreen()));}, child: Text("First Example")),
          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondExampleScreen()));}, child: Text("Second Example")),
          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ThirdExampleScreen()));}, child: Text("Third Example")),
          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>FourthExampleScreen()));}, child: Text("Fourth Example")),
          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>FifthExampleScreen()));}, child: Text("Fifth Example")),
          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SixthExampleScreen()));}, child: Text("Sixth Example")),
          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SeventhExampleScreen()));}, child: Text("Seventh Example")),
          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>EighthExampleScreen()));}, child: Text("Eighth Example")),
          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>NinthExampleScreen()));}, child: Text("Ninth Example")),
          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>TenthExampleScreen()));}, child: Text("Tenth Example")),
          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>EleventhExampleScreen()));}, child: Text("Eleventh Example")),
          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>TwelfthExampleScreen()));}, child: Text("Twelfnth Example")),
          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ThirteenthExampleScreen()));}, child: Text("Thirteenth Example")),
        ],),
      ),
    );
  }
}
