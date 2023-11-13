// ignore_for_file: file_names

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NoInternetPage extends StatefulWidget {
  const NoInternetPage({super.key});

  @override
  State<NoInternetPage> createState() => _NoInternetPageState();
}

class _NoInternetPageState extends State<NoInternetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.noInternetImg,
            ),
            TextBold(
              'No Internet Connection',
              fontSize: 18,
              color: FoodlieColors.primaryColor,
            ),
            const Gap(20),
            TextBody(
              'Please verify your Wi-Fi or mobile\ndata connection and attempt the\naction once more.',
              fontSize: 14,
              maxLines: 6,
              color: const Color(0xff676262),
              textAlign: TextAlign.center,
            ),
            const Gap(80),
            BusyButton(
              title: 'Try Again',
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, RouteName.homeNav, (route) => false);
              },
            )
          ],
        ),
      ),
    );
  }
}
