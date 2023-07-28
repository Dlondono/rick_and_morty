import 'package:rick_and_morty/features/data/models/character_model.dart';

import '../../core/utils/result.dart';

abstract class CharacterRepository {
  Future<Result<CharacterReponse>> getCharacters(int page);

}