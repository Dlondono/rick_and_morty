import 'dart:convert';
import 'package:rick_and_morty/core/constants/constants.dart';
import 'package:rick_and_morty/core/utils/result.dart';
import 'package:rick_and_morty/features/data/models/character_model.dart';
import 'package:http/http.dart' as http;

abstract class CharacterDataSource{
  Future<Result<CharacterReponse>> getCharacters(int page);
}

class CharacterDataSourceImpl implements CharacterDataSource{
  @override
  Future<Result<CharacterReponse>> getCharacters(int page)async {
    CharacterReponse characters;
    try {
       final response = await http.get(
          Uri.parse(
              "${apiUrl}character/?page=$page"),
         );
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
        characters = CharacterReponse.fromJson(jsonResponse);
        return Result.success(characters);
      } else {
        return Result.error(message: response.statusCode.toString());
      }
    } on Exception catch (e) {
      throw Exception();
    }
  }
  Future<Result<CharacterReponse>> getCharacter(String query)async {
    CharacterReponse characters;
    try {
      final response = await http.get(
          Uri.parse(
              "${apiUrl}character/?name=$query"),
         );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
        characters = CharacterReponse.fromJson(jsonResponse);
        return Result.success(characters);
      } else {
        return Result.error(message: response.statusCode.toString());
      }
    } on Exception catch (e) {
      throw Exception();
    }
  }
  }
