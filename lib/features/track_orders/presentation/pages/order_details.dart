import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
      appBar: AppBar(
        backgroundColor: FoodlieColors.foodlieWhite,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: FoodlieColors.foodlieBlack,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              TextBold(
                'Order details',
                fontSize: 35,
                color: const Color(0xff06161C),
                fontWeight: FontWeight.w700,
              ),
              const Gap(33),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextSemiBold(
                    'Order ID',
                    fontSize: 22,
                    color: const Color(0xff06161C),
                  ),
                  TextSemiBold(
                    '#1398',
                    fontSize: 13,
                    color: FoodlieColors.grey,
                  )
                ],
              ),
              const Gap(43),
              OrderDetailsContainer(
                foodName: 'Chicken Gizzard',
                quantiy: 'x1',
                amount: '₦900',
                backGroundColor: FoodlieColors.foodliePink.withOpacity(
                  0.05,
                ),
              ),
              const Gap(9),
              OrderDetailsContainer(
                foodName: 'Token Chicken',
                quantiy: 'x1',
                amount: '₦900',
                backGroundColor: FoodlieColors.foodlieBlack.withOpacity(
                  0.05,
                ),
              ),
              const Gap(9),
              OrderDetailsContainer(
                foodName: 'Value Tomatoes',
                quantiy: 'x1',
                amount: '₦900',
                backGroundColor: FoodlieColors.foodlieBlack.withOpacity(
                  0.05,
                ),
              ),
              const Gap(9),
              OrderDetailsContainer(
                foodName: 'Chicken Gizzard',
                quantiy: 'x1',
                amount: '₦900',
                backGroundColor: FoodlieColors.foodliePink.withOpacity(
                  0.05,
                ),
              ),
              const Gap(9),
              OrderDetailsContainer(
                foodName: 'Token Chicken',
                quantiy: 'x1',
                amount: '₦900',
                backGroundColor: FoodlieColors.foodlieBlack.withOpacity(
                  0.05,
                ),
              ),
              const Gap(9),
              OrderDetailsContainer(
                foodName: 'Chicken Gizzard',
                quantiy: 'x1',
                amount: '₦900',
                backGroundColor: FoodlieColors.foodliePink.withOpacity(
                  0.05,
                ),
              ),
              const Gap(44),
              const ReceiptContainer(
                subtotal: '₦1,980',
                deliveryFee: '₦180',
                total: '₦2,280',
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}

class ReceiptContainer extends StatelessWidget {
  const ReceiptContainer({
    super.key,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  });
  final String subtotal;
  final String deliveryFee;
  final String total;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 163,
      width: 317,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xff646464).withOpacity(0.2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextSemiBold(
                  'Subtotal',
                  fontSize: 12,
                  color: const Color(0xff9D9693),
                ),
                TextBody(
                  subtotal,
                  fontSize: 12,
                  color: const Color(0xff9D9693),
                )
              ],
            ),
            const Gap(9),
            const SizedBox(
              width: double.infinity,
              child: DottedLine(
                dashColor: FoodlieColors.grey1,
                dashGapLength: 3,
              ),
            ),
            const Gap(19),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextSemiBold(
                  'Delivery',
                  fontSize: 12,
                  color: const Color(0xff9D9693),
                ),
                TextBody(
                  deliveryFee,
                  fontSize: 12,
                  color: const Color(0xff9D9693),
                )
              ],
            ),
            const Gap(9),
            const SizedBox(
              width: double.infinity,
              child: DottedLine(
                dashColor: FoodlieColors.grey1,
                dashGapLength: 3,
              ),
            ),
            const Gap(19),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextSemiBold(
                  'Total',
                  fontSize: 14,
                  color: const Color(0xff1A0700),
                ),
                TextSemiBold(
                  total,
                  fontSize: 14,
                  color: const Color(0xff1A0700),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class OrderDetailsContainer extends StatelessWidget {
  const OrderDetailsContainer({
    super.key,
    required this.foodName,
    required this.quantiy,
    required this.amount,
    required this.backGroundColor,
  });
  final String foodName;
  final String quantiy;
  final String amount;
  final Color backGroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 11,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextBody(
              foodName,
              fontSize: 12,
              color: FoodlieColors.foodlieBlack,
            ),
            TextBody(
              quantiy,
              fontSize: 12,
              color: FoodlieColors.foodlieBlack,
            ),
            TextBody(
              amount,
              fontSize: 12,
              color: FoodlieColors.foodlieBlack,
            ),
          ],
        ),
      ),
    );
  }
}
