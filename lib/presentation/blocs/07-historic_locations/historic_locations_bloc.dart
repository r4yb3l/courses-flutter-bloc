import 'package:bloc/bloc.dart';
import 'package:blocs_app/config/helpers/location_information.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/location.dart';

part 'historic_locations_event.dart';

part 'historic_locations_state.dart';

class HistoricLocationsBloc
    extends Bloc<HistoricLocationsEvent, HistoricLocationsState> {
  HistoricLocationsBloc() : super(HistoricLocationsState()) {
    on<NewLocationEvent>(_onNewLocationHandler);

  }

  void onNewLocation((double latitude, double longitude) location) {
    add(NewLocationEvent(location));
  }

  void _onNewLocationHandler(NewLocationEvent event,
      Emitter<HistoricLocationsState> emit) {
    emit(state.copyWith(locations: [...state.locations, event.location]));
  }

}
