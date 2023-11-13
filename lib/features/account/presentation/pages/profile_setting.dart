// ignore_for_file: deprecated_member_use, avoid_print, lines_longer_than_80_chars

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/app/widgets/input_field.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/sl/sl_container.dart';
import 'package:Foodlify/features/account/presentation/cubit/update_adress_cubit.dart';
import 'package:Foodlify/features/auth/presentation/notifier/auth_notifier.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({super.key});

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumbeer = TextEditingController();
  @override
  void initState() {
    super.initState();
    fullNameController.text =
        '${context.read<GetUserCubit>().users?.first_name} ${context.read<GetUserCubit>().users?.last_name}';
    phoneNumbeer.text = context.read<GetUserCubit>().users?.phone_number ?? '';
    email.text = context.read<GetUserCubit>().users?.email ?? '';
    Future.delayed(Duration.zero, () {
      context.read<GetUserCubit>().getUser(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<GetUserCubit>().users;
    return Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
      appBar: AppBar(
        backgroundColor: FoodlieColors.foodlieWhite,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: FoodlieColors.foodlieBlack,
          ),
        ),
        title: TextBold(
          'Profile Setting',
          fontSize: 17,
          color: FoodlieColors.foodlieBlack,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  child: Container(
                    height: 64,
                    width: 64,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffFD654D),
                          Color(0xffFD664C),
                          Color(0xffFD674C),
                          Color(0xffF38A2B),
                          Color(0xffF38B2A),
                        ],
                      ),
                    ),
                    child: Center(
                      child: TextSemiBold(
                        '${user?.first_name?[0] ?? ''}${user?.last_name?[0] ?? ''}',
                        fontSize: 24,
                        color: FoodlieColors.foodlieWhite,
                      ),
                    ),
                  ),
                ),
                const Gap(30),
                TextSemiBold(
                  'Profile name',
                  fontSize: 13,
                  color: FoodlieColors.foodlieBlack.withOpacity(0.4),
                ),
                const Gap(10),
                InputField(
                  prefix: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: SvgPicture.asset(
                      AppAssets.personIcon,
                      color: const Color(0xff979899),
                    ),
                  ),
                  placeholder: '',
                  controller: fullNameController,
                ),
                /* const Gap(29),
                TextSemiBold(
                  'Phone Number',
                  fontSize: 13,
                  color: FoodlieColors.foodlieBlack.withOpacity(0.4),
                ),
                const Gap(10),
                InputField(
                  prefix: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: SvgPicture.asset(
                      AppAssets.phone3,
                      color: const Color(0xff979899),
                    ),
                  ),
                  placeholder: 'Add Phone Number',
                  controller: phoneNumbeer,
                  onChanged: (value) {
                    email.text = value;
                    print(email.text);
                  },
                ),
                const Gap(29),
                TextSemiBold(
                  'Email',
                  fontSize: 13,
                  color: FoodlieColors.foodlieBlack.withOpacity(0.4),
                ),
                const Gap(10),
                InputField(
                  prefix: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: SvgPicture.asset(
                      AppAssets.emailIcon,
                      color: const Color(0xff979899),
                    ),
                  ),
                  placeholder: 'Add Email',
                  controller: email,
                  onChanged: (value) {
                    phoneNumbeer.text = value;
                    print(value);
                  },
                ),*/
                const Gap(40),
                BusyButton(
                  busy: sl<AuthNotifier>().isLoading,
                  title: 'Done',
                  onTap: () async {
                    await context
                        .read<UpdateAdressCubit>()
                        .editNName(context, new_name: fullNameController.text);
                    /* await sl<AuthNotifier>().updateProfileWithEmail(
                      context,
                      phoneNumber: phoneNumbeer.text,
                      email: email.text,
                      fullName: fullNameController.text,
                    );*/
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
