import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegistrationComplete extends StatefulWidget {
  const RegistrationComplete({super.key});

  @override
  State<RegistrationComplete> createState() => _RegistrationCompleteState();
}

class _RegistrationCompleteState extends State<RegistrationComplete> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteName.loginScreen,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.orderSuccessfulImg,
              height: 156,
              width: 156,
            ),
            const Gap(20),
            TextBold(
              'Signup Completed',
              fontSize: 20,
              color: FoodlieColors.primaryColor,
            ),
            const Gap(20),
            TextSemiBold(
              'Account Verified',
              fontSize: 13,
              color: const Color(0xff534F4F),
            ),
            const Gap(20),
            Image.asset(
              AppAssets.newSucessLoading,
            )
          ],
        ),
      ),
    );
  }
}
