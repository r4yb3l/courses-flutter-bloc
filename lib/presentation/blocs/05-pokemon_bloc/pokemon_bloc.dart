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
        final newPokemons = Map<int, Pokemon>.from(state.pokemons);
        newPokemons[event.pokemon.id] = event.pokemon;
        emit(state.copyWith(pokemons: newPokemons));
      },
    );
  }

  Future<Pokemon> fetchPokemon(int id) async {
    if (state.pokemons.containsKey(id)) {
      return state.pokemons[id]!;
    }
    try {
      final pokemon = await PokemonInformation.getPokemon(id);
      add(PokemonAdded(pokemon));
      return pokemon;
    } on Exception catch (e) {
      throw Exception('Failed to fetch pokemon name');
    }
  }
}
