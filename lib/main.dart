import 'package:flutter/material.dart';
import 'package:home_tasks/data/local/storage_repository.dart';
import 'package:provider/provider.dart';
import 'package:home_tasks/view_models/calculate_view_model.dart';
import 'package:home_tasks/screens/calculate_screen.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => CalculateViewModel(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: CalculateScreen(),
    );
  }
}
