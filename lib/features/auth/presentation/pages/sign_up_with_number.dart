// ignore_for_file: avoid_print, lines_longer_than_80_chars

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/app/widgets/input_field.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:Foodlify/core/sl/sl_container.dart';
import 'package:Foodlify/features/auth/domain/usecases/register_with_phone_usecase.dart';
import 'package:Foodlify/features/auth/presentation/cubit/register_number_cubit.dart';
import 'package:Foodlify/features/auth/presentation/notifier/auth_notifier.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpWithNumber extends StatefulWidget {
  const SignUpWithNumber({super.key});

  @override
  State<SignUpWithNumber> createState() => _SignUpWithNumberState();
}

class _SignUpWithNumberState extends State<SignUpWithNumber> {
  TextEditingController password = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool busyButton = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterNumberCubit(
        registerWithPhoneUsecase: sl<RegisterWithPhoneUsecase>(),
      ),
      child: Scaffold(
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
                            const Gap(30),
                            TextBold(
                              'Sign Up with\nPhone Number',
                              fontSize: 38,
                              fontWeight: FontWeight.w700,
                              color: FoodlieColors.textColor,
                            ),
                            const Gap(40),
                            TextBody(
                              'Enter Your Phone Number',
                              fontSize: 13.35,
                              color: FoodlieColors.foodlieBlack,
                            ),
                            const Gap(12),
                            InputField(
                              controller: phoneController,
                              textInputType: TextInputType.number,
                              placeholder: 'Phone Number',
                            ),
                            const Gap(33),
                            TextBody(
                              'Enter Your Password',
                              fontSize: 13.35,
                              color: FoodlieColors.foodlieBlack,
                            ),
                            const Gap(12),
                            InputField(
                              controller: password,
                              placeholder: 'Password',
                              password: true,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            BlocConsumer<RegisterNumberCubit,
                                RegisterNumberState>(
                              listener: (context, state) {
                                state.maybeWhen(
                                  orElse: () {},
                                  loading: () {
                                    setState(() {
                                      busyButton = true;
                                    });
                                  },
                                  registered: () {
                                    setState(() {
                                      busyButton = false;
                                    });
                                  },
                                  error: (e) {
                                    setState(() {
                                      busyButton = false;
                                      print(e);
                                    });
                                  },
                                );
                              },
                              builder: (context, state) {
                                return BusyButton(
                                  title: 'Next',
                                  busy: busyButton,
                                  onTap: () async {
                                    /*  await context
                                        .read<RegisterNumberCubit>()
                                        .registerPhoneNumber(
                                          phoneNumber: phoneController.text,
                                          password: password.text,
                                        );*/
                                    /* await sl<AuthNotifier>().registerWithPhone(
                                      context,
                                      phone: '234${phoneController.text}',
                                      password: password.text,
                                    );*/
                                    /*  Navigator.pushNamed(
                                                                    context, RouteName.verifyEmailPage);*/
                                  },
                                );
                              },
                            ),
                            const Gap(30),
                            RichText(
                              text: TextSpan(
                                text: 'Already have an account?',
                                style: GoogleFonts.inter(
                                  fontSize: 13.35,
                                  fontWeight: FontWeight.w300,
                                  color: const Color(0xff282727),
                                ),
                                children: [
                                  TextSpan(
                                    text: ' Sign in',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(
                                          context,
                                          RouteName.loginScreen,
                                        );
                                      },
                                    style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: FoodlieColors.foodliePink,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Gap(20)
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
