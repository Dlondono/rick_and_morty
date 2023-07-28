import 'package:rick_and_morty/core/utils/result.dart';
import 'package:rick_and_morty/features/data/datasource/character_datasource.dart';
import 'package:rick_and_morty/features/data/models/character_model.dart';
import 'package:rick_and_morty/features/domain/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterDataSource characterDataSource;

  CharacterRepositoryImpl({required this.characterDataSource});

  @override
  Future<Result<CharacterReponse>> getCharacters(int page) async{
    return await characterDataSource.getCharacters(page);
  }
}