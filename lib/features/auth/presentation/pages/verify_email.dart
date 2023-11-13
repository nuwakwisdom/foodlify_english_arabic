// ignore_for_file: inference_failure_on_function_invocation, lines_longer_than_80_chars

import 'dart:async';

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/sl/sl_container.dart';
import 'package:Foodlify/features/auth/presentation/notifier/auth_notifier.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({
    super.key,
    required this.params,
  });
  final VerifyOtpArgment params;
  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  Duration start = const Duration(minutes: 2);

  bool enableResend = false;
  void startTimer() {
    const onMin = Duration(seconds: 1);
    // ignore: unused_local_variable
    final timer = Timer.periodic(onMin, (timer) {
      final sec = start.inSeconds - 1;
      if (sec < 0) {
        setState(() {
          timer.cancel();
          enableResend = true;
        });
      } else {
        /*setState(() {
          start = Duration(seconds: start.inSeconds - 1);
        });*/
      }
    });
  }

  bool hideResend = false;
  TextEditingController pinController = TextEditingController();
  @override
  void initState() {
    super.initState();
    //startTimer();
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(
      start.inMinutes.remainder(60),
    );
    final seconds = strDigits(
      start.inSeconds.remainder(60),
    );
    return Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(70),
                Align(
                  child: TextBold(
                    'Verify Account',
                    fontSize: 30,
                    color: FoodlieColors.foodlieBlack,
                  ),
                ),
                const Gap(32),
                Align(
                  child: TextBody(
                    'Enter the code sent to ${widget.params.email}',
                    fontSize: 14,
                    maxLines: 10,
                    color: FoodlieColors.grey,
                  ),
                ),
                const Gap(45),
                PinCodeTextField(
                  keyboardType: TextInputType.number,
                  length: 4,
                  cursorColor: FoodlieColors.foodlieBlack,
                  textStyle: GoogleFonts.inter(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: FoodlieColors.foodlieBlack,
                  ),
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 62,
                    fieldWidth: 65,
                    activeFillColor:
                        FoodlieColors.foodlieBlack.withOpacity(0.05),
                    inactiveColor: FoodlieColors.foodlieWhite,
                    inactiveFillColor:
                        FoodlieColors.foodlieBlack.withOpacity(0.05),
                    selectedColor: FoodlieColors.foodlieWhite,
                    selectedFillColor:
                        FoodlieColors.foodlieBlack.withOpacity(0.05),
                    activeColor: FoodlieColors.foodlieWhite,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: FoodlieColors.foodlieWhite,
                  enableActiveFill: true,
                  controller: pinController,
                  onCompleted: (v) {
                    setState(() {
                      hideResend = true;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      hideResend = false;
                    });
                  },
                  beforeTextPaste: (text) {
                    return true;
                  },
                  appContext: context,
                ),
                const Gap(15),
                if (hideResend)
                  const SizedBox()
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Resend code in ',
                          style: GoogleFonts.inter(
                            color: FoodlieColors.foodliePink,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const Gap(5),
                      TimerCountdown(
                        spacerWidth: 0,
                        colonsTextStyle: GoogleFonts.inter(
                          fontSize: 10,
                          color: FoodlieColors.foodliePink,
                        ),
                        timeTextStyle: GoogleFonts.inter(
                          fontSize: 10,
                          color: FoodlieColors.foodliePink,
                        ),
                        format: CountDownTimerFormat.minutesSeconds,
                        minutesDescription: '',
                        secondsDescription: '',
                        endTime: DateTime.now().add(
                          const Duration(
                            minutes: 2,
                            seconds: 0,
                          ),
                        ),
                        onEnd: () {
                          setState(() {
                            enableResend = true;
                          });
                        },
                      ),
                    ],
                  ),
                const Gap(50),
                Align(
                  child: RichText(
                    text: TextSpan(
                      text: "Didn't receive code? ",
                      style: GoogleFonts.inter(
                        color: FoodlieColors.textColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = enableResend
                                ? () {
                                    widget.params.isEmail
                                        ? sl<AuthNotifier>().resendOtpEmail(
                                            context,
                                            email: widget.params.email,
                                          )
                                        : sl<AuthNotifier>().resendOtpSms(
                                            context,
                                            phoneNumber: widget.params.email,
                                          );
                                  }
                                : null,
                          text: 'Request again',
                          style: TextStyle(
                            color: enableResend
                                ? FoodlieColors.foodliePink
                                : FoodlieColors.foodliePink.withOpacity(0.5),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Gap(50),
                BusyButton(
                  busy: sl<AuthNotifier>().isLoading,
                  title: 'Verify Account',
                  onTap: () async {
                    await sl<AuthNotifier>().confirmOtp(
                      context,
                      username: widget.params.email,
                      otp: pinController.text,
                    );

                    /* showDialog(
                        context: context,
                        builder: (context) {
                          return SuccessDialog(
                            successType: 'Sign up Completed',
                            title: 'Email  Adrdress  verified',
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(
                                context,
                                RouteName.setPassword,
                              );
                            },
                          );
                        });*/
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VerifyOtpArgment {
  VerifyOtpArgment({
    required this.email,
    required this.isEmail,
  });
  final String email;
  final bool isEmail;
}
