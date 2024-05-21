import 'package:bloc/bloc.dart';
import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

part 'guests_event.dart';

part 'guests_state.dart';

const uuid = Uuid();

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc()
      : super(GuestsState(
          guests: [
            Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null,
            ),
            Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null,
            ),
            Todo(
                id: uuid.v4(),
                description: RandomGenerator.getRandomName(),
                completedAt: DateTime.now()),
          ],
        )) {
    on<SetInvitedFilterEvent>(
      (event, emit) {
        emit(state.copyWith(filter: GuestFilter.invited));
      },
    );

    on<SetNotInvitedFilterEvent>(
      (event, emit) {
        emit(state.copyWith(filter: GuestFilter.notInvited));
      },
    );

    on<SetAllFilterEvent>(
      (event, emit) {
        emit(state.copyWith(filter: GuestFilter.all));
      },
    );

    on<SetCustomFilterEvent>((event, emit) {
      emit(state.copyWith(filter: event.guestFilter));
    });
  }
}
