import 'package:bloc/bloc.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';

import 'generate_referral_code_state.dart';

class GenerateReferralCodeCubit extends Cubit<GenerateReferralCodeState> {
  GenerateReferralCodeCubit({
    required this.homeRepository,
  }) : super(
          const GenerateReferralCodeState.initial(),
        );

  final HomeRepository homeRepository;

  Future<void> generateReferralCode() async {
    emit(const GenerateReferralCodeState.loading());
    final getUser = await homeRepository.getUser();
    return getUser.fold(
      (failure) {
        emit(
          GenerateReferralCodeState.error(
            message: FailureToMessage.mapFailureToMessage(failure),
          ),
        );
      },
      (user) async {
        if (user.has_referral_code!) {
          emit(GenerateReferralCodeState.generated(usersEntity: user));
        } else {
          final response = await homeRepository.generateReferralCode();
          return response.fold(
            (failure) {
              emit(
                GenerateReferralCodeState.error(
                  message: FailureToMessage.mapFailureToMessage(failure),
                ),
              );
            },
            (r) async {
              final res = await homeRepository.getUser();
              return res.fold(
                (failure) {
                  emit(
                    GenerateReferralCodeState.error(
                      message: FailureToMessage.mapFailureToMessage(failure),
                    ),
                  );
                },
                (user) {
                  emit(GenerateReferralCodeState.generated(usersEntity: user));
                },
              );
            },
          );
        }
      },
    );
  }
}
