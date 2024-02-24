import 'package:flutter/material.dart';
import 'package:home_tasks/helper_screen.dart';
import 'package:home_tasks/screens/cards_screen/cards_screen.dart';
import 'package:home_tasks/screens/home_screen/home_screen.dart';
import 'package:home_tasks/screens/profile_screen/profile_screen.dart';
import 'package:home_tasks/screens/tab_box.dart';
import 'package:home_tasks/screens/tab_box_second.dart';
import 'package:home_tasks/screens/tab_box_third.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: TabBox(),
    ),
  );
}