import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Foodlify/app/widgets/app_loader.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/sl/sl_container.dart';
import 'package:Foodlify/core/utils/flushbar_notification.dart';
import 'package:Foodlify/features/home/domain/usecases/reduce_cart_food_count_model.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_cart_cubit.dart';
import 'package:provider/provider.dart';

part 'reduce_cart_food_count_state.dart';
part 'reduce_cart_food_count_cubit.freezed.dart';

class ReduceCartFoodCountCubit extends Cubit<ReduceCartFoodCountState> {
  ReduceCartFoodCountCubit({required this.reduceCartFoodUsecase})
      : super(const ReduceCartFoodCountState.initial());
  final ReduceCartFoodCountUsecase reduceCartFoodUsecase;
  Future<void> reduceCartFoodCount(
    BuildContext context, {
    required String foodId,
    required int quantity,
  }) async {
    unawaited(sl<AppLoadingPopup>().show(context));
    emit(const ReduceCartFoodCountState.loadingz());

    final response = await reduceCartFoodUsecase(ReduceCartFoodCountParams(
      foodId: foodId,
      quantity: quantity,
    ));
    response.fold((l) {
      Navigator.pop(context);
      FlushbarNotification.showErrorMessage(
        context,
        message: FailureToMessage.mapFailureToMessage(l),
      );
      emit(
        const ReduceCartFoodCountState.error(),
      );
    }, (r) {
      context.read<GetCartCubit>().getCarts(context);
      Navigator.pop(context);

      emit(
        const ReduceCartFoodCountState.success(),
      );
    });
  }
}
