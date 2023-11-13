import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:Foodlify/app/widgets/app_loader.dart';
import 'package:Foodlify/core/errors/failure.dart';
import 'package:Foodlify/core/sl/sl_container.dart';
import 'package:Foodlify/core/utils/flushbar_notification.dart';
import 'package:Foodlify/features/account/presentation/widgets/ticket_submit_dialog.dart';
import 'package:Foodlify/features/home/domain/entities/ticket_entity.dart';
import 'package:Foodlify/features/home/domain/usecases/get_tickets_usecase.dart';
import 'package:Foodlify/features/home/domain/usecases/post_ticket_usecase.dart';
import 'package:Foodlify/features/home/domain/usecases/put_ticket_field_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_update/in_app_update.dart';

part 'post_ticket_state.dart';
part 'post_ticket_cubit.freezed.dart';

class PostTicketCubit extends Cubit<PostTicketState> {
  PostTicketCubit({
    required this.postTicketUsecase,
    required this.putTicketFieldUsecase,
    required this.getTicketUsecase,
  }) : super(
          const PostTicketState.initial(),
        );
  final PostTicketUsecase postTicketUsecase;
  final PutTicketFieldUsecase putTicketFieldUsecase;
  final GetTicketUsecase getTicketUsecase;
  List<TicketEntity>? tickets;
  List<TicketEntity> paginatedTickets = [];

  Future<void> postTicket(
    BuildContext context, {
    required String category,
    required String message,
    required File filee,
  }) async {
    unawaited(sl<AppLoadingPopup>().show(context));
    emit(const PostTicketState.loading());

    final response = await postTicketUsecase(
      PostTicketParams(
        category: category,
        message: message,
      ),
    );
    response.fold((l) {
      Navigator.pop(context);
      FlushbarNotification.showErrorMessage(
        context,
        message: FailureToMessage.mapFailureToMessage(l),
      );
    }, (r) {
      putTicketFile(context, ticketId: '', file: filee);
      Navigator.pop(context);

      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return const TicketSubmittedDialog();
          });
    });
  }

  Future<void> putTicketFile(
    BuildContext context, {
    required String ticketId,
    required File file,
  }) async {
    // unawaited(sl<AppLoadingPopup>().show(context));
    emit(const PostTicketState.loading());

    final response = await putTicketFieldUsecase(
      PutTicketFileParams(ticketId: ticketId, file: file),
    );
    response.fold((l) {
      //  Navigator.pop(context);
    }, (r) {
      /* Navigator.pop(context);

      Navigator.pushNamedAndRemoveUntil(
          context, RouteName.homeNav, (route) => false,
          arguments: HomeArguement(
              location:
                  context.read<GetFoodByCategoryCubit>().getPresentLocation ??
                      ''));*/
    });
  }

  Future<void> getTicket(
    BuildContext context, {
    required int page,
  }) async {
    // unawaited(sl<AppLoadingPopup>().show(context));
    emit(const PostTicketState.loading());

    final response = await getTicketUsecase(
      TicketParams(page: page),
    );
    response.fold((l) {
      emit(const PostTicketState.error());
      //  Navigator.pop(context);
    }, (r) {
      emit(const PostTicketState.success());
      tickets = r;
      paginatedTickets.addAll(r);
      /* Navigator.pop(context);

      Navigator.pushNamedAndRemoveUntil(
          context, RouteName.homeNav, (route) => false,
          arguments: HomeArguement(
              location:
                  context.read<GetFoodByCategoryCubit>().getPresentLocation ??
                      ''));*/
    });
  }

  Future<void> checkForUpdate(context) async {
    if (Platform.isAndroid) {
      InAppUpdate.checkForUpdate().then((info) {
        log(info.updateAvailability.toString());
        if (info.updateAvailability == UpdateAvailability.updateAvailable) {
          log(info.availableVersionCode.toString());
          if (info.updatePriority >= 4) {
            InAppUpdate.performImmediateUpdate();
            log("immede");
          } else {
            InAppUpdate.startFlexibleUpdate().then((value) {
              InAppUpdate.checkForUpdate().then((value) {
                if (value.installStatus.value == 11) {
                  FlushbarNotification.showSuccessMessage(context,
                      message:
                          'Update Downloded Succesfully. Restarting the App in 5 seconds to Install',
                      title: "Update Downloaded!");
                  Future.delayed(const Duration(seconds: 5), () {
                    InAppUpdate.completeFlexibleUpdate();
                  });
                }
              });
            });
          }
        }
      }).catchError((e) {
        FlushbarNotification.showErrorMessage(
          context,
          title: 'Failed',
          message: (e.toString()),
        );
      });
    }
  }
}
