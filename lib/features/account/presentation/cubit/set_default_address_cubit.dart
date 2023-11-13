// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, unawaited_futures

import 'dart:async';

import 'package:Foodlify/app/widgets/app_loader.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/sl/sl_container.dart';
import 'package:Foodlify/core/utils/flushbar_notification.dart';
import 'package:Foodlify/features/account/domain/usecases/get_default_address_usecase.dart';
import 'package:Foodlify/features/account/domain/usecases/set_default_address_usecase.dart';
import 'package:Foodlify/features/account/presentation/cubit/get_address_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_default_address_state.dart';
part 'set_default_address_cubit.freezed.dart';

class SetDefaultAddressCubit extends Cubit<SetDefaultAddressState> {
  SetDefaultAddressCubit({
    required this.setDefaultAddressUsecase,
  }) : super(const SetDefaultAddressState.initial());
  final SetDefaultAddressUsecase setDefaultAddressUsecase;

  Future<void> setDefaultAddress(
    BuildContext context, {
    required String address_id,
  }) async {
    //emit(const GetCartState.loading());
    unawaited(sl<AppLoadingPopup>().show(context));
    final response = await setDefaultAddressUsecase(
      SetDefaultAddressParam(address_id: address_id),
    );
    response.fold(
      (l) {
        Navigator.pop(context);
        FlushbarNotification.showErrorMessage(
          context,
          message: FailureToMessage.mapFailureToMessage(l),
        );
        emit(const SetDefaultAddressState.error());
      },
      (r) async {
        await context.read<GetAddressCubit>().getDeliveryAddress(context);
        context.read<GetAddressCubit>().getDefaultAdreess(context);
        emit(const SetDefaultAddressState.success());
        Navigator.pop(context);
      },
    );
  }
}
