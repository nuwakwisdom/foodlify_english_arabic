part of 'live_tracking_bloc.dart';

abstract class LiveTrackingState extends Equatable {
  const LiveTrackingState();  

  @override
  List<Object> get props => [];
}
class LiveTrackingInitial extends LiveTrackingState {}
