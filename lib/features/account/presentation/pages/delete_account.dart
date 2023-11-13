// ignore_for_file: inference_failure_on_function_invocation

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/features/account/presentation/widgets/deactivate_success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({super.key});

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  bool appIsDifficult = false;
  bool badDelivery = false;
  bool foooAreTastelless = false;
  bool badCustomerService = false;
  bool notToSay = false;
  bool others = false;
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
          'Delete Account',
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
            children: [
              const Gap(30),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        appIsDifficult = !appIsDifficult;
                        badCustomerService = false;
                        foooAreTastelless = false;
                        badDelivery = false;
                        notToSay = false;
                        others = false;
                      });
                    },
                    child: Container(
                      height: 21,
                      width: 21,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: appIsDifficult
                              ? FoodlieColors.primaryColor
                              : const Color(0xff676262),
                        ),
                      ),
                      child: appIsDifficult
                          ? const Center(
                              child: Icon(
                                Icons.done,
                                size: 15,
                                color: FoodlieColors.primaryColor,
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ),
                  const Gap(15),
                  TextBody(
                    'The app is difficult to navigate',
                    fontSize: 13,
                    color: const Color(0xff676262),
                  )
                ],
              ),
              const Gap(23),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        badDelivery = !badDelivery;
                        appIsDifficult = false;
                        foooAreTastelless = false;
                        badCustomerService = false;
                        notToSay = false;
                        others = false;
                      });
                    },
                    child: Container(
                      height: 21,
                      width: 21,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: badDelivery
                              ? FoodlieColors.primaryColor
                              : const Color(0xff676262),
                        ),
                      ),
                      child: badDelivery
                          ? const Center(
                              child: Icon(
                                Icons.done,
                                size: 15,
                                color: FoodlieColors.primaryColor,
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ),
                  const Gap(15),
                  TextBody(
                    'Bad delivery service',
                    fontSize: 13,
                    color: const Color(0xff676262),
                  )
                ],
              ),
              const Gap(23),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        foooAreTastelless = !foooAreTastelless;
                        appIsDifficult = false;
                        badCustomerService = false;
                        badDelivery = false;
                        notToSay = false;
                        others = false;
                      });
                    },
                    child: Container(
                      height: 21,
                      width: 21,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: foooAreTastelless
                              ? FoodlieColors.primaryColor
                              : const Color(0xff676262),
                        ),
                      ),
                      child: foooAreTastelless
                          ? const Center(
                              child: Icon(
                                Icons.done,
                                size: 15,
                                color: FoodlieColors.primaryColor,
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ),
                  const Gap(15),
                  TextBody(
                    'Most food are tasteless',
                    fontSize: 13,
                    color: const Color(0xff676262),
                  )
                ],
              ),
              const Gap(23),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        badCustomerService = !badCustomerService;
                        badDelivery = false;
                        appIsDifficult = false;
                        foooAreTastelless = false;
                        notToSay = false;
                        others = false;
                      });
                    },
                    child: Container(
                      height: 21,
                      width: 21,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: badCustomerService
                              ? FoodlieColors.primaryColor
                              : const Color(0xff676262),
                        ),
                      ),
                      child: badCustomerService
                          ? const Center(
                              child: Icon(
                                Icons.done,
                                size: 15,
                                color: FoodlieColors.primaryColor,
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ),
                  const Gap(15),
                  TextBody(
                    'Bad customer service',
                    fontSize: 13,
                    color: const Color(0xff676262),
                  )
                ],
              ),
              const Gap(23),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        notToSay = !notToSay;
                        badDelivery = false;
                        appIsDifficult = false;
                        foooAreTastelless = false;
                        badCustomerService = false;
                        others = false;
                      });
                    },
                    child: Container(
                      height: 21,
                      width: 21,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: notToSay
                              ? FoodlieColors.primaryColor
                              : const Color(0xff676262),
                        ),
                      ),
                      child: notToSay
                          ? const Center(
                              child: Icon(
                                Icons.done,
                                size: 15,
                                color: FoodlieColors.primaryColor,
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ),
                  const Gap(15),
                  TextBody(
                    'I prefer not to say',
                    fontSize: 13,
                    color: const Color(0xff676262),
                  )
                ],
              ),
              const Gap(23),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        others = !others;
                        notToSay = false;
                        badDelivery = false;
                        appIsDifficult = false;
                        foooAreTastelless = false;
                        badCustomerService = false;
                      });
                    },
                    child: Container(
                      height: 21,
                      width: 21,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: others
                              ? FoodlieColors.primaryColor
                              : const Color(0xff676262),
                        ),
                      ),
                      child: others
                          ? const Center(
                              child: Icon(
                                Icons.done,
                                size: 15,
                                color: FoodlieColors.primaryColor,
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ),
                  const Gap(15),
                  TextBody(
                    'Others',
                    fontSize: 13,
                    color: const Color(0xff676262),
                  )
                ],
              ),
              const Gap(58),
              BusyButton(
                title: 'Delete',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const DeactivateSuccessDialog();
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
