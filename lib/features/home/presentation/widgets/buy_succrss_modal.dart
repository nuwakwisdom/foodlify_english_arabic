// ignore_for_file: lines_longer_than_80_chars

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BuySuccessModal extends StatefulWidget {
  const BuySuccessModal({super.key});

  @override
  State<BuySuccessModal> createState() => _BuySuccessModalState();
}

class _BuySuccessModalState extends State<BuySuccessModal> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pop(context);
      Navigator.pushNamed(context, RouteName.pickUpTrackCart);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 530,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: FoodlieColors.foodlieWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.successImg,
              height: 200,
              width: 157,
            ),
            const Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextSemiBold(
                  'Sent',
                  fontSize: 20,
                  color: const Color(0xff27790A),
                ),
                const Gap(5),
                Image.asset(
                  AppAssets.happyEmoji,
                )
              ],
            ),
            const Gap(40),
            TextSemiBold(
              'Thank you for taking the time to review  review. I hope you found it helpful and informative.',
              fontSize: 14,
              color: const Color(0xff534F4F),
              maxLines: 10,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
