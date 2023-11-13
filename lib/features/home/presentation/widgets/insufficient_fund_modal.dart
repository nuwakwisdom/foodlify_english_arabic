// ignore_for_file: lines_longer_than_80_chars

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InsufficientDialog extends StatelessWidget {
  const InsufficientDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(21),
      ),
      child: Container(
        height: 322,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 30,
                    color: FoodlieColors.foodlieBlack,
                  ),
                ),
              ),
              Image.asset(
                AppAssets.foodlifyLogo,
                height: 50,
                width: 50,
              ),
              const Gap(20),
              TextBold(
                'Insufficient Fund',
                fontSize: 20,
                color: FoodlieColors.primaryColor,
                fontWeight: FontWeight.w700,
              ),
              const Gap(20),
              TextSemiBold(
                'Account Wallet balance is insufficient to complete the transaction.\nPlease add funds to your wallet',
                fontSize: 14,
                textAlign: TextAlign.center,
                color: const Color(0xff534F4F),
                maxLines: 30,
              ),
              const Gap(20),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, RouteName.walletPage);
                },
                child: Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: FoodlieColors.primaryColor,
                  ),
                  child: Center(
                    child: TextSemiBold(
                      'Top up',
                      fontSize: 14,
                      color: FoodlieColors.foodlieWhite,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
