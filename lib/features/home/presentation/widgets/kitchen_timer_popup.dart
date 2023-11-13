import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class KitchenTimerPopUp extends StatelessWidget {
  const KitchenTimerPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 306,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: FoodlieColors.foodlieWhite,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextBold(
            'Select Mode',
            fontSize: 15,
            color: FoodlieColors.textColor,
          ),
          const Gap(29),
          Text.rich(
            TextSpan(
                text:
                    'Hello, you’re about to order from a\n kitchen and it’ll take ',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: FoodlieColors.grey,
                ),
                children: [
                  TextSpan(
                      text: ' 20 minutes ',
                      style: GoogleFonts.inter(
                          fontSize: 13,
                          color: FoodlieColors.grey,
                          fontWeight: FontWeight.w700)),
                  TextSpan(
                    text: 'to\nprepare your meal.',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: FoodlieColors.grey,
                    ),
                  )
                ]),
            textAlign: TextAlign.center,
          ),
          const Gap(29),
          TextBody(
            'Do you wish to continue?',
            fontSize: 13,
            color: FoodlieColors.grey,
          ),
          const Gap(29),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: FoodlifyLinearColors.buttonLinear),
              child: Center(
                child: TextSemiBold(
                  'Continue',
                  fontSize: 14,
                  color: FoodlieColors.foodlieWhite,
                ),
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: TextSemiBold(
                'Cancel',
                fontSize: 14,
                color: FoodlieColors.grey,
              ))
        ],
      ),
    );
  }
}
