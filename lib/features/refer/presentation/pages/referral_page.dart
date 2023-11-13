import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/sl/sl_container.dart';
import 'package:Foodlify/core/utils/flushbar_notification.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';
import 'package:Foodlify/features/home/presentation/cubit/generate_referral_code_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/generate_referral_code_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class ReferralPage extends StatefulWidget {
  const ReferralPage({super.key});

  @override
  State<ReferralPage> createState() => _ReferralPageState();
}

class _ReferralPageState extends State<ReferralPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenerateReferralCodeCubit(
        homeRepository: sl<HomeRepository>(),
      )..generateReferralCode(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(
                color: FoodlieColors.foodlieBlack,
              ),
              elevation: 0,
              title: const Text(
                'Send an Invitation',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: FoodlieColors.foodlieBlack,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 70,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Image.asset(
                      AppAssets.peoplePhone,
                    ),
                  ),
                  const Gap(22),
                  BlocConsumer<GenerateReferralCodeCubit, GenerateReferralCodeState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        orElse: () {},
                        error: (message) {
                          FlushbarNotification.showErrorMessage(
                            context,
                            message: message,
                          );
                        },
                      );
                    },
                    builder: (context, state) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 18,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: const Color(0xFFFFE7D2),
                        ),
                        child: state.maybeWhen(
                          orElse: () => const SizedBox(),
                          loading: () => const CircularProgressIndicator(),
                          generated: (user) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextBold(
                                user.referral_code ?? '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Clipboard.setData(
                                    ClipboardData(
                                      text: user.referral_code ?? '',
                                    ),
                                  ).then(
                                    (value) => FlushbarNotification.showSuccessMessage(
                                      context,
                                      message: 'Referral code copied',
                                    ),
                                  );
                                },
                                child: const Icon(
                                  Icons.copy,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const Gap(20),
                  const Text(
                    'Share your referral link to start earning meal coupon',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(53),
                  BlocBuilder<GenerateReferralCodeCubit, GenerateReferralCodeState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => const SizedBox(),
                        loading: () => const CircularProgressIndicator(),
                        generated: (user) => GestureDetector(
                          onTap: () async {
                            await Share.share(
                              '''
🚀 Join me on Foodlify! Use my code: ${user.referral_code} when signing up, and we'll both earn rewards.
Get started:
1. Download Foodlify.
2. Sign up and use code: [Your Referral Code].
3. Enjoy the benefits!

Download App

Let's unlock rewards together!

Cheers,
${user.first_name} ${user.last_name}''',
                            );
                          },
                          child: Container(
                            width: 146,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              gradient: const LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                colors: [
                                  Color(0xFFFD654D),
                                  Color(0xFFFC664B),
                                  Color(0xFFFC664B),
                                  Color(0xFFFC674A),
                                  Color(0xFFF3892B),
                                  Color(0xFFF38B2A),
                                ],
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(AppAssets.sharedIcon),
                                const Text(
                                  'Share',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const Gap(53),
                  const Text(
                    'Invite Friends',
                    style: TextStyle(
                      color: FoodlieColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
