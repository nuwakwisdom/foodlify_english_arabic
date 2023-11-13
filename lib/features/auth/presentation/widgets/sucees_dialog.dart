import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';

class SuccessDialog extends StatefulWidget {
  const SuccessDialog({
    super.key,
    required this.title,
    required this.onTap,
    required this.successType,
  });
  final String successType;
  final String title;
  final VoidCallback onTap;
  @override
  State<SuccessDialog> createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 2,
      ),
      widget.onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 369,
        width: 375,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: FoodlieColors.foodlieWhite,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.successImg,
              height: 151,
              width: 156,
              color: FoodlieColors.primaryColor,
            ),
            const Gap(19),
            TextBold(
              widget.successType,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: FoodlieColors.primaryColor,
            ),
            const Gap(20),
            TextSemiBold(
              widget.title,
              fontSize: 13,
              color: FoodlieColors.textColor,
              textAlign: TextAlign.center,
              maxLines: 10,
            ),
            const Gap(20),
            Image.asset(
              AppAssets.successLoad,
              height: 50,
              width: 50,
              color: FoodlieColors.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
