import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/data/models/character_model.dart';
import 'package:rick_and_morty/features/domain/ep%C3%ADsode_repository.dart';

import '../../data/models/episode_model.dart';
import '../../domain/character_repository.dart';

enum EpisodeState{initial, loading, loaded, failure}

class EpisodeBloc extends ChangeNotifier{
  final EpisodeRepository episodeRepository;
  EpisodeBloc({required this.episodeRepository});

  List<EpisodeModel> episodes=[];
  int page=0;
  bool hasReachedMax = false;
  EpisodeState _episodeState =EpisodeState.initial;
  EpisodeState get episodeState => _episodeState;

  setEpisodeState(EpisodeState value) {
    _episodeState = value;
    notifyListeners();
  }
  Future<void> getEpisodes() async {
    page++;
    if(episodeState!=EpisodeState.initial){
      setEpisodeState(EpisodeState.loading);
    }
    if (hasReachedMax) setEpisodeState(EpisodeState.loaded);

      final episodeData = await episodeRepository.getEpisodes(page);
      hasReachedMax = episodeData.data == null;
      episodes = episodeData.data ==null ? episodes : [...episodes, ...episodeData.data!.results];

      setEpisodeState(EpisodeState.loaded);

      notifyListeners();
    }
  }

