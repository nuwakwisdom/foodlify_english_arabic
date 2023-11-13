import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/core/utils/flushbar_notification.dart';
import 'package:Foodlify/features/home/domain/entities/restaurant_entitties.dart';
import 'package:Foodlify/features/home/domain/usecases/get_restaurant_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_restaurant_cubit.freezed.dart';
part 'get_restaurant_state.dart';

class GetRestaurantCubit extends Cubit<GetRestaurantState> {
  GetRestaurantCubit({
    required this.getRestaurantUsecase,
  }) : super(const GetRestaurantState.initial());
  final GetRestaurantUsecase getRestaurantUsecase;
  List<RestaurantEntity>? restaurant;
  Future<void> getRestaurant(BuildContext context) async {
    emit(const GetRestaurantState.loading());

    final response = await getRestaurantUsecase(
      NoParams(),
    );
    response.fold((l) {
      FlushbarNotification.showErrorMessage(
        context,
        message: FailureToMessage.mapFailureToMessage(l),
      );
      emit(
        GetRestaurantState.error(
          error: FailureToMessage.mapFailureToMessage(l),
        ),
      );
    }, (r) {
      emit(
        GetRestaurantState.success(
          restaurant: r,
        ),
      );
    });
  }
}
