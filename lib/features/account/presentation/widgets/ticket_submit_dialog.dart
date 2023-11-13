import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TicketSubmittedDialog extends StatefulWidget {
  const TicketSubmittedDialog({super.key});

  @override
  State<TicketSubmittedDialog> createState() => _TicketSubmittedDialogState();
}

class _TicketSubmittedDialogState extends State<TicketSubmittedDialog> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, RouteName.homeNav, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(32),
              Image.asset(
                AppAssets.orderSuccessfulImg,
                height: 151,
                width: 156,
              ),
              const Gap(20),
              TextBold(
                'Success!',
                fontSize: 20,
                color: FoodlieColors.primaryColor,
              ),
              const Gap(20),
              TextSemiBold(
                'Your feedback is sent Successfully! ',
                fontSize: 13.2,
                color: const Color(0xff534F4F),
              ),
              const Gap(20),
              Image.asset(AppAssets.newSucessLoading),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
