import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/utils/flushbar_notification.dart';
import 'package:Foodlify/features/home/domain/usecases/remove_food_from_cart_usecase.dart';

part 'remove_food_from_cart_state.dart';
part 'remove_food_from_cart_cubit.freezed.dart';

class RemoveFoodFromCartCubit extends Cubit<RemoveFoodFromCartState> {
  RemoveFoodFromCartCubit({
    required this.removeFoodFromCartUsecase,
  }) : super(const RemoveFoodFromCartState.initial());
  final RemoveFoodFromCartUsecase removeFoodFromCartUsecase;

  Future<void> removeFoodFromCart(
    BuildContext context, {
    required String foodId,
  }) async {
    emit(const RemoveFoodFromCartState.loading());

    final response = await removeFoodFromCartUsecase(
      RemoveFoodFromCartParams(foodId: foodId),
    );

    response.fold((l) {
      FlushbarNotification.showErrorMessage(
        context,
        message: FailureToMessage.mapFailureToMessage(l),
      );
      emit(
        const RemoveFoodFromCartState.error(),
      );
    }, (r) {
      emit(
        const RemoveFoodFromCartState.success(),
      );
    });
  }
}
