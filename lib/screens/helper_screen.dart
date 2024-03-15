import 'package:flutter/material.dart';
import 'package:home_tasks/screens/country/country_screen.dart';
import 'package:home_tasks/screens/users/users_info.dart';

class HelperScreen extends StatefulWidget {
  const HelperScreen({super.key});

  @override
  State<HelperScreen> createState() => _HelperScreenState();
}

class _HelperScreenState extends State<HelperScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HelperScreen"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center
        ,children: [
          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const CountriesScreen()));}, child: const Text("Country Screen")),
          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const UsersInfoScreen()));}, child: const Text("Users info Screen"))
        ],),
      ),
    );
  }
}
