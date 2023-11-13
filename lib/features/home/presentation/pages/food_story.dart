// ignore_for_file: use_decorated_box

import 'dart:ui';

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FoodStory extends StatefulWidget {
  const FoodStory({super.key});

  @override
  State<FoodStory> createState() => _FoodStoryState();
}

class _FoodStoryState extends State<FoodStory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.foodImg),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 2.5,
                              width: double.infinity,
                              color: FoodlieColors.foodlieWhite,
                            ),
                          ),
                          const Gap(5),
                          Expanded(
                            child: Container(
                              height: 2.5,
                              width: double.infinity,
                              color: FoodlieColors.foodlieBlack,
                            ),
                          ),
                          const Gap(5),
                          Expanded(
                            child: Container(
                              height: 2.5,
                              width: double.infinity,
                              color: FoodlieColors.foodlieBlack,
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Row(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2.5,
                                color: FoodlieColors.foodliePink,
                              ),
                            ),
                            child: Center(
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: FoodlieColors.foodliePink,
                                ),
                                child: Center(
                                  child: TextBold(
                                    'QTS',
                                    fontSize: 10,
                                    color: FoodlieColors.foodlieWhite,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Gap(27),
                          TextSemiBold(
                            'Qtss Restaurant',
                            fontSize: 16,
                            color: FoodlieColors.foodlieBlack,
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 327,
                    width: 297,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27),
                    ),
                    child: Image.asset(
                      AppAssets.foodImg,
                      height: double.infinity,
                      width: 297,
                      fit: BoxFit.cover,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 56,
                      width: 218,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: FoodlieColors.foodliePink,
                      ),
                      child: Center(
                        child: TextBold(
                          'Order Now',
                          fontSize: 20,
                          color: FoodlieColors.foodlieWhite,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
