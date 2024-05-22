import 'package:dio/dio.dart';

import '../../domain/entities/pokemon.dart';

class PokemonInformation {
  static Future<String> getPokemonName(int pokemonId) async {
    final dio = Dio();
    await Future.delayed(const Duration(seconds: 2));

    try {
      final response =
          await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonId');

      return response.data['name'] ?? 'Nombre no se encontro';
    } catch (e) {
      return 'Nombre no pudo ser obtenido';
    }
  }

  static Future<Pokemon> getPokemon(int pokemonId) async {
    final dio = Dio();
    await Future.delayed(const Duration(seconds: 2));
    try {
      final response =
          await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonId');
      return Pokemon(
        id: response.data['id'],
        name: response.data['name'],
        baseExperience: response.data['base_experience'],
        height: response.data['height'],
        weight: response.data['weight'],
        pictureUrl: response.data['sprites']['front_default'],
        type: response.data['types'][0]['type']['name'],
      );
    } catch (e) {
      rethrow;
    }
  }
}
