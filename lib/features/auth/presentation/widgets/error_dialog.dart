import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 400,
        width: 375,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: FoodlieColors.foodlieWhite,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.errorImg,
              height: 151,
              width: 156,
            ),
            const Gap(19),
            TextSemiBold(
              'Error 😟',
              fontSize: 20,
              color: const Color(0xffFF0202),
            ),
            const Gap(28),
            TextSemiBold(
              'An error has occurred. Please try \n again later.',
              fontSize: 14,
              color: const Color(0xff534F4F),
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
            const Gap(30),
            Image.asset(
              AppAssets.errorLoad,
              height: 50,
              width: 50,
            )
          ],
        ),
      ),
    );
  }
}
