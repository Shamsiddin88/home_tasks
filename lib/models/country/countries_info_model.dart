import 'package:home_tasks/models/country/currency_model.dart';
import 'package:home_tasks/models/country/flag_model.dart';
import 'package:home_tasks/models/country/name_model.dart';

class CountriesInfoModel {
  final Name name;
  final Flag flag;
  final Map<String, Currency> currencies;
  final List<String> capital;
  final String region;
  final int population;

  CountriesInfoModel({
    required this.flag,
    required this.name,
    required this.capital,
    required this.currencies,
    required this.population,
    required this.region,
  });

  factory CountriesInfoModel.fromJson(Map<String, dynamic> json) {
    return CountriesInfoModel(
      population: json['population'] as int? ?? 0,
      name: Name.fromJson(json['name'] ?? {}),
      flag: Flag.fromJson(json['flags'] ?? {}),
      capital: List<String>.from(json['capital'] ?? [""]),
      currencies: (json['currencies'] as Map<String, dynamic>? ?? {}).map(
            (key, value) => MapEntry(key, Currency.fromJson(value ?? {})),
      ),
      region: json['region'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'population': population,
      'name': name.toJson(),
      'capital': capital,
      'currencies': currencies.map((key, value) => MapEntry(key, value.toJson())),
      'region': region,
      'flags': flag,
    };
  }
}
