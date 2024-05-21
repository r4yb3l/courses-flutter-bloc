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
      : super(
          GuestsState(
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
          ),
        ) {
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

    void _addGuestHandler(AddGuestEvent event, Emitter<GuestsState> emit) {
      final newPerson = Todo(
        id: uuid.v4(),
        description: event.name,
        completedAt: null,
      );

      emit(state.copyWith(
        guests: List.from(state.guests)..add(newPerson),
      ));
    }

    on<AddGuestEvent>(_addGuestHandler);

    void _modifyGuestInvitationHandler(
        ModifyGuestInvitationEvent event, Emitter<GuestsState> emit) {
      final now = DateTime.now();
      final guests = state.guests
          .map(
            (e) => e.id == event.guessId
                ? e.copyWith(completedAt: e.completedAt == null ? now : null)
                : e,
          )
          .toList();

      emit(state.copyWith(guests: guests));
    }

    on<ModifyGuestInvitationEvent>(_modifyGuestInvitationHandler);
  }
}
