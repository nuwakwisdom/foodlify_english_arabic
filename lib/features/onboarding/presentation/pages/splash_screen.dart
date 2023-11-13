// ignore_for_file: inference_failure_on_function_return_type, type_annotate_public_apis, lines_longer_than_80_chars

import 'package:Foodlify/features/home/presentation/pages/home_nav.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> setvisitStatus() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool('visited', true);
    return true;
  }

  Future<bool> getVisitingStatus() async {
    final preferences = await SharedPreferences.getInstance();
    final visited = preferences.getBool('visited') ?? false;
    return visited;
  }

  Future<String?> getLocationString() async {
    final preferences = await SharedPreferences.getInstance();
    final location = preferences.getString('location');
    return location;
  }

  // ignore: always_declare_return_types
  checkVisitStatus() async {
    final visited = await getVisitingStatus();
    final location = await getLocationString();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (visited == true) {
          if (location == null || location == '') {
            Navigator.pushNamedAndRemoveUntil(
                context, RouteName.selectLocationPage, (route) => false);
          } else {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteName.homeNav,
              (route) => false,
              arguments: HomeArguement(
                location: location,
              ),
            );
          }
        } else {
          setvisitStatus();
          Navigator.pushNamed(context, RouteName.onBoardingScreen);
        }
      },
    );
  }

  @override
  void initState() {
    checkVisitStatus();
    //setvisitStatus();
    super.initState();

    /* Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      Navigator.pushNamed(
        context,
        RouteName.onBoardingScreen,
      );
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodlieColors.foodliePink,
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: FoodlifyLinearColors.primayLinear,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.newFoodlifyLogo,
                height: 52,
                width: 50,
              ),
              const Gap(20),
              TextBold(
                'Foodlify',
                fontSize: 14,
                fontWeight: FontWeight.w900,
                color: FoodlieColors.foodlieWhite,
              )
            ],
          )),
    );
  }
}
