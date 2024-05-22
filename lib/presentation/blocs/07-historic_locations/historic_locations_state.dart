part of 'historic_locations_bloc.dart';

class HistoricLocationsState extends Equatable {
  //Later when implement real location
  // List<Map<DateTime, (double, double)>> locations = [];
  List<(double latitude, double longitude)> locations;

  HistoricLocationsState({
    this.locations = const [],
  });

  int get howManyLocationsUntilNow => locations.length;

  HistoricLocationsState copyWith({
    List<(double latitude, double longitude)>? locations,
  }) {
    return HistoricLocationsState(
      locations: locations ?? this.locations,
    );
  }

  @override
  List<Object?> get props => [locations];
}
