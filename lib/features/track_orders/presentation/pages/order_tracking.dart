import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:gap/gap.dart';
import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';

class OrderTracking extends StatefulWidget {
  const OrderTracking({super.key});

  @override
  State<OrderTracking> createState() => _OrderTrackingState();
}

class _OrderTrackingState extends State<OrderTracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
      body: Stack(
        children: [
          Image.asset(
            AppAssets.map2,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: FoodlieColors.foodlieWhite,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 36,
                    width: 36,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: FoodlieColors.foodlieWhite,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AppAssets.locationIcon,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: TrackOrderBottomContainer(),
          )
        ],
      ),
    );
  }
}

class TrackOrderBottomContainer extends StatefulWidget {
  const TrackOrderBottomContainer({super.key});

  @override
  State<TrackOrderBottomContainer> createState() =>
      _TrackOrderBottomContainerState();
}

class _TrackOrderBottomContainerState extends State<TrackOrderBottomContainer> {
  bool processing = true;
  bool onTheway = true;
  bool arrived = false;
  bool delivered = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 415,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: FoodlieColors.foodlieWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(25),
            Container(
              height: 4.1,
              width: 63,
              decoration: BoxDecoration(
                color: const Color(0xffE0E0E0),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            const Gap(28),
            SizedBox(
              width: 289,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.done,
                      ),
                      const SizedBox(
                        width: 56,
                        child: DottedLine(
                          dashLength: 2,
                          dashColor: FoodlieColors.grey1,
                          dashGapLength: 1,
                        ),
                      ),
                      if (onTheway)
                        SvgPicture.asset(AppAssets.done)
                      else
                        Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FoodlieColors.grey1,
                            ),
                          ),
                        ),
                      const SizedBox(
                        width: 56,
                        child: DottedLine(
                          dashLength: 2,
                          dashColor: FoodlieColors.grey1,
                          dashGapLength: 1,
                        ),
                      ),
                      if (arrived)
                        SvgPicture.asset(AppAssets.done)
                      else
                        Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FoodlieColors.grey1,
                            ),
                          ),
                        ),
                      const SizedBox(
                        width: 56,
                        child: DottedLine(
                          dashLength: 2,
                          dashColor: FoodlieColors.grey1,
                          dashGapLength: 1,
                        ),
                      ),
                      if (delivered)
                        SvgPicture.asset(AppAssets.done)
                      else
                        Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FoodlieColors.grey1,
                            ),
                          ),
                        )
                    ],
                  ),
                  const Gap(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextSemiBold(
                        'Processing',
                        fontSize: 12,
                        color: FoodlieColors.primaryColor,
                      ),
                      TextSemiBold(
                        'On the way',
                        fontSize: 12,
                        color: FoodlieColors.grey1,
                      ),
                      TextSemiBold(
                        'Arrived',
                        fontSize: 12,
                        color: FoodlieColors.grey1,
                      ),
                      TextSemiBold(
                        'Delivered',
                        fontSize: 12,
                        color: FoodlieColors.grey1,
                      ),
                    ],
                  )
                ],
              ),
            ),
            if (delivered || onTheway || arrived)
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Column(
                  children: [
                    Gap(18),
                    FoodRiderContainer(),
                  ],
                ),
              )
            else
              const SizedBox(),
            const Gap(18),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 29,
                            width: 29,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffFFE8E0),
                            ),
                            child: Center(
                              child: Image.asset(
                                AppAssets.location,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                            child: DottedLine(
                              direction: Axis.vertical,
                              dashLength: 2,
                              dashColor: FoodlieColors.primaryColor,
                              dashGapLength: 1,
                            ),
                          ),
                          Container(
                            height: 29,
                            width: 29,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffFFE8E0),
                            ),
                            child: Center(
                              child: Image.asset(
                                AppAssets.clockImg,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextSemiBold(
                              'Your Address',
                              fontSize: 10,
                              color: const Color(0xff1A0700).withOpacity(0.4),
                            ),
                            TextSemiBold(
                              'Horizenal Road Stree 1178\nIlorin, Kwara Stat',
                              fontSize: 10,
                              color: const Color(0xff1A0700),
                            ),
                            const Gap(25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextSemiBold(
                                      'Delivery Time',
                                      fontSize: 10,
                                      color: const Color(0xff1A0700)
                                          .withOpacity(0.4),
                                    ),
                                    TextSemiBold(
                                      '25 Minutes',
                                      fontSize: 10,
                                      color: const Color(0xff1A0700),
                                    )
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 30,
                                    width: 91,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: FoodlieColors.primaryColor,
                                    ),
                                    child: Center(
                                      child: TextSemiBold(
                                        processing
                                            ? 'Order Placed'
                                            : onTheway
                                                ? 'On the way'
                                                : arrived
                                                    ? 'Arrived'
                                                    : 'Delivered',
                                        fontSize: 11,
                                        color: FoodlieColors.foodlieWhite,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const Gap(29),
                  BusyButton(
                    title: 'View Order Details',
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.rateOrder);
                    },
                  ),
                  const Gap(20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FoodRiderContainer extends StatelessWidget {
  const FoodRiderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.5),
        color: const Color(0xff1A0700),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 11,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 41,
                  width: 43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Image.asset(
                    AppAssets.riderImg,
                    fit: BoxFit.fill,
                  ),
                ),
                const Gap(14.8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextSemiBold(
                      'Ryan Hall',
                      fontSize: 14.48,
                      color: FoodlieColors.foodlieWhite,
                    ),
                    TextSemiBold(
                      'Food Rider',
                      fontSize: 9,
                      color: FoodlieColors.foodlieWhite,
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Container(
                  height: 44,
                  width: 44,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: FoodlieColors.foodlieWhite,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppAssets.messageIcon,
                      color: FoodlieColors.primaryColor,
                    ),
                  ),
                ),
                const Gap(15),
                Container(
                  height: 44,
                  width: 44,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: FoodlieColors.foodlieWhite,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppAssets.phoneIcon,
                      color: FoodlieColors.primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
