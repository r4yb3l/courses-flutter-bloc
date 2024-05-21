import 'package:bloc/bloc.dart';
import 'package:blocs_app/config/config.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/pokemon.dart';

part 'pokemon_event.dart';

part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonAdded>(
      (event, emit) {
        final newPokemons = Map<int, String>.from(state.pokemons);
        newPokemons[event.id] = event.pokemonName;
        emit(state.copyWith(pokemons: newPokemons));
      },
    );
  }

  Future<String> fetchPokemon(int id) async {
    try {
      final pokemonName = await PokemonInformation.getPokemonName(id);
      add(PokemonAdded(id, pokemonName));
      return pokemonName;
    } on Exception catch (e) {
      throw Exception('Failed to fetch pokemon name');
    }
  }
}
