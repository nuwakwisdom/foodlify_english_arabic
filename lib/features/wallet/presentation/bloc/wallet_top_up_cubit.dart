import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';
import 'package:Foodlify/features/wallet/presentation/bloc/wallet_top_up_state.dart';
import 'package:bloc/bloc.dart';

class WalletTopUpCubit extends Cubit<WalletTopUpState> {
  WalletTopUpCubit({
    required this.homeRepository,
  }) : super(
          const WalletTopUpState.initial(),
        );
  final HomeRepository homeRepository;

  Future<void> init({
    required double amount,
  }) async {
    emit(const WalletTopUpState.loading());
    final response = await homeRepository.topUpWallet(amount: amount);
    return response.fold(
      (failure) {
        emit(
          WalletTopUpState.error(
            message: FailureToMessage.mapFailureToMessage(failure),
          ),
        );
      },
      (url) {
        emit(WalletTopUpState.checkOut(url: url));
      },
    );
  }
}
