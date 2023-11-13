import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';

class DeactivateSuccessDialog extends StatelessWidget {
  const DeactivateSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Container(
        height: 390,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: FoodlieColors.foodlieWhite,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.orderSuccessfulImg,
              height: 155,
              width: 155,
            ),
            const Gap(19),
            TextBold(
              'Your account has been\nsuccessfully deleted.',
              fontSize: 20,
              color: FoodlieColors.primaryColor,
              textAlign: TextAlign.center,
            ),
            const Gap(19),
            TextSemiBold(
              'Bye! Hope to see you soon',
              fontSize: 14,
              color: const Color(0xff534F4F),
            ),
            const Gap(19),
            Image.asset(AppAssets.newSucessLoading)
          ],
        ),
      ),
    );
  }
}
