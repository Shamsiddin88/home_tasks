import 'package:flutter/material.dart';
import 'package:home_tasks/screens/tab_box.dart';
import 'package:home_tasks/screens/tab_box_second.dart';
import 'package:home_tasks/screens/tab_box_third.dart';
import 'package:home_tasks/utils/colors/app_colors.dart';
import 'package:home_tasks/utils/styles/app_text_style.dart';

class HelperScreen extends StatelessWidget {
  const HelperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>TabBox()));}, child: Text("First example", style: TextStyle(fontSize: 22),)),
          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>TabBoxSecond()));}, child: Text("Second example", style: TextStyle(fontSize: 22),)),
          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>TabBoxThird()));}, child: Text("Third example", style: TextStyle(fontSize: 22),))
        ],),
      ),
    );
  }
}
