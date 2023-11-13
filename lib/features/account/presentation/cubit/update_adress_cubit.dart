// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:Foodlify/app/widgets/app_loader.dart';
import 'package:Foodlify/core/sl/sl_container.dart';
import 'package:Foodlify/features/account/domain/usecases/edit_name_usecase.dart';
import 'package:Foodlify/features/account/domain/usecases/update_address_usecase.dart';
import 'package:Foodlify/features/account/presentation/cubit/get_address_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_user_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_adress_cubit.freezed.dart';
part 'update_adress_state.dart';

class UpdateAdressCubit extends Cubit<UpdateAdressState> {
  UpdateAdressCubit({
    required this.updateAddressUsecase,
    required this.editNameUsecase,
  }) : super(const UpdateAdressState.initial());

  final UpdateAddressUsecase updateAddressUsecase;
  final EditNameUsecase editNameUsecase;
  Future<void> UpdateAddress(
    BuildContext context, {
    required String contact_name,
    required String address,
    required String phone_number,
  }) async {
    unawaited(sl<AppLoadingPopup>().show(context));
    emit(const UpdateAdressState.loading());

    final response = await updateAddressUsecase(
      UpdateAddressParams(
        contact_name: contact_name,
        address: address,
        phone_number: phone_number,
      ),
    );
    response.fold((l) {
      Navigator.pop(context);

      emit(
        const UpdateAdressState.error(),
      );
    }, (r) {
      Navigator.pop(context);

      context.read<GetAddressCubit>().getDeliveryAddress(context);
      Navigator.pop(context);
      emit(const UpdateAdressState.success());
    });
  }

  Future<void> editNName(
    BuildContext context, {
    required String new_name,
  }) async {
    unawaited(sl<AppLoadingPopup>().show(context));
    emit(const UpdateAdressState.loading());

    final response = await editNameUsecase(
      EditNameParams(new_name: new_name),
    );
    response.fold((l) {
      Navigator.pop(context);

      emit(
        const UpdateAdressState.error(),
      );
    }, (r) {
      Navigator.pop(context);

      context.read<GetUserCubit>().getUser(context);
      Navigator.pop(context);

      emit(const UpdateAdressState.success());
    });
  }
}
