import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/core/constant/app_colors.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TicketOptionModal extends StatelessWidget {
  const TicketOptionModal({super.key});

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
                BusyButton(
                  title: 'Create Ticket',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(
                      context,
                      RouteName.ticketingPage,
                    );
                  },
                ),
                const Gap(59),
                BusyButton(
                  title: 'Ticket History',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, RouteName.ticketHistory);
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
