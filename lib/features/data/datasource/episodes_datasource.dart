import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/constants/constants.dart';
import 'package:rick_and_morty/core/utils/result.dart';
import 'package:rick_and_morty/features/data/models/character_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:rick_and_morty/features/data/models/episode_model.dart';

abstract class EpisodesDataSource{
  Future<Result<EpisodeResponse>> getEpisodes(int page);
}

class EpisodeDataSourceImpl implements EpisodesDataSource{
  @override
  Future<Result<EpisodeResponse>> getEpisodes(int page)async {
    EpisodeResponse episodes;
    try {
      final response = await http.get(
          Uri.parse(
              "${apiUrl}episode/?page=$page"),
         );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
        episodes = EpisodeResponse.fromJson(jsonResponse);
        return Result.success(episodes);
      } else {
        return Result.error(message: response.statusCode.toString());

      }
    } on Exception catch (e) {
      print(e.toString());
      throw Exception();
    }
  }
  }
