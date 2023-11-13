// ignore_for_file: non_constant_identifier_names, inference_failure_on_function_invocation

import 'dart:async';

import 'package:Foodlify/app/widgets/app_loader.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:Foodlify/core/sl/sl_container.dart';
import 'package:Foodlify/core/utils/flushbar_notification.dart';
import 'package:Foodlify/features/home/domain/usecases/order_cart_usecase.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_cart_cubit.dart';
import 'package:Foodlify/features/home/presentation/widgets/insufficient_fund_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_cart_cubit.freezed.dart';
part 'order_cart_state.dart';

class OrderCartCubit extends Cubit<OrderCartState> {
  OrderCartCubit({
    required this.orderCartUsecase,
  }) : super(const OrderCartState.initial());
  final OrderCartUsecase orderCartUsecase;
  Future<void> orderCart(
    BuildContext context, {
    required String cartId,
    required String address_id,
  }) async {
    unawaited(sl<AppLoadingPopup>().show(context));
    emit(const OrderCartState.loading());

    final response = await orderCartUsecase(
      OrderCartParams(cartId: cartId, address_id: address_id),
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
        const OrderCartState.error(),
      );
    }, (r) {
      Navigator.pop(context);
      Navigator.pop(context);
      FlushbarNotification.showSuccessMessage(
        context,
        message: 'Food Ordered',
      );
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteName.homeNav,
        (route) => false,
      );
      context.read<GetCartCubit>().carts = null;
      emit(
        const OrderCartState.success(),
      );
    });
  }
}
