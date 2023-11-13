// ignore_for_file: avoid_print

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/app/widgets/input_field.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PayWithBankWidget extends StatefulWidget {
  const PayWithBankWidget({super.key});

  @override
  State<PayWithBankWidget> createState() => _PayWithBankWidgetState();
}

class _PayWithBankWidgetState extends State<PayWithBankWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(34),
            TextBody(
              'Select bank',
              fontSize: 12,
              color: const Color(0xff3D3D3D),
            ),
            const Gap(10),
            GestureDetector(
              onTap: () {
                print('Select bank');
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: FoodlieColors.foodlieWhite,
                  border: Border.all(
                    color: const Color(0xffDFE2E5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextBody(
                        'Access Bank',
                        fontSize: 10,
                        color: const Color(0xffAAACAE),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: FoodlieColors.grey1,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Gap(20),
            TextBody(
              'Account number',
              fontSize: 12,
              color: const Color(0xff3D3D3D),
            ),
            const Gap(10),
            InputField(
              controller: TextEditingController(),
              placeholder: 'Account Number',
              fieldColor: Colors.transparent,
              validationColor: const Color(0xffDFE2E5),
            ),
            const Gap(20),
            TextBody(
              'BVN',
              fontSize: 12,
              color: const Color(0xff3D3D3D),
            ),
            const Gap(10),
            InputField(
              controller: TextEditingController(),
              placeholder: 'BVN',
              fieldColor: Colors.transparent,
              validationColor: const Color(0xffDFE2E5),
            ),
            const Gap(27),
            BusyButton(
              title: 'Proceed to Payment',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  RouteName.orderPickedPage,
                );
              },
            ),
            const Gap(20)
          ],
        ),
      ),
    );
  }
}
