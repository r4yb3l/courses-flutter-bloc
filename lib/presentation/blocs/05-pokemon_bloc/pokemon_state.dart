part of 'pokemon_bloc.dart';

class PokemonState extends Equatable {
  PokemonState({
    // this.pokemons = const <int, Pokemon>{},
    this.pokemons = const <int, String>{},
  });

 // Map<int, Pokemon> pokemons;
Map<int, String> pokemons;

  @override
  List<Object?> get props => [];

  // PokemonState copyWith({
  //   Map<int, Pokemon>? pokemons,
  // }) {
  //   return PokemonState(
  //     pokemons: pokemons ?? this.pokemons,
  //   );
  // }

  PokemonState copyWith({
    Map<int, String>? pokemons,
  }) {
    return PokemonState(
      pokemons: pokemons ?? this.pokemons,
    );
  }
}

final class PokemonInitial extends PokemonState {
  @override
  List<Object> get props => [pokemons];
}
