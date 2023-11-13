import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/app/widgets/input_field.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/sl/sl_container.dart';
import 'package:Foodlify/features/auth/presentation/notifier/auth_notifier.dart';
import 'package:provider/provider.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({
    super.key,
    required this.params,
  });
  final SetPasswordArguement params;
  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  TextEditingController tokenController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Consumer<AuthNotifier>(
                  builder: (context, _, snapshot) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(20),
                            TextBold(
                              'Change Password',
                              fontSize: 19,
                              color: FoodlieColors.foodlieBlack,
                              fontWeight: FontWeight.w700,
                            ),
                            const Gap(17),
                            TextBody(
                              'Token',
                              fontSize: 13,
                              color: FoodlieColors.textColor2,
                            ),
                            const Gap(9),
                            InputField(
                              controller: tokenController,
                              placeholder: 'Enter Your Token',
                            ),
                            const Gap(17),
                            TextBody(
                              'New Password',
                              fontSize: 13,
                              color: FoodlieColors.textColor2,
                            ),
                            const Gap(9),
                            InputField(
                              password: true,
                              controller: newPasswordController,
                              placeholder: 'New Password',
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            BusyButton(
                              title: 'Done',
                              busy: _.isLoading,
                              onTap: () async {
                                await sl<AuthNotifier>().changePasswordEmail(
                                  context,
                                  email: widget.params.email,
                                  token: tokenController.text,
                                  newPassword: newPasswordController.text,
                                );
                              },
                            ),
                            const Gap(20),
                          ],
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SetPasswordArguement {
  SetPasswordArguement({
    required this.email,
  });

  final String email;
}
