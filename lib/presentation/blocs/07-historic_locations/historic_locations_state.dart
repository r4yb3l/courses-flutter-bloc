part of 'historic_locations_bloc.dart';

class HistoricLocationsState extends Equatable {
  //Later when implement real location
  // List<Map<DateTime, (double, double)>> locations = [];
  List<(double latitude, double longitude)> locations;

Map<LocationCoordinates, Location> locationsInformations;

  HistoricLocationsState({
    this.locations = const [],
    this.locationsInformations = const {},
  });

  int get howManyLocationsUntilNow => locations.length;

  HistoricLocationsState copyWith({
    List<(double latitude, double longitude)>? locations,
    Map<LocationCoordinates, Location>? locationsInformations,
  }) {
    return HistoricLocationsState(
      locations: locations ?? this.locations,
      locationsInformations: locationsInformations ?? this.locationsInformations,
    );
  }

  @override
  List<Object?> get props => [locations, locationsInformations];
}

class LocationCoordinates extends Equatable {
  final double latitude;
  final double longitude;

  LocationCoordinates(this.latitude, this.longitude);

  @override
  List<Object?> get props => [latitude, longitude];
}
