import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object> get props => [];
}

class NoInternetFailure extends Failure {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}

class CacheFailure extends Failure {
  @override
  List<Object> get props => [];
}

class NoDataFailure extends Failure {
  @override
  List<Object> get props => [];
}

class NullFailure extends Failure {
  @override
  List<Object> get props => [];
}

class UnknownFailure extends Failure {
  @override
  List<Object> get props => [];
}

class TimoutFailure extends Failure {
  @override
  List<Object> get props => [];
}

class FailureToMessage {
  static String mapFailureToMessage(Failure failure) {
    var message = 'An Error occurred, please try again';
    if (failure is NoInternetFailure) {
      message = 'Please check your internet connection and try again';
    } else if (failure is ServerFailure) {
      message = failure.message;
    } else if (failure is CacheFailure || failure is NoDataFailure) {
      message = 'Data not found, please login again';
    } else if (failure is TimoutFailure) {
      message = 'Connection timout, please try again';
    }
    return message;
  }
}
