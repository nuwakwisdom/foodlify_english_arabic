// ignore_for_file: inference_failure_on_function_invocation

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class AdvanceSetting extends StatefulWidget {
  const AdvanceSetting({super.key});

  @override
  State<AdvanceSetting> createState() => _AdvanceSettingState();
}

class _AdvanceSettingState extends State<AdvanceSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
      appBar: AppBar(
        backgroundColor: FoodlieColors.foodlieWhite,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: FoodlieColors.foodlieBlack,
          ),
        ),
        title: TextBold(
          'Advance Setting',
          fontSize: 17,
          color: const Color(0xff363C4F),
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(30),
            /*  ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              tileColor: const Color(0xffF5F6F8),
              leading: Container(
                height: 29,
                width: 29,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: FoodlieColors.primaryColor,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.refreshIcon,
                  ),
                ),
              ),
              title: TextBody(
                'Reset Password',
                fontSize: 13,
                color: const Color(0xff676262),
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_right,
                size: 25,
                color: Color(0xff676262),
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteName.newResetPassword,
                );
              },
            ),*/
            const Gap(22),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              tileColor: const Color(0xffF5F6F8),
              leading: Container(
                height: 29,
                width: 29,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: FoodlieColors.primaryColor,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.deleteIcon,
                  ),
                ),
              ),
              title: TextBody(
                'Delete My Account',
                fontSize: 13,
                color: const Color(0xff676262),
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_right,
                size: 25,
                color: Color(0xff676262),
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteName.deletAccount,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
