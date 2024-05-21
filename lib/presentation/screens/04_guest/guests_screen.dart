import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuestsScreen extends StatelessWidget {
  const GuestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc - GuestBloc'),
      ),
      body: _TodoView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context
              .read<GuestsBloc>()
              .add(AddGuestEvent(name: RandomGenerator.getRandomName()));
        },
      ),
    );
  }
}

class _TodoView extends StatelessWidget {
  _TodoView();

  @override
  Widget build(BuildContext context) {
    final guestBloc = context.watch<GuestsBloc>();
    return Column(
      children: [
        const ListTile(
          title: Text('Listado de invitados'),
          subtitle: Text('Estas son las personas a invitar a la fiesta'),
        ),

        SegmentedButton(
          segments: const [
            ButtonSegment(
                value: GuestFilter.all,
                icon: SizedBox(
                    width: 50,
                    child: Text(
                      'Todos',
                      style: TextStyle(fontSize: 12),
                    ))),
            ButtonSegment(
                value: GuestFilter.invited,
                icon: SizedBox(
                    width: 54,
                    child: Text('Invitados', style: TextStyle(fontSize: 12)))),
            ButtonSegment(
                value: GuestFilter.notInvited,
                icon: SizedBox(
                    width: 50,
                    child:
                        Text('No invitados', style: TextStyle(fontSize: 12)))),
          ],
          selected: <GuestFilter>{guestBloc.state.filter},
          onSelectionChanged: (value) {
            guestBloc.add(SetCustomFilterEvent(guestFilter: value.first));
          },
        ),
        const SizedBox(height: 5),

        /// Listado de personas a invitar
        Expanded(
          child: ListView.builder(
            itemCount: guestBloc.state.howManyFiltered,
            itemBuilder: (context, index) {
              final guest = guestBloc.state.filteredGuests[index];

              return SwitchListTile(
                  title:
                      Text(guestBloc.state.filteredGuests[index].description),
                  value: guestBloc.state.filteredGuests[index].done,
                  onChanged: (value) {
                    final id = guestBloc.state.filteredGuests[index].id;
                    guestBloc.add(ModifyGuestInvitationEvent(
                        guessId: guest.id));
                  });
            },
          ),
        )
      ],
    );
  }
}
