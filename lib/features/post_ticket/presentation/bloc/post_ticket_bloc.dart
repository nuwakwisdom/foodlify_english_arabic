import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_ticket_event.dart';
part 'post_ticket_state.dart';

class PostTicketBloc extends Bloc<PostTicketEvent, PostTicketState> {
  PostTicketBloc() : super(PostTicketInitial()) {
    on<PostTicketEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
