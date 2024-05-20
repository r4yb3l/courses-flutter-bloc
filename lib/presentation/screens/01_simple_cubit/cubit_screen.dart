import 'package:blocs_app/config/helpers/random_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      body: Center(
        child: BlocBuilder<UsernameCubit, String>(
          builder: (context, state) {
            return Text(state, style: const TextStyle(fontSize: 14)); //state();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<UsernameCubit>()
              .updateUsername(RandomGenerator.getRandomName());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
