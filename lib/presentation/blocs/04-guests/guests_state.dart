part of 'guests_bloc.dart';

enum GuestFilter { all, invited, notInvited }

sealed class GuestsState extends Equatable {
  final GuestFilter filter;
  final List<Todo> guests;

  const GuestsState({
    this.filter = GuestFilter.all,
    this.guests = const [],
  });
}

final class GuestsInitial extends GuestsState {
  @override
  List<Object> get props => [filter, guests];
}
