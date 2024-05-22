import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocsWithBlocsScreen extends StatelessWidget {
  const BlocsWithBlocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final historicLocationBloc = context.watch<HistoricLocationsBloc>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Locations: ${historicLocationBloc.state.howManyLocationsUntilNow}'),
        ),
        body: ListView.builder(
          itemCount: historicLocationBloc.state.howManyLocationsUntilNow,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${
              historicLocationBloc.state.locations[index].toString()
              }'),
              //TODO here add the country information
              // subtitle: Text('subtitle'),
              //TODO here add the flag
              // trailing: ,
              subtitle: Text('subtitle'),
              //TODO here add the flag
              // trailing: ,
            );
          },
        ));
  }
}
