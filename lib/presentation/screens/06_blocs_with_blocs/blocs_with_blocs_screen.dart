import 'package:blocs_app/config/helpers/location_information.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/location.dart';

class BlocsWithBlocsScreen extends StatelessWidget {
  const BlocsWithBlocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final historicLocationBloc = context.read<HistoricLocationsBloc>();
    final locationOrigin = historicLocationBloc.state.locations[0];
    double latitude = locationOrigin.$1;
    double longitude = locationOrigin.$2;
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'Locations: ${historicLocationBloc.state.howManyLocationsUntilNow}'
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Touch a location to see additional information'),
              Expanded(
                child: ListView.builder(
                  itemCount: historicLocationBloc.state.howManyLocationsUntilNow,
                    itemBuilder: (context, index) => InkWell(
                      onTap: (){
                        showLocationDialog(context, latitude, longitude);
                      },
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(historicLocationBloc.state.locations[index].toString()),
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          )
        ));
  }
  void showLocationDialog(BuildContext context, double latitude, double longitude) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Location Information"),
          content: FutureBuilder(
            future: LocationInformation.getLocationInformation(latitude: latitude, longitude: longitude),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Icon(Icons.error_outline);
              } else if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      snapshot.data.flagUrl,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(snapshot.data.country, style: TextStyle(
                            fontSize: 30,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold
                          ),textAlign: TextAlign.center,),
                        ),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on_outlined),
                        Expanded(
                          child: Text(
                              snapshot.data.city,
                              style: TextStyle(
                              fontSize: 20,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold
                          )),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return Text("No data available");
              }
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}
