import 'package:rick_and_morty/features/data/models/character_model.dart';
import 'package:rick_and_morty/features/data/models/episode_model.dart';

import '../../core/utils/result.dart';

abstract class EpisodeRepository {
  Future<Result<EpisodeResponse>> getEpisodes(int page);

}