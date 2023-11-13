import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TrackOrders extends StatefulWidget {
  const TrackOrders({super.key});

  @override
  State<TrackOrders> createState() => _TrackOrdersState();
}

class _TrackOrdersState extends State<TrackOrders> {
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
            color: FoodlieColors.textColor,
          ),
        ),
        title: TextSemiBold(
          'Delivery Status',
          fontSize: 14,
          color: FoodlieColors.textColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 34,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Gap(30),
                Row(
                  children: [
                    Container(
                      height: 28,
                      width: 28,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff27790A),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.done,
                          size: 15,
                          color: FoodlieColors.foodlieWhite,
                        ),
                      ),
                    ),
                    const Gap(24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 23,
                          width: 115,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: const Color(0xff27790A),
                          ),
                          child: Center(
                            child: TextSemiBold(
                              'Order Placed',
                              fontSize: 13,
                              color: FoodlieColors.foodlieWhite,
                            ),
                          ),
                        ),
                        const Gap(10),
                        TextBody(
                          '16-03-2023',
                          fontSize: 13,
                          color: FoodlieColors.textColor2,
                        )
                      ],
                    ),
                  ],
                ),
                const Gap(40),
                Row(
                  children: [
                    Container(
                      height: 28,
                      width: 28,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff27790A),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.done,
                          size: 15,
                          color: FoodlieColors.foodlieWhite,
                        ),
                      ),
                    ),
                    const Gap(24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 23,
                          width: 224,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: const Color(0xff27790A),
                          ),
                          child: Center(
                            child: TextSemiBold(
                              'Order picked from the Restaurant',
                              fontSize: 13,
                              color: FoodlieColors.foodlieWhite,
                            ),
                          ),
                        ),
                        const Gap(10),
                        TextBody(
                          '16-03-2023',
                          fontSize: 13,
                          color: FoodlieColors.textColor2,
                        )
                      ],
                    ),
                  ],
                ),
                const Gap(40),
                Row(
                  children: [
                    Container(
                      height: 28,
                      width: 28,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: FoodlieColors.grey1,
                      ),
                      child: Center(
                          child: Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: FoodlieColors.grey1,
                            border: Border.all(
                                width: 2, color: FoodlieColors.foodlieWhite)),
                      )),
                    ),
                    const Gap(24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 23,
                          width: 148,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: FoodlieColors.grey1,
                          ),
                          child: Center(
                            child: TextSemiBold(
                              'Pending Confirmation',
                              fontSize: 13,
                              color: FoodlieColors.foodlieWhite,
                            ),
                          ),
                        ),
                        const Gap(10),
                        TextBody(
                          '16-03-2023',
                          fontSize: 13,
                          color: FoodlieColors.textColor2,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                BusyButton(
                  title: 'Track Order',
                  onTap: () {},
                ),
                const Gap(30),
              ],
            )
          ],
        ),
      ),
    );
  }
}
