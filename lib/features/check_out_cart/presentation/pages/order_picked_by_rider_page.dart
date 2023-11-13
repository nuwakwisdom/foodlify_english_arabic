import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrderPicked extends StatelessWidget {
  const OrderPicked({super.key});

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
            AppAssets.newRiderImg,
            height: 205,
            width: 308,
          ),
          const Gap(40),
          TextBold(
            'Wohoo!\nYour Order has been\nPicked by the Courier',
            fontSize: 20,
            fontWeight: FontWeight.w800,
            maxLines: 5,
            textAlign: TextAlign.center,
          ),
          const Gap(40),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: BusyButton(
              title: 'Track Order',
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
