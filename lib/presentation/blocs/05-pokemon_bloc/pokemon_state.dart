part of 'pokemon_bloc.dart';

class PokemonState extends Equatable {
  PokemonState({
    this.pokemons = const <int, Pokemon>{},
  });

 Map<int, Pokemon> pokemons;

  @override
  List<Object?> get props => [pokemons];

  PokemonState copyWith({
    Map<int, Pokemon>? pokemons,
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
