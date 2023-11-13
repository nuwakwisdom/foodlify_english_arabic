// ignore_for_file: inference_failure_on_function_invocation, avoid_redundant_argument_values, lines_longer_than_80_chars

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/features/account/presentation/widgets/deactivate_success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DeactivateAccountModal extends StatefulWidget {
  const DeactivateAccountModal({super.key});

  @override
  State<DeactivateAccountModal> createState() => _DeactivateAccountModalState();
}

class _DeactivateAccountModalState extends State<DeactivateAccountModal> {
  bool dontEnjoy = false;
  bool tiredOfScrolling = false;
  bool badServices = false;
  bool others = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Container(
        height: 572,
        width: double.infinity,
        decoration: BoxDecoration(
          color: FoodlieColors.foodlieWhite,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Column(
            children: [
              const Gap(24),
              Container(
                height: 5,
                width: 104,
                color: FoodlieColors.grey1,
              ),
              const Gap(22),
              TextSemiBold(
                'Deactivate Account',
                fontSize: 18,
                color: FoodlieColors.foodlieBlack,
              ),
              const Gap(62),
              DeactivateCheckOption(
                active: dontEnjoy,
                title: 'I  don’t enjoy the services ',
                onTap: () {
                  setState(() {
                    dontEnjoy = !dontEnjoy;
                    tiredOfScrolling = false;
                    badServices = false;
                    others = false;
                  });
                },
              ),
              const Gap(14),
              DeactivateCheckOption(
                active: tiredOfScrolling,
                title: 'i’m tired of scrolling',
                onTap: () {
                  setState(() {
                    dontEnjoy = false;
                    tiredOfScrolling = !tiredOfScrolling;
                    badServices = false;
                    others = false;
                  });
                },
              ),
              const Gap(14),
              DeactivateCheckOption(
                active: badServices,
                title: 'Bad Customer Service',
                onTap: () {
                  setState(() {
                    dontEnjoy = false;
                    tiredOfScrolling = false;
                    badServices = !badServices;
                    others = false;
                  });
                },
              ),
              const Gap(14),
              DeactivateCheckOption(
                active: others,
                title: 'Others',
                onTap: () {
                  setState(() {
                    dontEnjoy = false;
                    tiredOfScrolling = false;
                    badServices = false;
                    others = !others;
                  });
                },
              ),
              const Gap(100),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const DeactivateSuccessDialog();
                    },
                  );
                },
                child: Container(
                  height: 47,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: FoodlieColors.foodliePink,
                  ),
                  child: Center(
                    child: TextBold(
                      'Proceed',
                      fontSize: 16,
                      color: FoodlieColors.foodlieWhite,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DeactivateCheckOption extends StatelessWidget {
  const DeactivateCheckOption({
    super.key,
    required this.active,
    required this.title,
    required this.onTap,
  });
  final bool active;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                width: 3,
                color: active
                    ? FoodlieColors.foodliePink
                    : FoodlieColors.foodlieBlack,
              ),
            ),
            child: active
                ? const Center(
                    child: Icon(
                      Icons.done,
                      color: FoodlieColors.foodliePink,
                      size: 15,
                    ),
                  )
                : const SizedBox(),
          ),
        ),
        const Gap(12),
        TextSemiBold(
          title,
          fontSize: 15,
          color: FoodlieColors.foodlieBlack,
        )
      ],
    );
  }
}
