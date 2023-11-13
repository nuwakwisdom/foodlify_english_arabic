import 'dart:async';

import 'package:Foodlify/app/widgets/app_loader.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:Foodlify/core/sl/sl_container.dart';
import 'package:Foodlify/core/utils/flushbar_notification.dart';
import 'package:Foodlify/features/home/domain/usecases/add_to_cart_usecase.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_cart_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_to_cart_cubit.freezed.dart';
part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit({
    required this.addToCartUsecase,
  }) : super(
          const AddToCartState.initial(),
        );

  final AddToCartUsecase addToCartUsecase;
  Future<void> addToCart(
    BuildContext context, {
    required String foodId,
    required int qty,
  }) async {
    unawaited(sl<AppLoadingPopup>().show(context));
    emit(const AddToCartState.loading());

    final response = await addToCartUsecase(
      AddToCartParams(foodId: foodId, qty: qty),
    );
    response.fold((l) {
      Navigator.pop(context);
      Navigator.pushNamed(context, RouteName.loginScreen);
      emit(
        AddToCartState.error(error: FailureToMessage.mapFailureToMessage(l)),
      );
    }, (r) {
      Navigator.pop(context);
      FlushbarNotification.showSuccessMessage(
        context,
        message: 'Food Successfully Added To Cart',
      );
      context.read<GetCartCubit>().getCarts(context);
      emit(const AddToCartState.added());
    });
  }
}
