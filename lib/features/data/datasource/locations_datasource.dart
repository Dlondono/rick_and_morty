import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/constants/constants.dart';
import 'package:rick_and_morty/core/utils/result.dart';
import 'package:rick_and_morty/features/data/models/character_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:rick_and_morty/features/data/models/location_model.dart';

abstract class LocationsDataSource{
  Future<Result<LocationResponse>> getLocations(int page);
}

class LocationsDataSourceImpl implements LocationsDataSource{
  @override
  Future<Result<LocationResponse>> getLocations(int page)async {
    LocationResponse locations;
    try {
      final response = await http.get(
          Uri.parse(
              "${apiUrl}location/?page=$page"),
         );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
        locations = LocationResponse.fromJson(jsonResponse);
        return Result.success(locations);
      } else {
        return Result.error(message: response.statusCode.toString());
      }
    } on Exception catch (e) {
      throw Exception();
    }
  }
  }
