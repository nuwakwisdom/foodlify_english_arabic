// ignore_for_file: one_member_abstracts

import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<dynamic> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
