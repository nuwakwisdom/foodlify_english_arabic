import 'package:Foodlify/core/errors/failure.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/entities/carts_entity.dart';
import 'package:Foodlify/features/home/domain/usecases/get_cart_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_cart_cubit.freezed.dart';
part 'get_cart_state.dart';

class GetCartCubit extends Cubit<GetCartState> {
  GetCartCubit({
    required this.getCartUsecase,
  }) : super(
          const GetCartState.initial(),
        );
  final GetCartUsecase getCartUsecase;
  NewCartEntity? carts;
  Future<void> getCarts(BuildContext context) async {
    //emit(const GetCartState.loading());

    final response = await getCartUsecase(NoParams());
    response.fold((l) {
      emit(
        GetCartState.error(
          error: FailureToMessage.mapFailureToMessage(l),
        ),
      );
    }, (r) {
      carts = r;
      emit(
        GetCartState.success(
          carts: r,
        ),
      );
    });
  }
}
