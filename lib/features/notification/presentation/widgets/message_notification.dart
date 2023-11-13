// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';

class MessageNotification extends StatelessWidget {
  const MessageNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(4),
            Container(
              height: 1,
              color: FoodlieColors.grey,
            ),
            const Gap(9),
            Column(
              children: List.generate(6, (index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 9,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 156,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: const Color(0xffE1E5E7),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextBold(
                                'Free Delivery Offer',
                                fontSize: 15,
                                color: FoodlieColors.foodlieBlack,
                                fontWeight: FontWeight.w700,
                              ),
                              const Gap(15),
                              TextSemiBold(
                                'Congratulations! you have recieved Free delivery offer, Use now before ot expires>>',
                                maxLines: 20,
                                fontSize: 15,
                                color: FoodlieColors.foodlieBlack,
                              ),
                              const Gap(17),
                              Container(
                                height: 1,
                                width: double.infinity,
                                color: FoodlieColors.grey,
                              ),
                              const Gap(11),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextSemiBold(
                                    '10:17am',
                                    fontSize: 15,
                                    color: FoodlieColors.foodlieBlack,
                                  ),
                                  TextSemiBold(
                                    'View all >',
                                    fontSize: 15,
                                    color: FoodlieColors.foodlieBlack,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const Gap(17),
                      Container(
                        height: 1,
                        color: FoodlieColors.grey,
                      ),
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
