import 'package:flutter/cupertino.dart';
import 'package:home_tasks/data/repository/countries_repository.dart';
import 'package:home_tasks/models/country/countries_info_model.dart';

class CountriesViewModel extends ChangeNotifier {

  CountriesViewModel({required this.countryRepository}){
    _fetchCountries();
  }

  final CountriesRepository countryRepository;

  bool isLoading = false;
  List <CountriesInfoModel> countries = [];

  _fetchCountries() async{
    isLoading = true;
    notifyListeners();
    var countryInfo = await countryRepository.getCountries();
    isLoading = false;
    notifyListeners();
    if (countryInfo!.isEmpty){

    }
    else{
      countries = countryInfo;
      notifyListeners();
    }
  }
}