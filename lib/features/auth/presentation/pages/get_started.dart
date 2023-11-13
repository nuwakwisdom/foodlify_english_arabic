import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/app/widgets/input_field.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              TextBold(
                'Let’s get you ready!',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: FoodlieColors.foodliePink,
              ),
              const Gap(14),
              TextBody(
                'Almost ready to get you setup for\nthe best food experience.',
                fontSize: 14,
                color: FoodlieColors.textColor2,
              ),
              const Gap(22),
              TextBody(
                'First Name',
                fontSize: 15,
                color: FoodlieColors.textColor2,
              ),
              const Gap(10),
              InputField(
                controller: TextEditingController(),
                placeholder: 'Enter your firtst name',
                fieldHeight: 45,
              ),
              const Gap(25),
              TextBody(
                'Last Name (Optional)',
                fontSize: 15,
                color: FoodlieColors.textColor2,
              ),
              const Gap(10),
              InputField(
                controller: TextEditingController(),
                placeholder: 'Enter your last name',
                fieldHeight: 45,
              ),
              const Gap(25),
              TextBody(
                'Surname',
                fontSize: 15,
                color: FoodlieColors.textColor2,
              ),
              const Gap(10),
              InputField(
                controller: TextEditingController(),
                placeholder: 'Enter your surname',
                fieldHeight: 45,
              ),
              const Gap(25),
              TextBody(
                'Phone Number',
                fontSize: 15,
                color: FoodlieColors.textColor2,
              ),
              const Gap(10),
              Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffF4F4F4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 45,
                      width: 81,
                      decoration: const BoxDecoration(
                        color: Color(0xffC1C1C1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets.naijaFlag,
                            height: 13,
                            width: 25,
                          ),
                          const Gap(5),
                          TextBody(
                            '+234',
                            fontSize: 13,
                            color: const Color(0xff282727),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: InputField(
                        controller: TextEditingController(),
                        placeholder: 'Enter your phone number',
                        fieldHeight: 45,
                      ),
                    )
                  ],
                ),
              ),
              const Gap(75),
              BusyButton(
                title: 'Done',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteName.orderTracking,
                  );
                },
              ),
              const Gap(20)
            ],
          ),
        ),
      ),
    );
  }
}
