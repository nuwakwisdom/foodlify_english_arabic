import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:gap/gap.dart';
import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';

class ReceiptDialog extends StatelessWidget {
  const ReceiptDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 500,
        color: FoodlieColors.foodlieWhite,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              const Gap(30),
              TextBold(
                'QT Restaurant',
                fontSize: 19,
                color: FoodlieColors.foodlieBlack,
                fontWeight: FontWeight.w700,
              ),
              const Gap(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(),
                  TextSemiBold(
                    'Items',
                    fontSize: 10,
                    color: FoodlieColors.foodlieBlack,
                  ),
                  const Gap(40),
                  TextSemiBold(
                    'Price',
                    fontSize: 10,
                    color: FoodlieColors.foodlieBlack,
                  ),
                ],
              ),
              const Gap(10),
              const ReceiptProperties(
                name: '1. Chicken Masala',
                items: '1',
                amount: 'N540',
              ),
              const ReceiptProperties(
                name: '2. Chicken Masala',
                items: '1',
                amount: 'N540',
              ),
              const ReceiptProperties(
                name: '3. Chicken Masala',
                items: '1',
                amount: 'N540',
              ),
              const ReceiptProperties(
                name: '4. Chicken Masala',
                items: '1',
                amount: 'N540',
              ),
              const ReceiptProperties(
                name: '5. Chicken Masala',
                items: '1',
                amount: 'N540',
              ),
              const Gap(5),
              Container(
                height: 145.3,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffFAFAFA),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextSemiBold(
                            'Food Price',
                            fontSize: 13,
                            color: FoodlieColors.foodlieBlack.withOpacity(0.42),
                          ),
                          TextSemiBold(
                            'N540',
                            fontSize: 13,
                            color: FoodlieColors.foodlieBlack.withOpacity(0.42),
                          ),
                        ],
                      ),
                      const Gap(9),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextSemiBold(
                            'VAT',
                            fontSize: 13,
                            color: FoodlieColors.foodlieBlack.withOpacity(0.42),
                          ),
                          TextSemiBold(
                            'N540',
                            fontSize: 13,
                            color: FoodlieColors.foodlieBlack.withOpacity(0.42),
                          ),
                        ],
                      ),
                      const Gap(9),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextSemiBold(
                            'Delivery fee',
                            fontSize: 13,
                            color: FoodlieColors.foodlieBlack.withOpacity(0.42),
                          ),
                          TextSemiBold(
                            'N540',
                            fontSize: 13,
                            color: FoodlieColors.foodlieBlack.withOpacity(0.42),
                          ),
                        ],
                      ),
                      const Gap(11),
                      Container(
                        height: 0.39,
                        color: FoodlieColors.grey1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextBold(
                            'Total',
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: FoodlieColors.foodlieBlack.withOpacity(0.42),
                          ),
                          TextBold(
                            'N750',
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: FoodlieColors.foodlieBlack.withOpacity(0.42),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const Gap(5),
              Align(
                alignment: Alignment.topRight,
                child: TextSemiBold(
                  '4:15am\n24/05/2023',
                  fontSize: 11,
                  color: FoodlieColors.grey,
                ),
              ),
              const Gap(13),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.shareIcon,
                      ),
                      TextSemiBold(
                        'Share',
                        fontSize: 14,
                        color: FoodlieColors.foodlieBlack,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.downloadIcon,
                      ),
                      TextSemiBold(
                        'Download',
                        fontSize: 14,
                        color: FoodlieColors.foodlieBlack,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReceiptProperties extends StatelessWidget {
  const ReceiptProperties({
    super.key,
    required this.name,
    required this.items,
    required this.amount,
  });
  final String name;
  final String items;
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextSemiBold(
            name,
            fontSize: 13,
            color: FoodlieColors.foodlieBlack.withOpacity(0.42),
          ),
          TextSemiBold(
            items,
            fontSize: 13,
            color: FoodlieColors.foodlieBlack.withOpacity(0.42),
          ),
          TextSemiBold(
            amount,
            fontSize: 13,
            color: FoodlieColors.foodlieBlack.withOpacity(0.42),
          ),
        ],
      ),
    );
  }
}
