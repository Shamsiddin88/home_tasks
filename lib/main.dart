import 'package:flutter/material.dart';
import 'package:home_tasks/helper_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: HelperScreen(),
    ),
  );
}
