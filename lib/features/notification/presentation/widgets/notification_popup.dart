import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NotificationPopUp extends StatefulWidget {
  const NotificationPopUp({
    super.key,
    required this.title,
    required this.content,
    required this.id,
  });
  final String title;
  final String content;
  final int id;
  @override
  State<NotificationPopUp> createState() => _NotificationPopUpState();
}

class _NotificationPopUpState extends State<NotificationPopUp> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(20),
              TextBold(
                widget.title,
                maxLines: 1000,
                fontSize: 14,
                color: FoodlieColors.textColor,
              ),
              const Gap(20),
              TextSemiBold(
                widget.content,
                maxLines: 1000,
                fontSize: 14,
                color: FoodlieColors.textColor,
                textAlign: TextAlign.center,
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
