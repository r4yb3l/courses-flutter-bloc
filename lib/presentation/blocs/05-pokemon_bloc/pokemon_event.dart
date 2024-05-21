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

class PokemonAdded extends PokemonEvent {
  final Pokemon pokemon;

  PokemonAdded(this.pokemon);

  @override
  List<Object> get props => [pokemon];
}
