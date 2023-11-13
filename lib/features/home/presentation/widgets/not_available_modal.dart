import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class NotAvailableModel extends StatelessWidget {
  const NotAvailableModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: FoodlieColors.foodlieWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animation/animation.json',
              height: 300,
              width: 300,
            ),
            const Gap(20),
            TextBold(
              'Foodlfy is not available in your location',
              fontSize: 16,
            ),
            const Gap(30),
            BusyButton(
              title: 'Reset Location',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
