// ignore_for_file: lines_longer_than_80_chars

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UiHelper {
  UiHelper(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
  }

  late Size screenSize;

  /// This method is used to get a mapped (proporcional) height given a specific height from the design.
  /// It will take care of adjusting the height to the current screen size in order to maintain the desired aspect ratio.
  /// Parameters:
  ///   - originalHeight -> The value from the design that we wish to use.
  ///   - originalScreenHeight -> The height to base the measure from (defaults to 812 from the design file in Figma)
  double getMappedHeight(
    double originalHeight, {
    double originalScreenHeight = 926,
  }) {
    final percentage = originalHeight / originalScreenHeight;
    return min(screenSize.height * percentage, originalHeight * 1.2);
  }

  /// The same as "getMappedHeight" but for the width.
  double getMappedWidth(
    double originalWidth, {
    double originalScreenWidth = 428,
  }) {
    final percentage = originalWidth / originalScreenWidth;
    return min(screenSize.width * percentage, originalWidth * 1.2);
  }

  Widget verticalSpace(double size) {
    return Gap(getMappedHeight(size));
  }

  Widget horizontalSpace(double size) {
    return Gap(getMappedWidth(size));
  }
}
