import 'dart:async';

import 'package:Foodlify/app/widgets/app_loader.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/sl/sl_container.dart';
import 'package:Foodlify/core/utils/flushbar_notification.dart';
import 'package:Foodlify/features/home/domain/usecases/add_cart_food_count.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_cart_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_cart_food_count_cubit.freezed.dart';
part 'add_cart_food_count_state.dart';

class AddCartFoodCountCubit extends Cubit<AddCartFoodCountState> {
  AddCartFoodCountCubit({
    required this.addCartFoodCountUsecase,
  }) : super(const AddCartFoodCountState.initial());
  final AddCartFoodCountUsecase addCartFoodCountUsecase;

  Future<void> addCartFoodCount(
    BuildContext context, {
    required String foodId,
    required int quantity,
  }) async {
    unawaited(sl<AppLoadingPopup>().show(context));
    emit(const AddCartFoodCountState.loading());

    final response = await addCartFoodCountUsecase(
      AddCartFoodCountParams(
        foodId: foodId,
        quantity: quantity,
      ),
    );
    response.fold((l) {
      Navigator.pop(context);
      FlushbarNotification.showErrorMessage(
        context,
        message: FailureToMessage.mapFailureToMessage(l),
      );
      emit(
        const AddCartFoodCountState.error(),
      );
    }, (r) {
      context.read<GetCartCubit>().getCarts(context);
      Navigator.pop(context);
      emit(
        const AddCartFoodCountState.success(),
      );
    });
  }
}
