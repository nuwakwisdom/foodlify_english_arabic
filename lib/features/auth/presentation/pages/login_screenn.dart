// ignore_for_file: deprecated_member_use, inference_failure_on_function_invocation, lines_longer_than_80_chars

import 'package:Foodlify/features/auth/domain/usecases/logout_usecase.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:Foodlify/core/sl/sl_container.dart';
import 'package:Foodlify/core/utils/flushbar_notification.dart';
import 'package:Foodlify/features/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:Foodlify/features/auth/presentation/cubit/login_cubit.dart';
import 'package:Foodlify/features/auth/presentation/notifier/auth_notifier.dart';
import 'package:Foodlify/features/auth/presentation/widgets/login_options.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        logoutUsecase: sl<LogoutUsecase>(),
        loginWithEmailUsecase: sl<LoginWithEmailUsecase>(),
      ),
      child: Scaffold(
        backgroundColor: FoodlieColors.foodlieWhite,
        /*  appBar: AppBar(
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
        ),*/
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Consumer<AuthNotifier>(
              builder: (context, v, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      child: TextBold(
                        'Welcome back!',
                        fontSize: 30,
                        color: FoodlieColors.textColor,
                      ),
                    ),
                    // const Gap(38),
                    /*  GestureDetector(
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
                            )
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
                    /*  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(20),
                        TextBody(
                          'Email or Phone',
                          fontSize: 13.35,
                          color: FoodlieColors.textColor,
                        ),
                        const Gap(17),
                        InputField(
                          controller: emailController,
                          placeholder: 'Email / Phone number',
                        ),
                        const Gap(28),
                        TextBody(
                          'Password',
                          fontSize: 13.35,
                          color: FoodlieColors.textColor,
                        ),
                        const Gap(17),
                        InputField(
                          controller: passwordController,
                          placeholder: 'Password',
                          password: true,
                          prefix: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: SvgPicture.asset(AppAssets.lockIcon),
                          ),
                        ),
                      ],
                    ),*/
                    const Gap(40),
                    BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          orElse: () {},
                          error: (e) {
                            FlushbarNotification.showErrorMessage(
                              context,
                              message: e,
                            );
                          },
                          loggedIn: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              RouteName.homeNav,
                              (route) => false,
                            );
                          },
                        );
                      },
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return const LoginOptions();
                              },
                            );
                            /*context.read<LoginCubit>().loginWithEmail(
                                  username: emailController.text,
                                  password: passwordController.text,
                                );*/
                          },
                          child: Container(
                            height: 54,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.topRight,
                                colors: [
                                  const Color(0xffFD654D).withOpacity(1),
                                  const Color(0xffFD664C).withOpacity(1),
                                  const Color(0xffFD674C).withOpacity(1),
                                  const Color(0xffFC6748).withOpacity(1),
                                  const Color(0xffF38A2B).withOpacity(1),
                                  const Color(0xffF38B2A).withOpacity(1),
                                ],
                              ),
                            ),
                            child: state.maybeWhen(
                              loading: () {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: FoodlieColors.foodlieWhite,
                                    strokeWidth: 5,
                                  ),
                                );
                              },
                              orElse: () {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      AppAssets.keyLocked,
                                      color: FoodlieColors.foodlieWhite,
                                      height: 16,
                                      width: 16,
                                    ),
                                    const Gap(13),
                                    TextBold(
                                      'Sign in',
                                      fontSize: 13,
                                      color: FoodlieColors.foodlieWhite,
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    /* const Gap(30),
                    Align(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteName.resetPasswordPage,
                          );
                        },
                        child: TextBody(
                          'Forget password',
                          fontSize: 13,
                          color: FoodlieColors.foodliePink,
                        ),
                      ),
                    ),*/
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
