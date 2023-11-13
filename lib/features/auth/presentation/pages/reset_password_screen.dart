// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/app/widgets/input_field.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/sl/sl_container.dart';
import 'package:Foodlify/features/auth/presentation/notifier/auth_notifier.dart';
import 'package:provider/provider.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({
    super.key,
    required this.params,
  });
  final ResetPasswordArguement params;
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Consumer<AuthNotifier>(
            builder: (context, v, _) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(30),
                    Align(
                      child: Image.asset(
                        AppAssets.newColoredLogo,
                      ),
                    ),
                    const Gap(50),
                    Align(
                      child: TextBold(
                        'Forgot Password?',
                        fontSize: 20,
                        color: FoodlieColors.textColor,
                      ),
                    ),
                    const Gap(50),
                    if (widget.params.isEmail)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextBody(
                            'Enter your Email',
                            fontSize: 13.35,
                            color: FoodlieColors.textColor,
                          ),
                          const Gap(17),
                          InputField(
                            controller: emailController,
                            placeholder: 'email',
                            textInputType: TextInputType.emailAddress,
                            prefix: Padding(
                              padding: const EdgeInsets.only(
                                right: 10,
                              ),
                              child: SvgPicture.asset(
                                AppAssets.email2,
                                color: FoodlieColors.grey1,
                              ),
                            ),
                          )
                        ],
                      )
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextBody(
                            'Enter your Phone number',
                            fontSize: 13.35,
                            color: FoodlieColors.textColor,
                          ),
                          const Gap(17),
                          InputField(
                            controller: phoneController,
                            placeholder: 'Phone Number',
                            textInputType: TextInputType.number,
                            prefix: Padding(
                              padding: const EdgeInsets.only(
                                right: 10,
                              ),
                              child: SvgPicture.asset(
                                AppAssets.phoneIcon,
                                color: FoodlieColors.grey1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    const Gap(44),
                    BusyButton(
                      busy: v.isLoading,
                      title: 'Continue',
                      onTap: () async {
                        widget.params.isEmail
                            ? await sl<AuthNotifier>().resetPasswordEmail(
                                context,
                                email: emailController.text,
                              )
                            : await sl<AuthNotifier>().resetPasswordPhone(
                                context,
                                phoneNumber: phoneController.text,
                              );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ResetPasswordArguement {
  ResetPasswordArguement({
    required this.isEmail,
  });

  final bool isEmail;
}
