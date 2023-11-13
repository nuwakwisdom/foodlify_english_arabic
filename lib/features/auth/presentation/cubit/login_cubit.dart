import 'dart:async';

import 'package:Foodlify/app/widgets/app_loader.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:Foodlify/core/sl/sl_container.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/core/utils/flushbar_notification.dart';
import 'package:Foodlify/features/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:Foodlify/features/auth/domain/usecases/logout_usecase.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_cart_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_user_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider/provider.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.loginWithEmailUsecase,
    required this.logoutUsecase,
  }) : super(
          const LoginState.initial(),
        );
  final LoginWithEmailUsecase loginWithEmailUsecase;
  final LogoutUsecase logoutUsecase;

  Future<void> loginWithEmail(
    BuildContext context, {
    required String username,
    required String password,
  }) async {
    emit(
      const LoginState.loading(),
    );
    final response = await loginWithEmailUsecase(
      LoginWithEmailParams(
        username: username,
        password: password,
      ),
    );

    response.fold(
      (l) {
        FlushbarNotification.showErrorMessage(
          context,
          message: FailureToMessage.mapFailureToMessage(l),
        );
        emit(
          LoginState.error(
            error: FailureToMessage.mapFailureToMessage(l),
          ),
        );
      },
      (r) {
        emit(
          const LoginState.loggedIn(),
        );
      },
    );
  }

  Future<void> logout(BuildContext context) async {
    emit(
      const LoginState.loading(),
    );
    unawaited(sl<AppLoadingPopup>().show(context));
    final response = await logoutUsecase(NoParams());

    response.fold(
      (l) {
        Navigator.pop(context);
        FlushbarNotification.showErrorMessage(
          context,
          message: FailureToMessage.mapFailureToMessage(l),
        );
        emit(
          LoginState.error(
            error: FailureToMessage.mapFailureToMessage(l),
          ),
        );
      },
      (r) {
        context.read<GetUserCubit>().users = null;
        context.read<GetCartCubit>().carts = null;
        Navigator.pop(context);
        Navigator.pushNamedAndRemoveUntil(
            context, RouteName.discoverNowPage, (route) => false);
        emit(
          const LoginState.loggedIn(),
        );
      },
    );
  }
}
