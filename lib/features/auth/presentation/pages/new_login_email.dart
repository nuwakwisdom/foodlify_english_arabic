// ignore_for_file: deprecated_member_use, inference_failure_on_function_invocation, avoid_bool_literals_in_conditional_expressions, lines_longer_than_80_chars

import 'dart:async';

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/app/widgets/input_field.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:Foodlify/core/utils/custom_form_validator.dart';
import 'package:Foodlify/features/auth/presentation/cubit/login_cubit.dart';
import 'package:Foodlify/features/auth/presentation/pages/reset_password_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({
    super.key,
    required this.params,
  });
  final LoginArgument params;
  @override
  State<LoginWithEmail> createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneControoller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> _canSubmit = ValueNotifier(false);

  late StreamController<String> _emailStreamController;
  late StreamController<String> _phoneStreamController;

  late StreamController<String> _passwordStreamController;
  final emailFocus = FocusNode();
  final phonneFocus = FocusNode();
  final passwordFocus = FocusNode();

  bool busyButton = false;
  @override
  void initState() {
    super.initState();
    _emailStreamController = StreamController<String>.broadcast();
    _phoneStreamController = StreamController<String>.broadcast();
    _passwordStreamController = StreamController<String>.broadcast();
    emailController.addListener(() {
      _emailStreamController.sink.add(
        emailController.text.trim(),
      );
      validateInputs();
    });
    phoneControoller.addListener(() {
      _phoneStreamController.sink.add(
        phoneControoller.text.trim(),
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
    final passwordError = CustomFormValidation.errorMessage(
      passwordController.text.trim(),
      'Invalid password',
    );
    final phoneError = CustomFormValidation.errorPhoneNumber2(
      phoneControoller.text.trim(),
      'Invalid phoneNumber',
    );

    if (widget.params.isEmail && emailError != '' || passwordError != '') {
      canSumit = false;
    } else if (!widget.params.isEmail && phoneError != '' ||
        passwordError != '') {
      canSumit = false;
    }
    _canSubmit.value = canSumit;
  }

  @override
  void dispose() {
    super.dispose();
    _emailStreamController.close();
    _passwordStreamController.close();
    _phoneStreamController.close();
    emailFocus.dispose();
    phonneFocus.dispose();
    passwordFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: FoodlieColors.foodlieBlack,
          ),
        ),
        backgroundColor: FoodlieColors.foodlieWhite,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(30),
              Align(
                child: TextBold(
                  'Welcome back!',
                  fontSize: 30,
                  color: FoodlieColors.foodlieBlack,
                ),
              ),
              const Gap(38),
              /* GestureDetector(
                onTap: () {},
                child: Container(
                  height: 54,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: FoodlieColors.foodlieBlack.withOpacity(0.05),
                    border: Border.all(
                      color: FoodlieColors.foodlieBlack.withOpacity(0.2),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.newGoogle),
                      const Gap(31),
                      TextBody(
                        'Continue with Google',
                        fontSize: 13,
                        color: FoodlieColors.foodlieBlack,
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(20),
              Align(
                child: TextSemiBold(
                  'Or',
                  fontSize: 16,
                  color: FoodlieColors.foodlieBlack,
                ),
              ),*/
              if (widget.params.isEmail)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(20),
                    TextBody(
                      'Email',
                      fontSize: 13.35,
                      color: const Color(0xff534F4F),
                    ),
                    const Gap(17),
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
                            padding: const EdgeInsets.only(
                              right: 20,
                            ),
                            child: SvgPicture.asset(
                              AppAssets.emailIcon,
                              color: const Color(0xff534F4F).withOpacity(0.45),
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
                    const Gap(20),
                    TextBody(
                      'Phone Number',
                      fontSize: 13.35,
                      color: const Color(0xff534F4F),
                    ),
                    const Gap(17),
                    StreamBuilder<String>(
                      stream: _phoneStreamController.stream,
                      builder: (context, snapshot) {
                        return InputField(
                          controller: phoneControoller,
                          textInputType: TextInputType.number,
                          placeholder: 'Phone',
                          validationColor: snapshot.data == null
                              ? const Color(0xffF5F5F5)
                              : CustomFormValidation.getColor(
                                  snapshot.data,
                                  phonneFocus,
                                  CustomFormValidation.errorPhoneNumber2(
                                    snapshot.data,
                                    'PhoneNumber is required',
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
              const Gap(20),
              TextBody(
                'Password',
                fontSize: 13.35,
                color: const Color(0xff534F4F),
              ),
              const Gap(17),
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
                            CustomFormValidation.errorMessage(
                              snapshot.data,
                              'Password is required',
                            ),
                          ),
                    validationMessage: CustomFormValidation.errorMessage(
                      snapshot.data,
                      'Password is required',
                    ),
                    prefix: Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                      ),
                      child: SvgPicture.asset(
                        AppAssets.lockIcon,
                        color: const Color(0xff534F4F).withOpacity(0.45),
                      ),
                    ),
                  );
                },
              ),
              const Gap(36),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    loading: () {
                      setState(() {
                        busyButton = true;
                      });
                    },
                    loggedIn: () {
                      setState(() {
                        busyButton = false;
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouteName.homeNav,
                          (route) => false,
                        );
                      });
                    },
                    error: (e) {
                      setState(() {
                        busyButton = false;
                      });
                    },
                  );
                },
                builder: (context, state) {
                  return ValueListenableBuilder<bool>(
                    valueListenable: _canSubmit,
                    builder: (context, canSubmit, snapshot) {
                      return BusyButton(
                        title: 'Sign In',
                        active: canSubmit,
                        busy: busyButton,
                        onTap: () {
                          context.read<LoginCubit>().loginWithEmail(
                                context,
                                username: widget.params.isEmail
                                    ? emailController.text
                                    : phoneControoller.text,
                                password: passwordController.text,
                              );
                        },
                      );
                    },
                  );
                },
              ),
              const Gap(30),
              Align(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteName.resetPasswordPage,
                      arguments: ResetPasswordArguement(
                        isEmail: widget.params.isEmail ? true : false,
                      ),
                    );
                  },
                  child: TextBody(
                    'Forget password',
                    fontSize: 13,
                    color: FoodlieColors.foodliePink,
                  ),
                ),
              ),
              const Gap(38),
              Align(
                child: RichText(
                  text: TextSpan(
                    text: 'Don’t have an account?',
                    style: GoogleFonts.inter(
                      fontSize: 13.35,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xff282727),
                    ),
                    children: [
                      TextSpan(
                        text: ' Create account',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(
                              context,
                              RouteName.discoverNowPage,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginArgument {
  LoginArgument({
    required this.isEmail,
  });

  final bool isEmail;
}
