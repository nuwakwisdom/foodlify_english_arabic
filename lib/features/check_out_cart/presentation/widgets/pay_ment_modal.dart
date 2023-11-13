import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/features/check_out_cart/presentation/widgets/pay_with_bank_widgett.dart';
import 'package:Foodlify/features/check_out_cart/presentation/widgets/pay_with_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PaymentModal extends StatefulWidget {
  const PaymentModal({super.key});

  @override
  State<PaymentModal> createState() => _PaymentModalState();
}

class _PaymentModalState extends State<PaymentModal> {
  bool payWithhBank = false;
  bool payWithCard = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 6,
          width: 59,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: FoodlieColors.foodlieWhite,
          ),
        ),
        const Gap(16),
        Container(
          height: payWithCard ? 459 : 532,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            color: FoodlieColors.foodlieWhite,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(30),
              Align(
                child: TextSemiBold(
                  'qtssolution@gmail.com',
                  color: FoodlieColors.grey1,
                ),
              ),
              const Gap(22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          payWithCard = true;
                          payWithhBank = false;
                        });
                      },
                      child: Column(
                        children: [
                          TextBody(
                            'Pay with Card',
                            fontSize: 14,
                            color: payWithCard
                                ? FoodlieColors.primaryColor
                                : FoodlieColors.grey1,
                          ),
                          const Gap(16),
                          Container(
                            height: 3,
                            width: double.infinity,
                            color: payWithCard
                                ? FoodlieColors.primaryColor
                                : FoodlieColors.grey1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          payWithCard = false;
                          payWithhBank = true;
                        });
                      },
                      child: Column(
                        children: [
                          TextBody(
                            'Pay with Bank',
                            fontSize: 14,
                            color: payWithhBank
                                ? FoodlieColors.primaryColor
                                : FoodlieColors.grey1,
                          ),
                          const Gap(16),
                          Container(
                            height: 3,
                            width: double.infinity,
                            color: payWithhBank
                                ? FoodlieColors.primaryColor
                                : FoodlieColors.grey1,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              if (payWithCard)
                const PayWithCardWidget()
              else
                const Expanded(child: PayWithBankWidget()),
            ],
          ),
        )
      ],
    );
  }
}
