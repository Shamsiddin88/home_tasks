import 'package:flutter/material.dart';
import 'package:home_tasks/models/country/countries_info_model.dart';
import 'package:home_tasks/view_models/countries_view_model.dart';
import "package:provider/provider.dart";


class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Countries"),),
      body:context.watch<CountriesViewModel>().isLoading?
      const Center(child: CircularProgressIndicator(),)
          :ListView(children: [
        ...List.generate(context.watch<CountriesViewModel>().countries.length, (index) {
          CountriesInfoModel countries=context.watch<CountriesViewModel>().countries[index];
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Text("Name: ${countries.name.official}"),
                    Text("Region: ${countries.region}"),
                    Text("Capital: ${countries.capital[0]}"),
                    Text("Population: ${countries.population.toString()}"),
                  
                  
                  ],),
                ),
                Expanded(child: Image.network(countries.flag.png, height: 60,width: 100,))

              ],
            ),
          );


        })
      ],),    );
  }
}
