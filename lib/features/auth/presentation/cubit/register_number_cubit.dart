import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/features/auth/domain/usecases/register_with_phone_usecase.dart';

part 'register_number_state.dart';
part 'register_number_cubit.freezed.dart';

class RegisterNumberCubit extends Cubit<RegisterNumberState> {
  RegisterNumberCubit({
    required this.registerWithPhoneUsecase,
  }) : super(const RegisterNumberState.initial());
  final RegisterWithPhoneUsecase registerWithPhoneUsecase;
  Future<void> registerPhoneNumber({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String password,
    String? referralCode,
  }) async {
    emit(const RegisterNumberState.loading());
    final response = await registerWithPhoneUsecase(
      RegisterWithPhoneParams(
        firstNName: firstName,
        lastName: lastName,
        password: password,
        phone: phoneNumber,
        referralCode: referralCode,
      ),
    );

    response.fold(
      (l) {
        emit(
          RegisterNumberState.error(
            error: FailureToMessage.mapFailureToMessage(l),
          ),
        );
      },
      (r) {
        emit(const RegisterNumberState.registered());
      },
    );
  }
}
