import 'package:home_tasks/data/network/api_provider.dart';
import 'package:home_tasks/models/country/countries_info_model.dart';

class CountriesRepository {
  final ApiProvider apiProvider;

  CountriesRepository({required this.apiProvider});

  Future<List<CountriesInfoModel>?> getCountries()=>apiProvider.getCountries();



}