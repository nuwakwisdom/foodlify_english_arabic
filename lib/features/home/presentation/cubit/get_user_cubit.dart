import 'dart:async';

import 'package:Foodlify/app/widgets/app_loader.dart';
import 'package:Foodlify/core/sl/sl_container.dart';
import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/entities/notificationn_entity.dart';
import 'package:Foodlify/features/home/domain/entities/users_entity.dart';
import 'package:Foodlify/features/home/domain/usecases/get_notification_usecase.dart';
import 'package:Foodlify/features/home/domain/usecases/get_user_usecase.dart';
import 'package:Foodlify/features/home/domain/usecases/view_notification_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_cubit.freezed.dart';
part 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit({
    required this.getUserUsecase,
    required this.getNotificationUsecase,
    required this.viewNotificationUsecase,
  }) : super(
          const GetUserState.initial(),
        );
  final GetUserUsecase getUserUsecase;
  final GetNotificationUsecase getNotificationUsecase;
  final ViewNotificationUsecase viewNotificationUsecase;
  List<NotificationnEntities>? notifications;
  UsersEntity? users;
  Future<void> getUser(BuildContext context) async {
    //emit(const GetCartState.loading());
    unawaited(sl<AppLoadingPopup>().show(context));
    final response = await getUserUsecase(NoParams());
    response.fold((l) {
      Navigator.pop(context);
      emit(
        const GetUserState.error(),
      );
    }, (r) {
      Navigator.pop(context);
      users = r;

      emit(
        GetUserState.success(users: r),
      );
    });
  }

  Future<void> getNotification(BuildContext context) async {
    //emit(const GetCartState.loading());
    // unawaited(sl<AppLoadingPopup>().show(context));
    final response = await getNotificationUsecase(NoParams());
    response.fold((l) {
      // Navigator.pop(context);
      emit(
        const GetUserState.error(),
      );
    }, (r) {
      // Navigator.pop(context);
      notifications = r;

      /* emit(
        GetUserState.success(users: r),
      );*/
    });
  }

  Future<void> viewNotification({required int id}) async {
    final response = await viewNotificationUsecase(
      ViewNotificationParam(id: id),
    );
    response.fold((l) {
      // Navigator.pop(context);
      emit(
        const GetUserState.error(),
      );
    }, (r) {
      // Navigator.pop(
      /* emit(
        GetUserState.success(users: r),
      );*/
    });
  }
}
