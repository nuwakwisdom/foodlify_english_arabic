import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:Foodlify/features/auth/presentation/pages/new_login_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LoginOptions extends StatelessWidget {
  const LoginOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
          child: Container(
            height: 5.28,
            width: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: FoodlieColors.foodlieWhite,
            ),
          ),
        ),
        const Gap(8),
        Container(
          height: 286.8,
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
                Align(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      TextSemiBold(
                        'Choose a preferred sign in option',
                        fontSize: 15,
                        color: FoodlieColors.foodlieBlack,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: FoodlieColors.foodlieBlack,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                ListTile(
                  leading: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffFD654D),
                          Color(0xffFD674C),
                          Color(0xffFC674B),
                          Color(0xffF38A2B),
                          Color(0xffF38B2A),
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.mail_outline_outlined,
                        color: FoodlieColors.foodlieWhite,
                      ),
                    ),
                  ),
                  title: TextBody(
                    'Sign in with Email Address',
                    fontSize: 13,
                    color: FoodlieColors.foodlieBlack,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    size: 20,
                    color: const Color(0xff002366).withOpacity(0.3),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(
                      context,
                      RouteName.loginWithEmail,
                      arguments: LoginArgument(
                        isEmail: true,
                      ),
                    );
                  },
                ),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    height: 0.5,
                    width: double.infinity,
                    color: const Color(0xff002366),
                  ),
                ),
                const Gap(20),
                ListTile(
                  leading: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffFD654D),
                          Color(0xffFD674C),
                          Color(0xffFC674B),
                          Color(0xffF38A2B),
                          Color(0xffF38B2A),
                        ],
                      ),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AppAssets.phone3,
                      ),
                    ),
                  ),
                  title: TextBody(
                    'Sign in with Phone Number',
                    fontSize: 13,
                    color: FoodlieColors.foodlieBlack,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    size: 20,
                    color: const Color(0xff002366).withOpacity(0.3),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(
                      context,
                      RouteName.loginWithEmail,
                      arguments: LoginArgument(
                        isEmail: false,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
