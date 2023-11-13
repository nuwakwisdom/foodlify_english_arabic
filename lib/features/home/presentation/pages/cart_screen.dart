// ignore_for_file: inference_failure_on_function_invocation, inference_failure_on_function_return_type, lines_longer_than_80_chars

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:Foodlify/features/home/presentation/widgets/delivery_mode_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
      appBar: AppBar(
        backgroundColor: FoodlieColors.foodlieWhite,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: FoodlieColors.foodlieBlack,
          ),
        ),
        title: TextBold(
          'Cart',
          fontSize: 17,
          color: FoodlieColors.foodlieBlack,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 89,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffFFE8E0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextBold(
                            'Deliver to',
                            fontSize: 16,
                            color: FoodlieColors.grey,
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(32),
                                    topRight: Radius.circular(32),
                                  ),
                                ),
                                context: context,
                                builder: (context) {
                                  return const DeliveryMode(
                                    directOrder: false,
                                    name: '',
                                  );
                                },
                              );
                            },
                            child: Row(
                              children: [
                                TextBold(
                                  'Change',
                                  fontSize: 12,
                                  color: FoodlieColors.foodlieBlack,
                                ),
                                SvgPicture.asset(
                                  AppAssets.change,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const Gap(5),
                      TextBold(
                        'Zaria Road, Abuja',
                        fontSize: 20,
                        color: FoodlieColors.foodlieBlack,
                      )
                    ],
                  ),
                ),
              ),
              const Gap(20),
              Column(
                children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 7,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FoodlieColors.foodlieWhite,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: FoodlieColors.foodlieBlack.withOpacity(0.05),
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                      height: 54,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBold(
                                  'Chicken Matsala',
                                  fontSize: 16,
                                  color: FoodlieColors.foodlieBlack,
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 18,
                                        width: 18,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.remove,
                                            size: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Gap(10),
                                    TextBold(
                                      '1',
                                      fontSize: 16,
                                      color: FoodlieColors.foodlieBlack,
                                    ),
                                    const Gap(10),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 18,
                                        width: 18,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.add,
                                            size: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Gap(5),
                            TextBold(
                              'N 2,300',
                              fontSize: 12.15,
                              color: FoodlieColors.foodliePink,
                              fontWeight: FontWeight.w800,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const Gap(18),
              TextBold(
                'Payment Summary',
                fontSize: 15,
                color: FoodlieColors.foodlieBlack,
              ),
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextSemiBold(
                    'Food Price',
                    fontSize: 18,
                    color: FoodlieColors.foodlieBlack.withOpacity(0.42),
                  ),
                  TextSemiBold(
                    'N1,080',
                    fontSize: 12,
                    color: FoodlieColors.foodlieBlack.withOpacity(0.42),
                  )
                ],
              ),
              const Gap(18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextSemiBold(
                    'Delivery fee',
                    fontSize: 18,
                    color: FoodlieColors.foodlieBlack.withOpacity(0.42),
                  ),
                  TextSemiBold(
                    'N540',
                    fontSize: 12,
                    color: FoodlieColors.foodlieBlack.withOpacity(0.42),
                  )
                ],
              ),
              const Gap(19),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextBold(
                    'Total',
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: FoodlieColors.grey,
                  ),
                  TextBold(
                    'N1,830',
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: FoodlieColors.grey,
                  ),
                ],
              ),
              const Gap(42),
              BusyButton(
                title: 'N750 checkout',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteName.cartProceed,
                  );
                },
              ),
              const Gap(22),
              Align(
                child: TextSemiBold(
                  'Go to Wallet',
                  fontSize: 12,
                  color: FoodlieColors.foodlieBlack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
