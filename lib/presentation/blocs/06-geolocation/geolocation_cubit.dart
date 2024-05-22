import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'geolocation_state.dart';

class GeolocationCubit extends Cubit<GeolocationState> {
  GeolocationCubit() : super(const GeolocationState());

  Future<void> checkStatus() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();

    var permissionGranted = await Geolocator.checkPermission();

    if (permissionGranted == LocationPermission.denied) {
      permissionGranted = await Geolocator.requestPermission();
    }
    emit(state.copyWith(
      serviceEnabled: serviceEnabled,
      permissionGranted: permissionGranted == LocationPermission.whileInUse ||
          permissionGranted == LocationPermission.always,
    ));
  }

  Future<void> watchUserLocation() async {
    if (state.permissionGranted == false || state.serviceEnabled == false) {
      await checkStatus();
    }
    const locationSettins = LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation, distanceFilter: 10);

    Geolocator.getPositionStream(locationSettings: locationSettins)
        .listen((event) {
          //Ya conocemos la ubicacion
      final newLocation = (event.latitude, event.longitude);
      emit(state.copyWith(location: (event.latitude, event.longitude)));
    });
  }
}
