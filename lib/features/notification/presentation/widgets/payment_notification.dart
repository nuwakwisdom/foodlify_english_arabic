import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';

class PaymentNotificationList extends StatelessWidget {
  const PaymentNotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(10, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                height: 54,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: FoodlieColors.foodlieWhite,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 13.32,
                      color: FoodlieColors.foodlieBlack.withOpacity(0.05),
                      offset: const Offset(0, 3.55),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 36,
                            width: 36,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: FoodlieColors.foodliePink,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                AppAssets.gtb,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const Gap(7),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextBold(
                                'OLASUPO Abideen',
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: FoodlieColors.grey,
                              ),
                              TextSemiBold(
                                '07:10am',
                                fontSize: 9,
                                color: FoodlieColors.grey,
                              )
                            ],
                          ),
                        ],
                      ),
                      TextSemiBold(
                        '400,000.00',
                        fontSize: 13,
                        color: FoodlieColors.grey,
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
