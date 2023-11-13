// ignore_for_file: inference_failure_on_function_invocation, unrelated_type_equality_checks

import 'dart:async';

import 'package:Foodlify/app/widgets/app_loader.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:Foodlify/core/sl/sl_container.dart';
import 'package:Foodlify/core/utils/flushbar_notification.dart';
import 'package:Foodlify/features/auth/domain/usecases/change_password_usecase.dart';
import 'package:Foodlify/features/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:Foodlify/features/auth/domain/usecases/register_with_email.dart';
import 'package:Foodlify/features/auth/domain/usecases/register_with_phone_usecase.dart';
import 'package:Foodlify/features/auth/domain/usecases/resend_otp_sms_usecase.dart';
import 'package:Foodlify/features/auth/domain/usecases/reset_password_email_usecase.dart';
import 'package:Foodlify/features/auth/domain/usecases/reset_password_phone.dart';
import 'package:Foodlify/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:Foodlify/features/auth/domain/usecases/set_password_usecase.dart';
import 'package:Foodlify/features/auth/domain/usecases/update_profile_number_usecase.dart';
import 'package:Foodlify/features/auth/domain/usecases/update_profile_with_email_usecase.dart';
import 'package:Foodlify/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:Foodlify/features/auth/presentation/pages/set_password.dart';
import 'package:Foodlify/features/auth/presentation/pages/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthNotifier extends ChangeNotifier {
  AuthNotifier({
    required this.registerWithEmailUsecase,
    required this.registerWithPhoneUsecase,
    required this.loginWithEmailUsecase,
    required this.setPasswordUsecase,
    required this.sendOtpUsecase,
    required this.verifyOtpUsecase,
    required this.resendOtpSmsUsecase,
    required this.updateProfileWithPhoneNumberUsecase,
    required this.updateProfileWithEmailUsecase,
    required this.resetPasswordEmailUsecase,
    required this.changePasswordEmailUsecase,
    required this.resetPasswordPhoneUsecae,
  });
  final RegisterWithEmailUsecase registerWithEmailUsecase;
  final RegisterWithPhoneUsecase registerWithPhoneUsecase;
  final LoginWithEmailUsecase loginWithEmailUsecase;
  final SetPasswordUsecase setPasswordUsecase;
  final SendOtpUsecase sendOtpUsecase;
  final VerifyOtpUsecase verifyOtpUsecase;
  final ResendOtpSmsUsecase resendOtpSmsUsecase;
  final UpdateProfileWithPhoneNumberUsecase updateProfileWithPhoneNumberUsecase;
  final UpdateProfileWithEmailUsecase updateProfileWithEmailUsecase;
  final ResetPasswordEmailUsecase resetPasswordEmailUsecase;
  final ChangePasswordEmailUsecase changePasswordEmailUsecase;
  final ResetPasswordPhoneUsecase resetPasswordPhoneUsecae;
  bool _loading = false;
  bool get isLoading => _loading;

  Future<void> registerWithEmail(
    BuildContext context, {
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    String? referralCode,
  }) async {
    _loading = true;
    notifyListeners();
    final response = await registerWithEmailUsecase(
      RegisterWithEmailParams(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        referralCode: referralCode,
      ),
    );

    response.fold(
      (l) {
        _loading = false;

        FlushbarNotification.showErrorMessage(
          context,
          message: FailureToMessage.mapFailureToMessage(l),
        );
        notifyListeners();
      },
      (r) {
        _loading = false;
        Navigator.pushNamed(
          context,
          RouteName.verifyEmailPage,
          arguments: VerifyOtpArgment(email: email, isEmail: true),
        );
        notifyListeners();
      },
    );
  }

  Future<void> registerWithPhone(
    BuildContext context, {
    required String firstName,
    required String lastName,
    required String password,
    required String phone,
    String? referralCode,
  }) async {
    _loading = true;
    notifyListeners();
    final response = await registerWithPhoneUsecase(
      RegisterWithPhoneParams(
        firstNName: firstName,
        lastName: lastName,
        password: password,
        phone: phone,
        referralCode: referralCode,
      ),
    );

    response.fold(
      (l) {
        if (FailureToMessage.mapFailureToMessage(l)
            .contains('User with phone number $phone exists')) {
          _loading = false;
          ressendOtpForRegistered(context, phoneNumber: phone);
          Navigator.pushNamed(
            context,
            RouteName.verifyEmailPage,
            arguments: VerifyOtpArgment(email: phone, isEmail: false),
          );
          notifyListeners();
        } else {
          _loading = false;
          FlushbarNotification.showErrorMessage(
            context,
            message: FailureToMessage.mapFailureToMessage(l),
          );
          notifyListeners();
        }
      },
      (r) {
        _loading = false;
        Navigator.pushNamed(
          context,
          RouteName.verifyEmailPage,
          arguments: VerifyOtpArgment(email: phone, isEmail: false),
        );
        notifyListeners();
      },
    );
  }

  Future<void> loginWithEmail(
    BuildContext context, {
    required String username,
    required String password,
  }) async {
    _loading = true;
    notifyListeners();
    final response = await loginWithEmailUsecase(
      LoginWithEmailParams(
        username: username,
        password: password,
      ),
    );

    response.fold(
      (l) {
        _loading = false;
        notifyListeners();
        FlushbarNotification.showErrorMessage(
          context,
          message: FailureToMessage.mapFailureToMessage(l),
        );
      },
      (r) {
        _loading = false;
        notifyListeners();
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteName.homeNav,
          (route) => false,
        );
      },
    );
  }

  Future<void> setPassword(
    BuildContext context, {
    required String password,
    required String confirmPassword,
  }) async {
    _loading = true;
    notifyListeners();
    final response = await setPasswordUsecase(
      SetPasswordParams(
        password: password,
        confirmPassword: confirmPassword,
      ),
    );

    response.fold(
      (l) {
        _loading = false;
        notifyListeners();
      },
      (r) {
        _loading = false;
        notifyListeners();
      },
    );
  }

  Future<void> resendOtpEmail(
    BuildContext context, {
    required String email,
  }) async {
    unawaited(sl<AppLoadingPopup>().show(context));

    final response = await sendOtpUsecase(
      SendOtpParams(email: email),
    );

    response.fold(
      (l) {
        Navigator.pop(context);
        FlushbarNotification.showErrorMessage(
          context,
          message: FailureToMessage.mapFailureToMessage(l),
        );
        notifyListeners();
      },
      (r) {
        Navigator.pop(context);
        FlushbarNotification.showSuccessMessage(
          context,
          message: 'OTP has been resend to email',
        );
        notifyListeners();
      },
    );
  }

  Future<void> confirmOtp(
    BuildContext context, {
    required String username,
    required String otp,
  }) async {
    _loading = true;
    notifyListeners();
    final response = await verifyOtpUsecase(
      VerifyOtpParams(
        username: username,
        otp: otp,
      ),
    );
    response.fold(
      (l) {
        _loading = false;
        notifyListeners();
        FlushbarNotification.showErrorMessage(
          context,
          message: FailureToMessage.mapFailureToMessage(l),
        );
      },
      (r) {
        _loading = false;
        notifyListeners();
        Navigator.pushNamed(
          context,
          RouteName.registrationCompletePage,
        );
        Navigator.pushNamedAndRemoveUntil(
            context, RouteName.loginScreen, (route) => false);
      },
    );
  }

  Future<void> resendOtpSms(
    BuildContext context, {
    required String phoneNumber,
  }) async {
    unawaited(sl<AppLoadingPopup>().show(context));

    final response = await resendOtpSmsUsecase(
      ResendOtpSmsParams(phoneNumber: phoneNumber),
    );
    response.fold(
      (l) {
        Navigator.pop(context);
        FlushbarNotification.showErrorMessage(
          context,
          message: FailureToMessage.mapFailureToMessage(l),
        );
        notifyListeners();
      },
      (r) {
        Navigator.pop(context);
        FlushbarNotification.showSuccessMessage(
          context,
          message: 'OTP has been resend to $phoneNumber',
        );
        notifyListeners();
      },
    );
  }

  Future<void> updateProfileWithNumber(
    BuildContext context, {
    required String phoneNumber,
    required String email,
    required String fullName,
  }) async {
    _loading = true;
    notifyListeners();
    final response = await updateProfileWithPhoneNumberUsecase(
      UpdateProfileWithNumberParams(
        email: email,
        phoneNumber: phoneNumber,
        fullName: fullName,
      ),
    );
    response.fold(
      (l) {
        _loading = false;
        notifyListeners();
        FlushbarNotification.showErrorMessage(
          context,
          message: FailureToMessage.mapFailureToMessage(l),
        );
      },
      (r) {
        _loading = false;
        notifyListeners();
        FlushbarNotification.showSuccessMessage(
          context,
          message: 'Updatte profile successful',
        );
      },
    );
  }

  Future<void> updateProfileWithEmail(
    BuildContext context, {
    required String phoneNumber,
    required String email,
    required String fullName,
  }) async {
    _loading = true;
    notifyListeners();
    final response = await updateProfileWithEmailUsecase(
      UpdateProfileWithEmailParams(
        email: email,
        phoneNumber: phoneNumber,
        fullName: fullName,
      ),
    );
    response.fold(
      (l) {
        _loading = false;
        notifyListeners();
        FlushbarNotification.showErrorMessage(
          context,
          message: FailureToMessage.mapFailureToMessage(l),
        );
      },
      (r) {
        _loading = false;
        notifyListeners();
        FlushbarNotification.showSuccessMessage(
          context,
          message: 'Updatte profile successful',
        );
      },
    );
  }

  Future<void> resetPasswordEmail(
    BuildContext context, {
    required String email,
  }) async {
    _loading = true;
    notifyListeners();
    final response = await resetPasswordEmailUsecase(
      ResetPasswordEmailParams(
        email: email,
      ),
    );
    response.fold(
      (l) {
        _loading = false;
        notifyListeners();
        FlushbarNotification.showErrorMessage(
          context,
          message: FailureToMessage.mapFailureToMessage(l),
        );
      },
      (r) {
        _loading = false;
        notifyListeners();
        Navigator.pushNamed(
          context,
          RouteName.setPassword,
          arguments: SetPasswordArguement(
            email: email,
          ),
        );
      },
    );
  }

  Future<void> resetPasswordPhone(
    BuildContext context, {
    required String phoneNumber,
  }) async {
    _loading = true;
    notifyListeners();
    final response = await resetPasswordPhoneUsecae(
      ResetPasswordPhoneParams(phoneNumber: phoneNumber),
    );

    response.fold(
      (l) {
        _loading = false;
        notifyListeners();
        FlushbarNotification.showErrorMessage(
          context,
          message: FailureToMessage.mapFailureToMessage(l),
        );
      },
      (r) {
        _loading = false;
        notifyListeners();
        Navigator.pushNamed(
          context,
          RouteName.setPassword,
          arguments: SetPasswordArguement(
            email: phoneNumber,
          ),
        );
      },
    );
  }

  Future<void> changePasswordEmail(
    BuildContext context, {
    required String email,
    required String token,
    required String newPassword,
  }) async {
    _loading = true;
    notifyListeners();
    final response = await changePasswordEmailUsecase(
      ChangePasswordEmailParams(
        email: email,
        token: token,
        newPassword: newPassword,
      ),
    );
    response.fold(
      (l) {
        _loading = false;
        notifyListeners();
        FlushbarNotification.showErrorMessage(
          context,
          message: FailureToMessage.mapFailureToMessage(l),
        );
      },
      (r) {
        _loading = false;
        notifyListeners();

        Navigator.pushNamed(context, RouteName.loginScreen);
        FlushbarNotification.showSuccessMessage(
          context,
          message: 'Password changed successful',
        );
      },
    );
  }

  Future<void> ressendOtpForRegistered(
    BuildContext context, {
    required String phoneNumber,
  }) async {
    //  unawaited(sl<AppLoadingPopup>().show(context));

    final response = await resendOtpSmsUsecase(
      ResendOtpSmsParams(phoneNumber: phoneNumber),
    );
    response.fold(
      (l) {
        //  Navigator.pop(context);
        FlushbarNotification.showErrorMessage(
          context,
          message: FailureToMessage.mapFailureToMessage(l),
        );
        notifyListeners();
      },
      (r) {
        //  Navigator.pop(context);
        FlushbarNotification.showSuccessMessage(
          context,
          message: 'OTP has been resend to $phoneNumber',
        );
        notifyListeners();
      },
    );
  }
}
