part of 'pokemon_bloc.dart';

sealed class PokemonEvent extends Equatable {
  const PokemonEvent();
}

class PokemonRequested extends PokemonEvent {
  PokemonRequested(this.id);

  final int id;

  @override
  List<Object> get props => [];
}

// class PokemonAdded extends PokemonEvent {
//   final Pokemon pokemon;
//
//   PokemonAdded(this.pokemon);
//
//   @override
//   List<Object> get props => [pokemon];
// }

class PokemonAdded extends PokemonEvent {
  final int id;
  final String pokemonName;

  PokemonAdded(this.id, this.pokemonName);

  @override
  List<Object> get props => [pokemonName];
}
