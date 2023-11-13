import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PickUpTrackOrder extends StatefulWidget {
  const PickUpTrackOrder({super.key});

  @override
  State<PickUpTrackOrder> createState() => _PickUpTrackOrderState();
}

class _PickUpTrackOrderState extends State<PickUpTrackOrder> {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.bikeMan,
            height: 300,
            width: 300,
          ),
          const Gap(22),
          TextSemiBold(
            'Wohoo!, your order is being\npicked up by the courier',
            fontSize: 17,
            color: FoodlieColors.foodlieBlack,
          ),
          const Gap(40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: BusyButton(
              title: 'Track your Order',
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteName.trackOrders,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
