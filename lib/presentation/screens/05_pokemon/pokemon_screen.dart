import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  int pokemonId = 1;

  @override
  Widget build(BuildContext context) {
    final pokemonBloc = context.read<PokemonBloc>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Pokemon Id: ${pokemonId.toString()}'),
        ),
        body: FutureBuilder(
            future: pokemonBloc.fetchPokemon(pokemonId),
            initialData: pokemonBloc.state.pokemons[pokemonId] ?? 'Loading...',
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Something went wrong!'));
              }
              return Column(
                children: [
                  Image.network(
                    pokemonBloc.state.pokemons[pokemonId]!.pictureUrl,
                    scale: 0.2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${pokemonBloc.state.pokemons[pokemonId]!.name.substring(0, 1).toUpperCase() + pokemonBloc.state.pokemons[pokemonId]!.name.substring(1)}',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${pokemonBloc.state.pokemons[pokemonId]!.type.substring(0, 1).toUpperCase() + pokemonBloc.state.pokemons[pokemonId]!.type.substring(1)}',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: pokemonBloc.state.pokemons[pokemonId]!.type ==
                                    'grass'
                                ? Colors.green
                                : pokemonBloc.state.pokemons[pokemonId]!.type ==
                                        'fire'
                                    ? Colors.red
                                    : pokemonBloc.state.pokemons[pokemonId]!
                                                .type ==
                                            'water'
                                        ? Colors.lightBlueAccent
                                        : pokemonBloc.state.pokemons[pokemonId]!
                                                    .type ==
                                                'electric'
                                            ? Colors.yellow
                                            : pokemonBloc
                                                        .state
                                                        .pokemons[pokemonId]!
                                                        .type ==
                                                    'bug'
                                                ? Colors.brown
                                                : pokemonBloc.state.pokemons[pokemonId]!.type ==
                                                        'normal'
                                                    ? Colors.black
                                                    : pokemonBloc
                                                                .state
                                                                .pokemons[
                                                                    pokemonId]!
                                                                .type ==
                                                            'poison'
                                                        ? Colors.purple
                                                        : pokemonBloc
                                                                    .state
                                                                    .pokemons[
                                                                        pokemonId]!
                                                                    .type ==
                                                                'ground'
                                                            ? Colors.brown
                                                            : pokemonBloc
                                                                        .state
                                                                        .pokemons[pokemonId]!
                                                                        .type ==
                                                                    'fairy'
                                                                ? Colors.pinkAccent
                                                                : pokemonBloc.state.pokemons[pokemonId]!.type == 'fighting'
                                                                    ? Colors.orange
                                                                    : pokemonBloc.state.pokemons[pokemonId]!.type == 'psychic'
                                                                        ? Colors.pink
                                                                        : pokemonBloc.state.pokemons[pokemonId]!.type == 'rock'
                                                                            ? Colors.grey
                                                                            : pokemonBloc.state.pokemons[pokemonId]!.type == 'ghost'
                                                                                ? Colors.deepPurple
                                                                                : pokemonBloc.state.pokemons[pokemonId]!.type == 'ice'
                                                                                    ? Colors.cyan
                                                                                    : pokemonBloc.state.pokemons[pokemonId]!.type == 'dragon'
                                                                                        ? Colors.indigo
                                                                                        : pokemonBloc.state.pokemons[pokemonId]!.type == 'dark'
                                                                                            ? Colors.black
                                                                                            : pokemonBloc.state.pokemons[pokemonId]!.type == 'steel'
                                                                                                ? Colors.grey
                                                                                                : pokemonBloc.state.pokemons[pokemonId]!.type == 'flying'
                                                                                                    ? Colors.blue
                                                                                                    : Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.scale_outlined),
                          Text(
                              'Peso: ${(pokemonBloc.state.pokemons[pokemonId]!.weight * 0.220462).toStringAsFixed(2)} lbs'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.height),
                          Text(
                              'Altura: ${pokemonBloc.state.pokemons[pokemonId]!.height} ft'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        pokemonBloc.state.pokemons[pokemonId]!.baseExperience <
                                65
                            ? Icons.looks_one_outlined
                            : pokemonBloc.state.pokemons[pokemonId]!
                                        .baseExperience <
                                    165
                                ? Icons.looks_two_outlined
                                : Icons.looks_3_outlined,
                        color: pokemonBloc
                                    .state.pokemons[pokemonId]!.baseExperience <
                                65
                            ? Colors.pinkAccent
                            : pokemonBloc.state.pokemons[pokemonId]!
                                        .baseExperience <
                                    165
                                ? Colors.yellow
                                : Colors.green,
                      ),
                      Icon(Icons.star_border_outlined),
                      Text(
                          'Base Experience: ${pokemonBloc.state.pokemons[pokemonId]!.baseExperience}'),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.looks_one_outlined,
                        color: Colors.pinkAccent,
                      ),
                      Icon(Icons.star_border_outlined),
                      Text('Weak pokemon', style: TextStyle(fontSize: 12))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.looks_two_outlined,
                        color: Colors.yellow,
                      ),
                      Icon(Icons.star_border_outlined),
                      Text(
                        'Normal pokemon',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.looks_3_outlined,
                        color: Colors.green,
                      ),
                      Icon(Icons.star_border_outlined),
                      Text('Strong pokemon', style: TextStyle(fontSize: 12))
                    ],
                  )
                ],
              );
            }),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'btn-add',
              child: const Icon(Icons.plus_one),
              onPressed: () {
                setState(() {
                  pokemonId++;
                });
              },
            ),
            const SizedBox(height: 15),
            FloatingActionButton(
              heroTag: 'btn-minus',
              child: const Icon(Icons.exposure_minus_1),
              onPressed: () {
                setState(() {
                  if (pokemonId <= 0) {
                    return;
                  }
                  pokemonId--;
                });
              },
            ),
          ],
        ));
  }
}
