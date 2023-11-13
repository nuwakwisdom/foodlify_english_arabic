// ignore_for_file: avoid_print, lines_longer_than_80_chars

import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/account/domain/entities/delivery_address_entities.dart';
import 'package:Foodlify/features/account/domain/usecases/get_address_usecase.dart';
import 'package:Foodlify/features/account/domain/usecases/get_default_address_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_address_cubit.freezed.dart';
part 'get_address_state.dart';

class GetAddressCubit extends Cubit<GetAddressState> {
  GetAddressCubit({
    required this.getAddressUsecase,
    required this.getDeliveryAddressUsecase,
  }) : super(const GetAddressState.initial());
  final GetAddressUsecase getAddressUsecase;
  final GetDefaultAdressUsecase getDeliveryAddressUsecase;
  List<DeliveryAddressEntity>? deliveryAddresses;
  DeliveryAddressEntity? defaultDelliveryAddress;
  Future<void> getDeliveryAddress(
    BuildContext context,
  ) async {
    final response = await getAddressUsecase(NoParams());
    response.fold((l) {
      emit(const GetAddressState.error());
    }, (r) {
      deliveryAddresses = r;
      print(r);
      emit(
        GetAddressState.success(
          deliveryAddresses: r,
          defaultDelliveryAddress: defaultDelliveryAddress ??
              const DeliveryAddressEntity(
                address: '',
                address_id: '',
                contact_name: '',
                phone_number: '',
              ),
        ),
      );
    });
  }

  Future<void> getDefaultAdreess(
    BuildContext context,
  ) async {
    final response = await getDeliveryAddressUsecase(NoParams());
    response.fold((l) {
      emit(const GetAddressState.error());
    }, (r) {
      defaultDelliveryAddress = r;
      print(r);
      emit(
        GetAddressState.success(
          deliveryAddresses: deliveryAddresses ?? [],
          defaultDelliveryAddress: r,
        ),
      );
    });
  }
}
