// ignore_for_file: deprecated_member_use

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/app/widgets/input_field.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class NewResetPasswoord extends StatefulWidget {
  const NewResetPasswoord({super.key});

  @override
  State<NewResetPasswoord> createState() => _NewResetPasswoordState();
}

class _NewResetPasswoordState extends State<NewResetPasswoord> {
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
        title: TextBold(
          'Reset Password',
          fontSize: 17,
          color: const Color(0xff363C4F),
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextSemiBold(
                'New Password',
                fontSize: 13,
                color: FoodlieColors.foodlieBlack.withOpacity(0.4),
              ),
              InputField(
                controller: TextEditingController(),
                placeholder: 'New Password',
                prefix: Padding(
                  padding: const EdgeInsets.only(
                    right: 20,
                  ),
                  child: SvgPicture.asset(
                    AppAssets.keyLocked,
                    color: const Color(0xff534F4F).withOpacity(0.4),
                    height: 20,
                    width: 20,
                  ),
                ),
                password: true,
              ),
              const Gap(20),
              TextSemiBold(
                'Confirm Password',
                fontSize: 13,
                color: FoodlieColors.foodlieBlack.withOpacity(0.4),
              ),
              InputField(
                controller: TextEditingController(),
                placeholder: 'Confirm Password',
                prefix: Padding(
                  padding: const EdgeInsets.only(
                    right: 20,
                  ),
                  child: SvgPicture.asset(
                    AppAssets.keyLocked,
                    color: const Color(0xff534F4F).withOpacity(0.4),
                    height: 20,
                    width: 20,
                  ),
                ),
                password: true,
              ),
              const Gap(44),
              BusyButton(
                title: 'Save',
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
