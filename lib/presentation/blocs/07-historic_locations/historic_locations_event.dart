part of 'historic_locations_bloc.dart';

sealed class HistoricLocationsEvent extends Equatable {
  const HistoricLocationsEvent();
}

class NewLocationEvent extends HistoricLocationsEvent {
  final (double latitude, double longitude) location;

  const NewLocationEvent(this.location);

  @override
  List<Object> get props => [location];
}