// ignore_for_file: inference_failure_on_instance_creation

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class FlushbarNotification {
  static void showSuccessMessage(
    BuildContext context, {
    String? title,
    required String message,
  }) {
    Flushbar(
      title: title ?? 'Success',
      message: message,
      titleSize: 18,
      messageSize: 12,
      backgroundColor: const Color.fromARGB(255, 100, 172, 102),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.bounceIn,
      duration: const Duration(seconds: 3),
    ).show(context);
  }

  static void showErrorMessage(
    BuildContext context, {
    String? title,
    required String message,
  }) {
    Flushbar(
      title: title ?? 'Error!!',
      message: message,
      titleSize: 18,
      messageSize: 12,
      backgroundColor: Colors.red,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.bounceIn,
      duration: const Duration(seconds: 3),
    ).show(context);
  }
}
