// ignore_for_file: type_annotate_public_apis, always_declare_return_types, lines_longer_than_80_chars

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _pageController = PageController();
  int currentIndex = 0;

  void onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  // ignore: inference_failure_on_function_return_type
  nextFunction() {
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: onChangedFunction,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: double.infinity,
                  child: Image.asset(
                    AppAssets.newOnboardingImg,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: double.infinity,
                  child: Image.asset(
                    AppAssets.newOboardingImg2,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: double.infinity,
                  child: Image.asset(
                    AppAssets.newOnboardingImg3,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 330,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                color: Color(0xff040C17),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextBold(
                      currentIndex == 0
                          ? 'Discover a World of\nFlavors'
                          : currentIndex == 1
                              ? 'Real-Time Order\nTracking'
                              : 'Discover Hidden\nGems',
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: FoodlieColors.foodlieWhite,
                    ),
                    const Gap(10),
                    TextBody(
                      currentIndex == 0
                          ? 'Immerse yourself in a culinary adventure with our food app, designed to satisfy your cravings, explore diverse cuisines, and discover new flavors that tantalize your taste buds.'
                          : currentIndex == 1
                              ? "Track the progress of your food orders in real-time, from preparation to delivery, ensuring you're always in the loop and able to plan your meals accordingly."
                              : "Uncover hidden culinary gems and local favorites with our app's curated recommendations and user-generated reviews.",
                      fontSize: 13,
                      color: FoodlieColors.foodlieWhite,
                      maxLines: 5,
                    ),
                    const Gap(30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: FoodlieColors.lightGrey,
                          ),
                          width: 141,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Indicators(
                                active: currentIndex == 0 ||
                                    currentIndex == 1 ||
                                    currentIndex == 2,
                              ),
                              Indicators(
                                  active:
                                      currentIndex == 1 || currentIndex == 2),
                              Indicators(
                                active: currentIndex == 2,
                              )
                            ],
                          ),
                        ),
                        const Gap(20),
                        if (currentIndex == 0 || currentIndex == 1)
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RouteName.selectLocationPage,
                                );
                              },
                              child: TextBody(
                                'Skip>>>',
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: FoodlieColors.foodliePink,
                              ),
                            ),
                          )
                        else
                          BusyButton(
                            title: 'Get Started',
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                RouteName.selectLocationPage,
                                (route) => false,
                              );
                            },
                          ),
                        const Gap(20)
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Indicators extends StatelessWidget {
  const Indicators({
    super.key,
    this.active = false,
  });
  final bool active;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      width: 47,
      decoration: BoxDecoration(
        color: active ? FoodlieColors.foodliePink : FoodlieColors.lightGrey,
      ),
    );
  }
}
