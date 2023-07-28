import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/data/models/character_model.dart';
import 'package:rick_and_morty/features/data/models/location_model.dart';
import 'package:rick_and_morty/features/domain/location_repository.dart';

import '../../domain/character_repository.dart';

enum LocationState{initial, loading, loaded, failure}

class LocationBloc extends ChangeNotifier{
  final LocationRepository locationRepository;
  LocationBloc({required this.locationRepository});

  List<LocationModel> locations=[];
  int page=0;
  bool hasReachedMax = false;
  LocationState _locationState =LocationState.initial;
  LocationState get locationState => _locationState;

  setLocationState(LocationState value) {
    _locationState = value;
    notifyListeners();
  }
  Future<void> getLocations() async {
    page++;
    if(locationState!=LocationState.initial){
      setLocationState(LocationState.loading);
    }
    if (hasReachedMax) setLocationState(LocationState.loaded);

      final locationsData = await locationRepository.getLocations(page);
      hasReachedMax = locationsData.data==null || locationsData.data?.info.next == null;
    locations = locationsData.data ==null ? locations : [...locations, ...locationsData.data!.locations];

      setLocationState(LocationState.loaded);

      notifyListeners();
    }
  }

