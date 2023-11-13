import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/entities/orders_entity.dart';
import 'package:Foodlify/features/home/domain/usecases/get_order_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_orders_cubit.freezed.dart';
part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  GetOrdersCubit({
    required this.getOrdersUsecase,
  }) : super(const GetOrdersState.initial());
  final GetOrderstUsecase getOrdersUsecase;
  List<OrdersEntity>? orders;
  Future<void> getOrders(
    BuildContext context,
  ) async {
    emit(const GetOrdersState.loading());

    final response = await getOrdersUsecase(NoParams());
    response.fold((l) {
      /*  FlushbarNotification.showErrorMessage(
        context,
        message: FailureToMessage.mapFailureToMessage(l),
      );*/
      emit(
        const GetOrdersState.error(),
      );
    }, (r) {
      orders = r;
      emit(
        const GetOrdersState.success(),
      );
    });
  }
}
