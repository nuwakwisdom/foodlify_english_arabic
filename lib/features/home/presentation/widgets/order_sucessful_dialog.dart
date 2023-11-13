import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';

class OrderSuceesfulDialog extends StatelessWidget {
  const OrderSuceesfulDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        height: 387,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          color: FoodlieColors.foodlieWhite,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.orderSuccessfulImg,
              height: 151,
              width: 156,
            ),
            const Gap(20),
            TextBold(
              'Success!',
              fontSize: 20,
              color: FoodlieColors.primaryColor,
            ),
            const Gap(20),
            TextSemiBold(
              'Thanks for the honest review, we\nhope to see you again.',
              fontSize: 14,
              color: const Color(0xff534F4F),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
