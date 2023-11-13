import 'package:Foodlify/features/account/presentation/pages/support.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constant/constant.dart';

class ComplainTypeModal extends StatefulWidget {
  const ComplainTypeModal({super.key});

  @override
  State<ComplainTypeModal> createState() => _ComplainTypeModalState();
}

class _ComplainTypeModalState extends State<ComplainTypeModal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
          child: Container(
            height: 7,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: FoodlieColors.foodlieWhite,
            ),
          ),
        ),
        const Gap(17),
        Container(
          height: 508,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: FoodlieColors.foodlieWhite,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SupportOptions(
                      icon: AppAssets.orderComplainIcon,
                      title: 'Order',
                      onTap: () {
                        Navigator.pop(context, 'ORDER');
                      },
                    ),
                    const Gap(14),
                    SupportOptions(
                      icon: AppAssets.refundComplain,
                      title: 'Refund',
                      onTap: () {
                        Navigator.pop(context, 'REFUND');
                      },
                    ),
                  ],
                ),
                const Gap(23),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SupportOptions(
                      icon: AppAssets.restaurantComplain,
                      title: 'Restaurant',
                      onTap: () {},
                    ),
                    const Gap(14),
                    SupportOptions(
                      icon: AppAssets.deliveryComplain,
                      title: 'Delivery',
                      onTap: () {
                        Navigator.pop(context, 'DELIVERY');
                      },
                    ),
                  ],
                ),
                const Gap(23),
                SupportOptions(
                  icon: AppAssets.support,
                  title: 'Support',
                  onTap: () {
                    Navigator.pop(context, 'SUPPORT');
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
