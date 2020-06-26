import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class _CitiesProvider {
  List<dynamic> nameCities=[];

  _CitiesProvider();

  Future <List<dynamic>> getCities() async {
    final response = await http.get('https://peaku.co/api-v2/get-cities');
    if (response.statusCode == 200) {
      //print(json.decode(response.body));
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      print(jsonResponse);

      return jsonResponse['cities'];
    } else {
      throw Exception('Failed to load cities');
    }
  }
}

final citiesProvider = _CitiesProvider();