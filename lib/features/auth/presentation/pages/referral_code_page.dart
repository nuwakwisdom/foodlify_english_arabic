import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/core/constant/app_assets.dart';
import 'package:Foodlify/core/constant/app_colors.dart';
import 'package:Foodlify/core/sl/sl_container.dart';
import 'package:Foodlify/features/auth/presentation/notifier/auth_notifier.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ReferralRegistrationPage extends StatefulWidget {
  const ReferralRegistrationPage({
    required this.params,
    super.key,
  });
  final ReferralCodeParams params;

  @override
  State<ReferralRegistrationPage> createState() =>
      _ReferralRegistrationPageState();
}

class _ReferralRegistrationPageState extends State<ReferralRegistrationPage> {
  final referralCodeTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthNotifier>(context);
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
            children: [
              const Gap(30),
              Align(
                child: Image.asset(
                  AppAssets.newColoredLogo,
                ),
              ),
              const Gap(47),
              Align(
                child: TextBold(
                  'Referral Code',
                  fontSize: 30,
                  color: FoodlieColors.textColor,
                ),
              ),
              const Gap(50),
              const Text(
                'Have an invitation code?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Gap(2),
              const SizedBox(
                width: 192,
                child: Text(
                  '(This is optional)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Gap(2),
              const SizedBox(
                width: 238,
                child: Text(
                  'Don’t know what an invitation code is?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFD654D),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Gap(8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  textAlign: TextAlign.center,
                  cursorColor: FoodlieColors.primaryColor,
                  controller: referralCodeTextEditingController,
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                      color: Color(0x99363C4F),
                      fontSize: 12.40,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 1.40,
                      letterSpacing: 0.17,
                    ),
                    hintText: 'WXR2saaM4ab',
                    focusedBorder: buildOutlineInputBorder(),
                    enabledBorder: buildOutlineInputBorder(),
                    border: buildOutlineInputBorder(),
                  ),
                ),
              ),
              const Gap(2),
              const SizedBox(
                width: 270,
                child: Text(
                  'You can get this code from your inviter. Input the code to get a reward.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 1.54,
                  ),
                ),
              ),
              const Gap(47),
              BusyButton(
                title: 'Continue',
                busy: provider.isLoading,
                onTap: () async {
                  if (widget.params.fromEmail) {
                    await sl<AuthNotifier>().registerWithEmail(
                      context,
                      firstName: widget.params.firstName,
                      lastName: widget.params.lastName,
                      email: widget.params.email!,
                      password: widget.params.password,
                      referralCode:
                          referralCodeTextEditingController.text.trim(),
                    );
                  } else {
                    await sl<AuthNotifier>().registerWithPhone(
                      context,
                      firstName: widget.params.firstName,
                      lastName: widget.params.lastName,
                      password: widget.params.password,
                      phone: '${widget.params.phone}',
                      referralCode:
                          referralCodeTextEditingController.text.trim(),
                    );
                  }
                  /*   Navigator.pushNamed(
                                  context, RouteName.verifyEmailPage);*/
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(
        width: 0.50,
        color: Color(0xFF979899),
      ),
    );
  }
}

class ReferralCodeParams extends Equatable {
  const ReferralCodeParams({
    required this.fromEmail,
    required this.firstName,
    required this.lastName,
    required this.password,
    this.phone,
    this.email,
  });

  final bool fromEmail;
  final String? phone;
  final String? email;
  final String firstName;
  final String lastName;
  final String password;

  @override
  List<Object?> get props => [
        fromEmail,
        phone,
        email,
        firstName,
        lastName,
        password,
      ];
}
