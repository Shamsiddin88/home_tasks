import 'package:flutter/material.dart';
import 'package:home_tasks/data/network/api_provider.dart';
import 'package:home_tasks/data/repository/countries_repository.dart';
import 'package:home_tasks/data/repository/users_repository.dart';
import 'package:home_tasks/screens/helper_screen.dart';
import 'package:home_tasks/view_models/countries_view_model.dart';
import 'package:home_tasks/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  ApiProvider apiProvider = ApiProvider();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => UsersViewModel(
              usersRepository: UsersRepository(apiProvider: apiProvider))),
      ChangeNotifierProvider(
          create: (_) => CountriesViewModel(countryRepository: CountriesRepository(apiProvider: apiProvider)))
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
      home: HelperScreen(),
    );
  }
}
