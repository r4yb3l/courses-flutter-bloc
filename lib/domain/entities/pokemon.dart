import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;
  final int height;
  final int baseExperience;
  final int weight;
  final String pictureUrl;
  final String type;

  Pokemon(
      {required this.id,
      required this.name,
      required this.height,
      required this.baseExperience,
      required this.weight,
      required this.pictureUrl,
      required this.type});

  @override
  List<Object?> get props => [id];
}
