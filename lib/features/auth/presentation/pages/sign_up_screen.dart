// ignore_for_file: file_names, deprecated_member_use, unawaited_futures

import 'dart:async';

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/app/widgets/input_field.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:Foodlify/core/utils/custom_form_validator.dart';
import 'package:Foodlify/features/auth/presentation/notifier/auth_notifier.dart';
import 'package:Foodlify/features/auth/presentation/pages/referral_code_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
    required this.params,
  });
  final SignUpArguement params;
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController lastNameCoontroller = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  final ValueNotifier<bool> _canSubmit = ValueNotifier(false);
  late StreamController<String> _firstNameStreamController;
  late StreamController<String> _lastNameStreamController;
  late StreamController<String> _phoneNumberStreamController;
  late StreamController<String> _emailStreamController;
  late StreamController<String> _passwordStreamController;
  final emailFocus = FocusNode();
  final firstNameFocus = FocusNode();
  final phoneNumberFocus = FocusNode();
  final lastNameFocus = FocusNode();
  final passwordFocus = FocusNode();
  @override
  void initState() {
    super.initState();
    _firstNameStreamController = StreamController.broadcast();
    _lastNameStreamController = StreamController.broadcast();
    _phoneNumberStreamController = StreamController.broadcast();
    _emailStreamController = StreamController.broadcast();
    _passwordStreamController = StreamController.broadcast();
    firstNameController.addListener(() {
      _firstNameStreamController.sink.add(
        firstNameController.text.trim(),
      );
      validateInputs();
    });
    lastNameCoontroller.addListener(() {
      _lastNameStreamController.sink.add(
        lastNameCoontroller.text.trim(),
      );
      validateInputs();
    });
    emailController.addListener(() {
      _emailStreamController.sink.add(
        emailController.text.trim(),
      );
      validateInputs();
    });
    phoneController.addListener(() {
      _phoneNumberStreamController.sink.add(
        phoneController.text.trim(),
      );
      validateInputs();
    });
    passwordController.addListener(() {
      _passwordStreamController.sink.add(
        passwordController.text.trim(),
      );
      validateInputs();
    });
  }

  void validateInputs() {
    var canSumit = true;
    final emailError = CustomFormValidation.errorEmailMessage(
      emailController.text.trim(),
      'Email is required',
    );
    final passwordError = CustomFormValidation.errorMessagePassword(
      passwordController.text.trim(),
      'Invalid password',
    );
    final phoneError = CustomFormValidation.errorPhoneNumber2(
      phoneController.text.trim(),
      'Invalid phoneNumber',
    );
    final firstNameError = CustomFormValidation.errorMessage(
      firstNameController.text.trim(),
      'firstname cannot be empty',
    );
    final lastnameError = CustomFormValidation.errorMessage(
      lastNameCoontroller.text.trim(),
      'lastname cannot be empty',
    );

    if (widget.params.fromEmail && emailError != '' ||
        passwordError != '' ||
        firstNameError != '' ||
        lastnameError != '') {
      canSumit = false;
    } else if (!widget.params.fromEmail && phoneError != '' ||
        passwordError != '' ||
        lastnameError != '' ||
        firstNameError != '') {
      canSumit = false;
    }
    _canSubmit.value = canSumit;
  }

  @override
  void dispose() {
    super.dispose();
    _emailStreamController.close();
    _passwordStreamController.close();
    _phoneNumberStreamController.close();
    _firstNameStreamController.close();
    _lastNameStreamController.close();
    emailFocus.dispose();
    phoneNumberFocus.dispose();
    firstNameFocus.dispose();
    lastNameFocus.dispose();
    passwordFocus.dispose();
  }

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
                  'Sign Up',
                  fontSize: 30,
                  color: FoodlieColors.textColor,
                ),
              ),
              const Gap(50),
              TextBody(
                'Last Name',
                fontSize: 13.35,
                color: FoodlieColors.foodlieBlack,
              ),
              const Gap(12),
              StreamBuilder<String>(
                stream: _lastNameStreamController.stream,
                builder: (context, snapshot) {
                  return InputField(
                    controller: lastNameCoontroller,
                    validationColor: snapshot.data == null
                        ? const Color(0xffF5F5F5)
                        : CustomFormValidation.getColor(
                            snapshot.data,
                            lastNameFocus,
                            CustomFormValidation.errorMessage(
                              snapshot.data,
                              'lastname is required',
                            ),
                          ),
                    validationMessage: CustomFormValidation.errorMessage(
                      snapshot.data,
                      'lastname is required',
                    ),
                    placeholder: 'Last Name',
                  );
                },
              ),
              const Gap(28),
              TextBody(
                'Firstname',
                fontSize: 13.35,
                color: FoodlieColors.foodlieBlack,
              ),
              const Gap(12),
              StreamBuilder<String>(
                stream: _firstNameStreamController.stream,
                builder: (context, snapshot) {
                  return InputField(
                    controller: firstNameController,
                    placeholder: 'Firstname',
                    validationColor: snapshot.data == null
                        ? const Color(0xffF5F5F5)
                        : CustomFormValidation.getColor(
                            snapshot.data,
                            firstNameFocus,
                            CustomFormValidation.errorMessage(
                              snapshot.data,
                              'Firstname address is required',
                            ),
                          ),
                    validationMessage: CustomFormValidation.errorMessage(
                      snapshot.data,
                      'Firstname address is required',
                    ),
                  );
                },
              ),
              if (widget.params.fromEmail)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(28),
                    TextBody(
                      'Email',
                      fontSize: 13.35,
                      color: FoodlieColors.foodlieBlack,
                    ),
                    const Gap(12),
                    StreamBuilder<String>(
                      stream: _emailStreamController.stream,
                      builder: (context, snapshot) {
                        return InputField(
                          controller: emailController,
                          placeholder: 'Email',
                          validationColor: snapshot.data == null
                              ? const Color(0xffF5F5F5)
                              : CustomFormValidation.getColor(
                                  snapshot.data,
                                  emailFocus,
                                  CustomFormValidation.errorEmailMessage(
                                    snapshot.data,
                                    'Email address is required',
                                  ),
                                ),
                          validationMessage:
                              CustomFormValidation.errorEmailMessage(
                            snapshot.data,
                            'Email address is required',
                          ),
                          prefix: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: SvgPicture.asset(
                              AppAssets.newmail,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(28),
                    TextBody(
                      'Phone number',
                      fontSize: 13.35,
                      color: FoodlieColors.foodlieBlack,
                    ),
                    const Gap(12),
                    StreamBuilder<String>(
                      stream: _phoneNumberStreamController.stream,
                      builder: (context, snapshot) {
                        return InputField(
                          textInputType: TextInputType.number,
                          controller: phoneController,
                          placeholder: 'Phone number',
                          validationColor: snapshot.data == null
                              ? const Color(0xffF5F5F5)
                              : CustomFormValidation.getColor(
                                  snapshot.data,
                                  phoneNumberFocus,
                                  CustomFormValidation.errorPhoneNumber2(
                                    snapshot.data,
                                    'PhoneNumber address is required',
                                  ),
                                ),
                          validationMessage:
                              CustomFormValidation.errorPhoneNumber2(
                            snapshot.data,
                            'PhoneNumber is required',
                          ),
                          prefix: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppAssets.phone3,
                                  color:
                                      const Color(0xff534F4F).withOpacity(0.4),
                                ),
                                const Gap(5),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              const Gap(28),
              TextBody(
                'Password',
                fontSize: 13.35,
                color: FoodlieColors.foodlieBlack,
              ),
              const Gap(12),
              StreamBuilder<String>(
                stream: _passwordStreamController.stream,
                builder: (context, snapshot) {
                  return InputField(
                    controller: passwordController,
                    placeholder: 'Password',
                    password: true,
                    validationColor: snapshot.data == null
                        ? const Color(0xffF5F5F5)
                        : CustomFormValidation.getColor(
                            snapshot.data,
                            passwordFocus,
                            CustomFormValidation.errorMessagePassword(
                              snapshot.data,
                              'Password is required',
                            ),
                          ),
                    validationMessage:
                        CustomFormValidation.errorMessagePassword(
                      snapshot.data,
                      'Password is required',
                    ),
                    prefix: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(
                        AppAssets.keyLocked,
                        color: FoodlieColors.grey1,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  );
                },
              ),
              const Gap(44),
              ValueListenableBuilder<bool>(
                valueListenable: _canSubmit,
                builder: (context, canSubmit, snapshot) {
                  return BusyButton(
                    title: 'Continue',
                    active: canSubmit,
                    onTap: () async {
                      Navigator.pushNamed(
                        context,
                        RouteName.referralRegistrationPage,
                        arguments: ReferralCodeParams(
                          fromEmail: widget.params.fromEmail,
                          firstName: firstNameController.text,
                          lastName: lastNameCoontroller.text,
                          email: emailController.text,
                          password: passwordController.text,
                          phone: phoneController.text,
                        ),
                      );
                    },
                  );
                },
              ),
              const Gap(50),
              Align(
                child: RichText(
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
                          fontWeight: FontWeight.w700,
                          color: FoodlieColors.foodliePink,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpArguement {
  SignUpArguement({
    required this.fromEmail,
  });

  final bool fromEmail;
}
