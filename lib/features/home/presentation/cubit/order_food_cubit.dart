// ignore_for_file: non_constant_identifier_names, inference_failure_on_function_invocation

import 'dart:async';

import 'package:Foodlify/app/widgets/app_loader.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/navigators/route_name.dart';
import 'package:Foodlify/core/sl/sl_container.dart';
import 'package:Foodlify/core/utils/flushbar_notification.dart';
import 'package:Foodlify/features/home/domain/usecases/order_food_usecase.dart';
import 'package:Foodlify/features/home/presentation/widgets/insufficient_fund_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_food_cubit.freezed.dart';
part 'order_food_state.dart';

class OrderFoodCubit extends Cubit<OrderFoodState> {
  OrderFoodCubit({
    required this.orderFoodUsecase,
  }) : super(const OrderFoodState.initial());
  final OrderFoodUsercase orderFoodUsecase;

  Future<void> orderFood(
    BuildContext context, {
    required String foodId,
    required num amountPaid,
    required String address_id,
  }) async {
    unawaited(sl<AppLoadingPopup>().show(context));
    emit(const OrderFoodState.loading());

    final response = await orderFoodUsecase(
      OrderFoodParams(
        foodId: foodId,
        amountPaid: amountPaid,
        address_id: address_id,
      ),
    );
    response.fold((l) {
      Navigator.pop(context);
      Navigator.pop(context);
      FailureToMessage.mapFailureToMessage(l) == 'Insufficient Wallet Fund'
          ? showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => const InsufficientDialog(),
            )
          : FlushbarNotification.showErrorMessage(
              context,
              message: FailureToMessage.mapFailureToMessage(l),
            );
      emit(
        const OrderFoodState.error(),
      );
    }, (r) {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteName.homeNav,
        (route) => false,
      );
      FlushbarNotification.showSuccessMessage(
        context,
        message: 'Food Ordered',
      );
      emit(
        const OrderFoodState.success(),
      );
    });
  }
}
