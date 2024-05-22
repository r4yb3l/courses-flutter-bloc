import 'package:equatable/equatable.dart';

class Location extends Equatable{
  final String? country;
  final String? city;
  final String? flagUrl;

  Location({required this.country, required this.city, required this.flagUrl});

  @override
  List<Object?> get props => [country, city, flagUrl];

}