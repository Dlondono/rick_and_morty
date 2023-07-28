import 'package:rick_and_morty/features/data/models/character_model.dart';
import 'package:rick_and_morty/features/data/models/location_model.dart';

import '../../core/utils/result.dart';

abstract class LocationRepository {
  Future<Result<LocationResponse>> getLocations(int page);

}