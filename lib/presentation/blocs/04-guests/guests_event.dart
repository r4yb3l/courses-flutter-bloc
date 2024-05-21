part of 'guests_bloc.dart';

sealed class GuestsEvent extends Equatable {
  const GuestsEvent();
}

final class SetAllFilterEvent extends GuestsEvent {
  @override
  List<Object?> get props => [];
}

final class SetInvitedFilterEvent extends GuestsEvent {
  @override
  List<Object?> get props => [];
}

final class SetNotInvitedFilterEvent extends GuestsEvent {
  @override
  List<Object?> get props => [];
}

final class SetCustomFilterEvent extends GuestsEvent {
  final GuestFilter guestFilter;

  const SetCustomFilterEvent({required this.guestFilter});

  @override
  List<Object?> get props => [];
}

final class AddGuestEvent extends GuestsEvent {
  final String name;

  const AddGuestEvent({required this.name});

  @override
  List<Object?> get props => [name];
}


final class ModifyGuestInvitationEvent extends GuestsEvent{

  final String guessId;

  const ModifyGuestInvitationEvent({required this.guessId});

  @override
  List<Object?> get props => [guessId];

}