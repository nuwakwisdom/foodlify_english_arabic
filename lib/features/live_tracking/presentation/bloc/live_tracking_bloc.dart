import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'live_tracking_event.dart';
part 'live_tracking_state.dart';

class LiveTrackingBloc extends Bloc<LiveTrackingEvent, LiveTrackingState> {
  LiveTrackingBloc() : super(LiveTrackingInitial()) {
    on<LiveTrackingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
