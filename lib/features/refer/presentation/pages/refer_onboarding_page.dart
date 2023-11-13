import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/app_assets.dart';
import 'package:Foodlify/core/constant/app_colors.dart';
import 'package:Foodlify/core/navigators/navigator.dart';

class ReferOnBoarding extends StatefulWidget {
  const ReferOnBoarding({super.key});

  @override
  State<ReferOnBoarding> createState() => _ReferOnBoardingState();
}

class _ReferOnBoardingState extends State<ReferOnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: PageView(
                  onPageChanged: (value) {
                    if (value == 2) {
                      Future.delayed(
                        const Duration(seconds: 2),
                        () {
                          Navigator.pushReplacementNamed(
                            context,
                            RouteName.referralPage,
                          );
                        },
                      );
                    }
                  },
                  children: [
                    body(
                      image: AppAssets.referImage,
                      text: 'Refer A friend',
                      subText:
                          'Suggest to a friend about us by Making a referral today',
                      value: 0.4,
                    ),
                    body(
                      image: AppAssets.couponImage,
                      text: 'Earn A Coupon',
                      subText:
                          'You stand a chance to gain a free meal coupon if you refer at least 10 people',
                      value: 0.7,
                    ),
                    body(
                      image: AppAssets.burgerImage,
                      text: 'Free Meal',
                      subText:
                          'You buy a free meal with your coupon and enjoy your meal',
                      value: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget body({
    required String image,
    required String text,
    required String subText,
    required double value,
  }) {
    return Column(
      children: [
        Image.asset(
          image,
        ),
        const Gap(10),
        TextBold(
          text,
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
        const Gap(20),
        Text(
          subText,
          style: const TextStyle(
            fontSize: 13,
          ),
          textAlign: TextAlign.center,
        ),
        const Gap(130),
        LinearProgressIndicator(
          color: FoodlieColors.primaryColor,
          minHeight: 6,
          value: value,
          backgroundColor: FoodlieColors.primaryColor.withOpacity(0.2),
        ),
      ],
    );
  }
}
