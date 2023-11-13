// ignore_for_file: inference_failure_on_function_invocation

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/input_field.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/features/home/presentation/widgets/buy_succrss_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CheckOutModal extends StatefulWidget {
  const CheckOutModal({super.key});

  @override
  State<CheckOutModal> createState() => _CheckOutModalState();
}

class _CheckOutModalState extends State<CheckOutModal> {
  bool withCard = true;
  bool withBank = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: FoodlieColors.foodlieWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          const Gap(24),
          Container(
            height: 5,
            width: 104,
            color: FoodlieColors.grey,
          ),
          const Gap(12),
          TextSemiBold(
            'qtssolution@gmail.com',
            fontSize: 15,
            color: FoodlieColors.foodlieBlack,
          ),
          const Gap(9),
          TextBold(
            'NGN 750',
            fontSize: 15,
            color: const Color(0xff27790A),
          ),
          const Gap(29),
          Container(
            height: 41,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: FoodlieColors.grey,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        withCard = true;
                        withBank = false;
                      });
                    },
                    child: Container(
                      height: 41,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: withCard
                            ? const Color(0xffD9D9D9)
                            : FoodlieColors.foodlieWhite,
                      ),
                      child: Center(
                        child: TextBold(
                          'PAY WITH CARD',
                          fontSize: 13,
                          color: FoodlieColors.foodlieBlack,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        withBank = true;
                        withCard = false;
                      });
                    },
                    child: Container(
                      height: 41,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: withBank
                            ? const Color(0xffD9D9D9)
                            : FoodlieColors.foodlieWhite,
                      ),
                      child: Center(
                        child: TextBold(
                          'PAY WITH Bank',
                          fontSize: 13,
                          color: FoodlieColors.foodlieBlack,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Gap(11),
          if (withCard)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                children: [
                  InputField(
                    controller: TextEditingController(),
                    placeholder: 'Card Number',
                    fieldColor: FoodlieColors.foodlieWhite,
                    validationColor: FoodlieColors.grey,
                    prefix: Padding(
                      padding: const EdgeInsets.only(
                        right: 5,
                      ),
                      child: SvgPicture.asset(
                        AppAssets.cardIcon,
                      ),
                    ),
                  ),
                  const Gap(15),
                  Row(
                    children: [
                      Expanded(
                        child: InputField(
                          controller: TextEditingController(),
                          placeholder: 'Card  Expiry',
                          prefix: Padding(
                            padding: const EdgeInsets.only(
                              right: 5,
                            ),
                            child: SvgPicture.asset(
                              AppAssets.calenderIcon,
                            ),
                          ),
                          fieldColor: FoodlieColors.foodlieWhite,
                          validationColor: FoodlieColors.grey,
                        ),
                      ),
                      const Gap(5),
                      Expanded(
                        child: InputField(
                          controller: TextEditingController(),
                          placeholder: 'CVV',
                          prefix: Padding(
                            padding: const EdgeInsets.only(
                              right: 5,
                            ),
                            child: SvgPicture.asset(
                              AppAssets.keyLocked,
                            ),
                          ),
                          fieldColor: FoodlieColors.foodlieWhite,
                          validationColor: FoodlieColors.grey,
                        ),
                      ),
                    ],
                  ),
                  const Gap(17),
                  InputField(
                    controller: TextEditingController(),
                    placeholder: 'Pin',
                    fieldColor: FoodlieColors.foodlieWhite,
                    validationColor: FoodlieColors.grey,
                    prefix: SvgPicture.asset(
                      AppAssets.keyOpen,
                    ),
                  ),
                  const Gap(8),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return const BuySuccessModal();
                        },
                      );
                    },
                    child: Container(
                      height: 53,
                      width: 287,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: FoodlieColors.foodliePink,
                      ),
                      child: Center(
                        child: TextBold(
                          'Pay NGN 750',
                          fontSize: 15,
                          color: FoodlieColors.foodlieWhite,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                children: [
                  InputField(
                    controller: TextEditingController(),
                    placeholder: 'Select Bank',
                    prefix: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: SvgPicture.asset(
                        AppAssets.bankIcon,
                      ),
                    ),
                    fieldColor: FoodlieColors.foodlieWhite,
                    validationColor: FoodlieColors.grey,
                  ),
                  const Gap(15),
                  InputField(
                    controller: TextEditingController(),
                    placeholder: 'Enter your Bank Account',
                    fieldColor: FoodlieColors.foodlieWhite,
                    validationColor: FoodlieColors.grey,
                  ),
                  const Gap(15),
                  InputField(
                    controller: TextEditingController(),
                    placeholder: 'BVN',
                    fieldColor: FoodlieColors.foodlieWhite,
                    validationColor: FoodlieColors.grey,
                  ),
                  const Gap(8),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return const BuySuccessModal();
                        },
                      );
                    },
                    child: Container(
                      height: 53,
                      width: 287,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: FoodlieColors.foodliePink,
                      ),
                      child: Center(
                        child: TextBold(
                          'Pay NGN 750',
                          fontSize: 15,
                          color: FoodlieColors.foodlieWhite,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
