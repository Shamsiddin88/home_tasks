import 'package:flutter/material.dart';
import 'package:home_tasks/screens/HomeScreen.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: HomeScreen(),
    ),
  );
}
