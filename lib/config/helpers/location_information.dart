import 'package:dio/dio.dart';

import '../../domain/entities/location.dart';

class LocationInformation {
  static Future<Location>  getLocationInformation(
      {required double latitude, required double longitude}) async {
    final dio = Dio();
    try {
      final locationInformation = await dio.get(
          'https://us1.locationiq.com/v1/reverse?key=pk.a5bf2459dac8287f4c97edceeee689e9&lat=$latitude&lon=$longitude&format=json');
      if (locationInformation.statusCode == 200) {
        print('getted information');
        final locationData = locationInformation.data;
        String countryCode = locationData['address']['country_code'];
        var countryFlag = await getCountryFlag(countryCode: countryCode);
        print('getted flag');
        Location location = Location(
          country: locationData['address']['country'],
          city: locationData['address']['state'],
          flagUrl: countryFlag,
        );
        return location;
      } else {
        print(locationInformation.statusCode);
        print(locationInformation.statusMessage);
      }

      return Location(country: null, city: null, flagUrl: null);
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to fetch location information');
    }
  }

  static Future<String?> getCountryFlag({required String countryCode}) async {
    var dio = Dio();
    try {
      print('awaiting for flag');
      // // Response response =
      // //     await dio.get('https://restcountries.com/v3.1/alpha/$countryCode');
      // if (response.statusCode == 200) {
      //   print('got flag');
      //   var data = response.data;
      //   var flagUrl = data[0]['flags']['png'];
      //   return flagUrl;
      // } else {
      //   return null;
      // }
      String url = 'https://flagcdn.com/224x168/$countryCode.png';
      return url;
    } catch (e) {
      print('Error al realizar la petición: $e');
    }
  }
}
