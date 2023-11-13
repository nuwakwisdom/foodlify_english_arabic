// ignore_for_file: use_named_constants, use_colored_box, deprecated_member_use, inference_failure_on_function_return_type, always_declare_return_types, unnecessary_statements, lines_longer_than_80_chars

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:Foodlify/features/auth/presentation/cubit/login_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Future<void> getUser() async {
    await context.read<GetUserCubit>().getUser(context);
  }

  // ignore: type_annotate_public_apis

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetUserCubit, GetUserState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          success: (u) {},
          error: () {},
        );
      },
      builder: (context, state) {
        final user = context.read<GetUserCubit>().users;
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
                    const Gap(30),
                    TextSemiBold(
                      'Your Profile',
                      fontSize: 21,
                      color: FoodlieColors.foodlieBlack,
                    ),
                    const Gap(17),
                    Row(
                      children: [
                        SizedBox(
                          height: 64,
                          width: 64,
                          child: Stack(
                            children: [
                              Container(
                                height: 64,
                                width: 64,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: FoodlieColors.foodliePink,
                                ),
                                child: Center(
                                  child: TextSemiBold(
                                    '${user?.first_name?[0] ?? ''}${user?.last_name?[0] ?? ''}'
                                        .toUpperCase(),
                                    fontSize: 24,
                                    color: FoodlieColors.foodlieWhite,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 3,
                                ),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    height: 19,
                                    width: 19,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffD9D9D9),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AppAssets.cameraIcon,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(12),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextBold(
                              '${user?.first_name ?? ''} ${user?.last_name ?? ''}',
                              fontSize: 14,
                              color: FoodlieColors.foodlieBlack,
                            ),
                            TextBody(
                              user?.email ?? user?.phone_number ?? '',
                              fontSize: 10,
                              color: FoodlieColors.foodlieBlack,
                            )
                          ],
                        )
                      ],
                    ),
                    const Gap(20),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F6F8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            tileColor: const Color(0xffF5F6F8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteName.profileSetting,
                              );
                            },
                            leading: Container(
                              height: 29,
                              width: 29,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: FoodlieColors.primaryColor,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  AppAssets.profileIcon,
                                  color: FoodlieColors.foodlieWhite,
                                  height: 18,
                                  width: 18,
                                ),
                              ),
                            ),
                            title: TextBody(
                              'My Profile',
                              fontSize: 13,
                              color: const Color(0xff676262),
                            ),
                            trailing: const Icon(
                              Icons.keyboard_arrow_right,
                              size: 25,
                              color: Color(0xff676262),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                            ),
                            child: Container(
                              height: 1,
                              color: const Color(0xff979889).withOpacity(0.2),
                            ),
                          ),
                          ListTile(
                            tileColor: const Color(0xffF5F6F8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteName.viewAddress,
                              );
                            },
                            leading: Container(
                              height: 29,
                              width: 29,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: FoodlieColors.primaryColor,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  AppAssets.addressIcon,
                                  color: FoodlieColors.foodlieWhite,
                                  height: 18,
                                  width: 18,
                                ),
                              ),
                            ),
                            title: TextBody(
                              'Delivery Address',
                              fontSize: 13,
                              color: const Color(0xff676262),
                            ),
                            trailing: const Icon(
                              Icons.keyboard_arrow_right,
                              size: 25,
                              color: Color(0xff676262),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                            ),
                            child: Container(
                              height: 1,
                              color: const Color(0xff979889).withOpacity(0.2),
                            ),
                          ),
                          ListTile(
                            tileColor: const Color(0xffF5F6F8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onTap: () => Navigator.pushNamed(
                              context,
                              RouteName.walletPage,
                            ),
                            leading: Container(
                              height: 29,
                              width: 29,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: FoodlieColors.primaryColor,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.wallet,
                                  color: FoodlieColors.foodlieWhite,
                                  size: 20,
                                ),
                              ),
                            ),
                            title: TextBody(
                              'Wallet',
                              fontSize: 13,
                              color: const Color(0xff676262),
                            ),
                            trailing: const Icon(
                              Icons.keyboard_arrow_right,
                              size: 25,
                              color: Color(0xff676262),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(15),
                    ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onTap: () => Navigator.pushNamed(
                        context,
                        RouteName.favouritePage,
                      ),
                      tileColor: const Color(0xffF5F6F8),
                      leading: Container(
                        height: 29,
                        width: 29,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: FoodlieColors.primaryColor,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            AppAssets.favoriteIcon,
                            color: FoodlieColors.foodlieWhite,
                          ),
                        ),
                      ),
                      title: TextBody(
                        'Favourites',
                        fontSize: 13,
                        color: const Color(0xff676262),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 25,
                        color: Color(0xff676262),
                      ),
                    ),
                    const Gap(15),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F6F8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            tileColor: const Color(0xffF5F6F8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteName.termsAndCondtion,
                              );
                            },
                            leading: Container(
                              height: 29,
                              width: 29,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: FoodlieColors.primaryColor,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  AppAssets.termsIconn,
                                  color: FoodlieColors.foodlieWhite,
                                  height: 18,
                                  width: 18,
                                ),
                              ),
                            ),
                            title: TextBody(
                              'Terms and Condition',
                              fontSize: 13,
                              color: const Color(0xff676262),
                            ),
                            trailing: const Icon(
                              Icons.keyboard_arrow_right,
                              size: 25,
                              color: Color(0xff676262),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                            ),
                            child: Container(
                              height: 1,
                              color: const Color(0xff979889).withOpacity(0.2),
                            ),
                          ),
                          ListTile(
                            tileColor: const Color(0xffF5F6F8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteName.supportPage,
                              );
                            },
                            leading: Container(
                              height: 29,
                              width: 29,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: FoodlieColors.primaryColor,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  AppAssets.contactIcon,
                                  color: FoodlieColors.foodlieWhite,
                                  height: 18,
                                  width: 18,
                                ),
                              ),
                            ),
                            title: TextBody(
                              'Contact Support',
                              fontSize: 13,
                              color: const Color(0xff676262),
                            ),
                            trailing: const Icon(
                              Icons.keyboard_arrow_right,
                              size: 25,
                              color: Color(0xff676262),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                            ),
                            child: Container(
                              height: 1,
                              color: const Color(0xff979889).withOpacity(0.2),
                            ),
                          ),
                          ListTile(
                            tileColor: const Color(0xffF5F6F8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onTap: () => Navigator.pushNamed(
                              context,
                              RouteName.referOnBoarding,
                            ),
                            leading: Container(
                              height: 29,
                              width: 29,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: FoodlieColors.primaryColor,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  AppAssets.refer,
                                  color: FoodlieColors.foodlieWhite,
                                  height: 18,
                                  width: 18,
                                ),
                              ),
                            ),
                            title: TextBody(
                              'Referral',
                              fontSize: 13,
                              color: const Color(0xff676262),
                            ),
                            trailing: const Icon(
                              Icons.keyboard_arrow_right,
                              size: 25,
                              color: Color(0xff676262),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(15),
                    ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: const Color(0xffF5F6F8),
                      leading: Container(
                        height: 29,
                        width: 29,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: FoodlieColors.primaryColor,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            AppAssets.restaurantIcon,
                          ),
                        ),
                      ),
                      title: TextBody(
                        'Become a Vendor',
                        fontSize: 13,
                        color: const Color(0xff676262),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 25,
                        color: Color(0xff676262),
                      ),
                    ),
                    const Gap(15),
                    ListTile(
                      leading: SvgPicture.asset(
                        AppAssets.logoutIcon,
                        height: 24,
                        width: 24,
                      ),
                      onTap: () async {
                        await context.read<LoginCubit>().logout(context);
                      },
                      title: TextBody(
                        'Log out',
                        fontSize: 13,
                        color: FoodlieColors.foodlieBlack,
                      ),
                    ),
                    const Gap(15),
                    ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: Colors.red,
                      leading: Container(
                        height: 29,
                        width: 29,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            AppAssets.deleteIcon,
                          ),
                        ),
                      ),
                      title: TextBody(
                        'Delete My Account',
                        fontSize: 13,
                        color: Colors.white,
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        size: 25,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteName.deletAccount,
                        );
                      },
                    ),
                    const Gap(20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
