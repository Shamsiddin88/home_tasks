import 'package:flutter/material.dart';
import 'package:home_tasks/data/local/storage_repository.dart';
import 'package:home_tasks/screens/splash_screen/splash_screen.dart';


Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  StorageRepository();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: SplashScreen(),
    ),
  );
}
