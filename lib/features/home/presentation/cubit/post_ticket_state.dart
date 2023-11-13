part of 'post_ticket_cubit.dart';

@freezed
class PostTicketState with _$PostTicketState {
  const factory PostTicketState.initial() = _Initial;
  const factory PostTicketState.loading() = _Loading;
  const factory PostTicketState.success() = _Success;
  const factory PostTicketState.error() = _Error;
}
