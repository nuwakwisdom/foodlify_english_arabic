// ignore_for_file: lines_longer_than_80_chars

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginRequiredDialog extends StatelessWidget {
  const LoginRequiredDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(21),
      ),
      child: Container(
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          color: FoodlieColors.foodlieWhite,
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
                'Login Required',
                fontSize: 20,
                color: FoodlieColors.primaryColor,
                fontWeight: FontWeight.w700,
              ),
              const Gap(20),
              TextSemiBold(
                'Please log in or create an account to access our food delivery service.',
                fontSize: 14,
                textAlign: TextAlign.center,
                maxLines: 100,
                color: const Color(0xff534F4F),
              ),
              const Gap(20),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, RouteName.loginScreen);
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
                      'Login',
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
