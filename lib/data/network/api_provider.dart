import 'dart:convert';

import 'package:home_tasks/models/country/countries_info_model.dart';
import 'package:home_tasks/models/users/users_model.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<List<UsersModel>> getInfoUsers() async {
    try {
      http.Response response = await http
          .get(Uri.parse("https://fifth-exam.free.mockoapp.net/users"));

      if (response.statusCode == 200) {
        return (jsonDecode(response.body) as List?)
                ?.map((e) => UsersModel.fromJson(e))
                .toList() ??
            [];
      }
    } catch (error) {
      return [];
    }
    return [];
  }
  Future<List<CountriesInfoModel>?> getCountries() async {
    try {
      http.Response responseCountry = await http
          .get(Uri.parse("https://restcountries.com/v3.1/all"));

      if (responseCountry.statusCode == 200) {
        return (jsonDecode(responseCountry.body) as List?)
                ?.map((e) => CountriesInfoModel.fromJson(e))
                .toList() ??
            [];
      }
    } catch (error) {
      return [];
    }
    return [];
  }
}
