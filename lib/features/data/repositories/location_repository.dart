import 'package:rick_and_morty/core/utils/result.dart';
import 'package:rick_and_morty/features/data/datasource/locations_datasource.dart';
import 'package:rick_and_morty/features/data/models/location_model.dart';
import 'package:rick_and_morty/features/domain/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationsDataSource locationsDataSource;

  LocationRepositoryImpl({required this.locationsDataSource});

  @override
  Future<Result<LocationResponse>> getLocations(int page) async{
    return await locationsDataSource.getLocations(page);
  }
}