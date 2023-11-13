import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';

class LetYouInScreen extends StatefulWidget {
  const LetYouInScreen({super.key});

  @override
  State<LetYouInScreen> createState() => _LetYouInScreenState();
}

class _LetYouInScreenState extends State<LetYouInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
      appBar: AppBar(
        backgroundColor: FoodlieColors.foodlieWhite,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: FoodlieColors.foodlieBlack,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(30),
              Image.asset(
                AppAssets.letInImg,
                height: 218,
                width: 170,
              ),
              const Gap(43),
              TextBold(
                "Let's you in",
                fontSize: 40.5,
                fontWeight: FontWeight.w700,
                color: FoodlieColors.foodlieBlack,
              ),
              const Gap(68),
              LetInOptions(
                icon: AppAssets.googleLogo,
                title: 'Continue With Google',
                onTap: () {},
              ),
              const Gap(13),
              LetInOptions(
                icon: AppAssets.mail,
                title: 'Continue With E-mail',
                onTap: () {
                  Navigator.pushNamed(context, RouteName.signUpScreen);
                },
              ),
              const Gap(13),
              LetInOptions(
                icon: AppAssets.phone,
                title: 'Continue With Number',
                onTap: () {
                  Navigator.pushNamed(context, RouteName.signUpWithNumber);
                },
              ),
              const Gap(39),
              BusyButton(
                title: 'Next',
                onTap: () {},
              ),
              const Gap(30),
              RichText(
                text: TextSpan(
                  text: 'Already have an account?',
                  style: GoogleFonts.inter(
                    fontSize: 13.35,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff282727),
                  ),
                  children: [
                    TextSpan(
                      text: ' Sign in',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(
                            context,
                            RouteName.loginScreen,
                          );
                        },
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: FoodlieColors.foodliePink,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20)
            ],
          ),
        ),
      ),
    );
  }
}

class LetInOptions extends StatelessWidget {
  const LetInOptions({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final String icon;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 53,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: FoodlieColors.foodliePink,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon),
            const Gap(10),
            TextSemiBold(
              title,
              fontSize: 18,
              color: FoodlieColors.foodlieBlack,
            )
          ],
        ),
      ),
    );
  }
}
