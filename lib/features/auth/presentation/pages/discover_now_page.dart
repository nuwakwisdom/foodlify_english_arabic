// ignore_for_file: avoid_redundant_argument_values, deprecated_member_use, inference_failure_on_function_invocation, lines_longer_than_80_chars

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:Foodlify/features/auth/presentation/widgets/sign_up_options.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscoverNowPage extends StatefulWidget {
  const DiscoverNowPage({super.key});

  @override
  State<DiscoverNowPage> createState() => _DiscoverNowPageState();
}

class _DiscoverNowPageState extends State<DiscoverNowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Gap(40),
                Image.asset(
                  AppAssets.newColoredLogo,
                ),
                const Gap(50),
                TextBold(
                  'Discover Now',
                  fontSize: 30,
                  color: FoodlieColors.foodlieBlack,
                ),
                const Gap(50),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RouteName.homeNav, (route) => false);
                  },
                  child: Container(
                    height: 54,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: FoodlieColors.foodlieBlack.withOpacity(0.05),
                      border: Border.all(
                        color: FoodlieColors.foodlieBlack.withOpacity(0.2),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppAssets.personIcon,
                          height: 18,
                          width: 14,
                          color: FoodlieColors.grey1,
                        ),
                        const Gap(31),
                        TextBody(
                          'View as a Guest',
                          fontSize: 13,
                          color: FoodlieColors.foodlieBlack,
                        )
                      ],
                    ),
                  ),
                ),
                /* const Gap(34),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 54,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: FoodlieColors.foodlieBlack.withOpacity(0.05),
                      border: Border.all(
                        color: FoodlieColors.foodlieBlack.withOpacity(0.2),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.newGoogle),
                        const Gap(31),
                        TextBody(
                          'Continue with Google',
                          fontSize: 13,
                          color: FoodlieColors.foodlieBlack,
                        )
                      ],
                    ),
                  ),
                ),*/
                const Gap(34),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const SignUpOptions();
                      },
                    );
                  },
                  child: Container(
                    height: 54,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [
                          const Color(0xffFD654D).withOpacity(1),
                          const Color(0xffFD664C).withOpacity(1),
                          const Color(0xffFD674C).withOpacity(1),
                          const Color(0xffFC6748).withOpacity(1),
                          const Color(0xffF38A2B).withOpacity(1),
                          const Color(0xffF38B2A).withOpacity(1),
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppAssets.keyLocked,
                          color: FoodlieColors.foodlieWhite,
                          height: 16,
                          width: 16,
                        ),
                        const Gap(13),
                        TextBold(
                          'Create an Account ',
                          fontSize: 13,
                          color: FoodlieColors.foodlieWhite,
                        )
                      ],
                    ),
                  ),
                ),
                const Gap(50),
                RichText(
                  text: TextSpan(
                    text: 'Already have an account?',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: FoodlieColors.foodlieBlack.withOpacity(0.6),
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.pushNamed(
                                context,
                                RouteName.loginScreen,
                              ),
                        text: ' Sign in',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          color: const Color(0xffFD654D),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
