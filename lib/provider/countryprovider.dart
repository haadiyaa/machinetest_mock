import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_app/model/countrmodel.dart';
import 'package:login_app/model/countryselect.dart';
import 'package:login_app/model/selectcountrymodel.dart';
import 'package:login_app/secrets/secrets.dart';

class Countryprovider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _error = "";
  String get error => _error;
  List<Data>? searchList = [];
  SelectCountyModel? selectCountyModel;

  Country? country;
  void fetchCountry() async {
    _isLoading = true;
    try {
      final url = Secrets.countryUrl;
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        country = Country.fromJson(data);
        print(country!.data![1].name);
        notifyListeners();
      } else {
        _error = 'Failed to fetch countries';
        print(_error);
      }
    } catch (e) {
      _error = "exception $e";
      print(_error);
    } finally {
      _isLoading = true;
      notifyListeners();
    }
  }

  void runFilter(String text) {
    if (country != null && country!.data != null) {
      final countries = country!.data;
      if (text.isEmpty) {
        searchList = countries!;
        notifyListeners();
        print('empty ${searchList!.length}');
      } else {
        searchList = countries!
            .where((element) =>
                element.name!.toLowerCase().contains(text.toLowerCase()))
            .toList();
        print('search ${searchList!.length}');
        notifyListeners();
      }
    }
  }

  void selectCountry() async {
    try {
      selectCountyModel = SelectCountyModel.fromJson(countryjson);
      notifyListeners();
    } catch (e) {
      _error = 'Failed to fetch countries ${e.toString()}';
      print(_error);
    } finally {
      notifyListeners();
    }
  }

  Future<void> selectedCountry(String id) async {
    try {
      final response = await http.post(
        Uri.parse(Secrets.selCountryPostUrl),
        body: {
          "country_id": id,
        },
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        _error = 'Error';
        print('error');
      }
      notifyListeners();
    } catch (e) {
      _error = 'Failed to fetch countries ${e.toString()}';
      print(_error);
    } finally {
      notifyListeners();
    }
  }
}
