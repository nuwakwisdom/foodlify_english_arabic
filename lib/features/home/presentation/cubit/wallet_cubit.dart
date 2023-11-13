import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/entities/wallet_entity.dart';
import 'package:Foodlify/features/home/domain/usecases/get_wallet_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_cubit.freezed.dart';
part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit({
    required this.getWalletUsecase,
  }) : super(const WalletState.initial());
  final GetWalletUsecase getWalletUsecase;
  WalletEntity? wallet;
  Future<void> getWallet(BuildContext context) async {
    //emit(const GetCartState.loading());

    final response = await getWalletUsecase(NoParams());
    response.fold((l) {
      emit(
        const WalletState.error(),
      );
    }, (r) {
      wallet = r;
      emit(
        const WalletState.success(),
      );
    });
  }
}
