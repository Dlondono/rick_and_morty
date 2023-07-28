import 'package:rick_and_morty/core/utils/result.dart';
import 'package:rick_and_morty/features/data/datasource/episodes_datasource.dart';
import 'package:rick_and_morty/features/data/models/episode_model.dart';
import 'package:rick_and_morty/features/domain/ep%C3%ADsode_repository.dart';

class EpisodeRepositoryImpl implements EpisodeRepository {
  final EpisodesDataSource episodesDataSource;

  EpisodeRepositoryImpl({required this.episodesDataSource});

  @override
  Future<Result<EpisodeResponse>> getEpisodes(int page) async{
    return await episodesDataSource.getEpisodes(page);
  }
}