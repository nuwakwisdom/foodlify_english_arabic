import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:Foodlify/core/constant/constant.dart';

@lazySingleton
class AppLoadingPopup {
  Future<dynamic> show(
    BuildContext context, {
    String? text,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 0.1,
            sigmaY: 0.1,
          ),
          child: Center(
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    AppAssets.newFoodlifyLogo,
                    height: 90,
                    width: 90,
                  ),
                ),
                const Center(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator(
                      color: FoodlieColors.primaryColor,
                      strokeWidth: 5,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
