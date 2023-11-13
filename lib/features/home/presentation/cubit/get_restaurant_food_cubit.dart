import 'dart:async';

import 'package:Foodlify/app/widgets/app_loader.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/sl/sl_container.dart';
import 'package:Foodlify/core/utils/flushbar_notification.dart';
import 'package:Foodlify/features/home/domain/entities/restaurant_food_entity.dart';
import 'package:Foodlify/features/home/domain/usecases/get_restaurant_food_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_restaurant_food_cubit.freezed.dart';
part 'get_restaurant_food_state.dart';

class GetRestaurantFoodCubit extends Cubit<GetRestaurantFoodState> {
  GetRestaurantFoodCubit({
    required this.getFoodByRestauranntUsecase,
  }) : super(
          const GetRestaurantFoodState.initial(),
        );
  final GetFoodByRestaurantUsecase getFoodByRestauranntUsecase;
  List<RestaurantFoodEntity>? foodByRetaurant;

  Future<void> getFoodByRestaurant(
    BuildContext context, {
    required String id,
    required String location,
  }) async {
    unawaited(sl<AppLoadingPopup>().show(context));
    // emit(const GetRestaurantFoodState.loading());

    final response = await getFoodByRestauranntUsecase(
      RestaurantFoodParams(
        id: id,
        location: location,
      ),
    );
    response.fold((l) {
      Navigator.pop(context);
      FlushbarNotification.showSuccessMessage(
        context,
        message: FailureToMessage.mapFailureToMessage(l),
      );
      emit(
        GetRestaurantFoodState.erroe(
          error: FailureToMessage.mapFailureToMessage(l),
        ),
      );
    }, (r) {
      Navigator.pop(context);
      foodByRetaurant = r;
      emit(GetRestaurantFoodState.success(restaurantsFood: r));
    });
  }
}
