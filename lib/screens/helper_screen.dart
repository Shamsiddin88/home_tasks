import 'package:flutter/material.dart';
import 'package:home_tasks/screens/first_example.dart';
import 'package:home_tasks/screens/fourth_example.dart';
import 'package:home_tasks/screens/smiles/second_example.dart';
import 'package:home_tasks/screens/third_example.dart';

class HelperScreen extends StatefulWidget {
  const HelperScreen({super.key});

  @override
  State<HelperScreen> createState() => _HelperScreenState();
}

class _HelperScreenState extends State<HelperScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Helpercreen"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>FirstExample()));}, child: Text("First example")),
          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondExample()));}, child: Text("Second example")),
          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ThirdExample()));}, child: Text("Third example")),
          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>FourthExample()));}, child: Text("Fourth example")),
        ],),
      ),
    );
  }
}
