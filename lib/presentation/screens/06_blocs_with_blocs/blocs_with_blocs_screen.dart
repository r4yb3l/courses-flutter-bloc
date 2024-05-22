import 'package:blocs_app/presentation/blocs/06-geolocation/geolocation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocsWithBlocsScreen extends StatelessWidget {
  const BlocsWithBlocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final geolocationCubit = context.watch<GeolocationCubit>();
    final location = geolocationCubit.state.location;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blocs con Blocs'),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        //Poner aqui las ubicaciones en una lista
      },)
    );
  }
}
