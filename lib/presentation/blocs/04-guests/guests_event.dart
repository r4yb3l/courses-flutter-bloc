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
