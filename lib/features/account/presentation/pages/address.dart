// ignore_for_file: deprecated_member_use

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class AddressSetting extends StatefulWidget {
  const AddressSetting({super.key});

  @override
  State<AddressSetting> createState() => _AddressSettingState();
}

class _AddressSettingState extends State<AddressSetting> {
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
          'Delivery Address',
          fontSize: 17,
          color: FoodlieColors.foodlieBlack,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          children: [
            const Gap(20),
            ListTile(
              tileColor: const Color(0xffF5F6F8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onTap: () {},
              leading: Container(
                height: 29,
                width: 29,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: FoodlieColors.primaryColor,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.locationIcon2,
                    color: FoodlieColors.foodlieWhite,
                    height: 18,
                    width: 18,
                  ),
                ),
              ),
              title: TextBody(
                'Default Address',
                fontSize: 13,
                color: const Color(0xff676262),
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_right,
                size: 25,
                color: Color(0xff676262),
              ),
            ),
            const Gap(15),
            ListTile(
              tileColor: const Color(0xffF5F6F8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onTap: () {},
              leading: Container(
                height: 29,
                width: 29,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: FoodlieColors.primaryColor,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.locationIcon2,
                    color: FoodlieColors.foodlieWhite,
                    height: 18,
                    width: 18,
                  ),
                ),
              ),
              title: TextBody(
                'Home Address',
                fontSize: 13,
                color: const Color(0xff676262),
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_right,
                size: 25,
                color: Color(0xff676262),
              ),
            ),
            const Gap(15),
            ListTile(
              tileColor: const Color(0xffF5F6F8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onTap: () {},
              leading: Container(
                height: 29,
                width: 29,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: FoodlieColors.primaryColor,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.locationIcon2,
                    color: FoodlieColors.foodlieWhite,
                    height: 18,
                    width: 18,
                  ),
                ),
              ),
              title: TextBody(
                'Office Address',
                fontSize: 13,
                color: const Color(0xff676262),
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_right,
                size: 25,
                color: Color(0xff676262),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
