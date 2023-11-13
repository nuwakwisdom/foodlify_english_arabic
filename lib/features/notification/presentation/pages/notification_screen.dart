// ignore_for_file: deprecated_member_use

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_user_cubit.dart';
import 'package:Foodlify/features/notification/presentation/widgets/notification_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool history = true;
  bool messages = false;
  bool payment = false;

  @override
  Widget build(BuildContext context) {
    final notification = context.read<GetUserCubit>().notifications;
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
          'Notification',
          fontSize: 17,
          color: const Color(0xff363C4F),
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //x color: FoodlieColors.foodlieWhite,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(15),
                      Column(
                        children:
                            List.generate(notification?.length ?? 0, (index) {
                          return Column(
                            children: [
                              ListTile(
                                tileColor: notification?[index].viewed ?? false
                                    ? FoodlieColors.foodlieWhite
                                    : FoodlieColors.lightGrey,
                                textColor: FoodlieColors.foodlieWhite,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onTap: () async {
                                  await context
                                      .read<GetUserCubit>()
                                      .viewNotification(
                                          id: notification?[index].id ?? 0);
                                  /*  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return NotificationPopUp(
                                        title: notification?[index].title ?? '',
                                        content:
                                            notification?[index].content ?? '',
                                        id: 0,
                                      );
                                    },
                                  );*/
                                },
                                leading: Container(
                                  height: 29,
                                  width: 29,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: FoodlieColors.primaryColor,
                                  ),
                                  child: const Icon(
                                    Icons.notifications,
                                    color: FoodlieColors.foodlieWhite,
                                  ),
                                ),
                                subtitle: TextBody(
                                  notification?[index].content ?? '',
                                  fontSize: 10,
                                  color: const Color(0xff979899),
                                  maxLines: 1000,
                                ),
                                title: TextBody(
                                  notification?[index].title ?? '',
                                  fontSize: 13,
                                  color: const Color(0xff676262),
                                ),
                                /*trailing: TextBody(
                            '₦12,000 .00',
                            fontSize: 12,
                            color: const Color(0xff27790A),
                          )*/
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                ),
                                child: Container(
                                  height: 1,
                                  color:
                                      const Color(0xff979889).withOpacity(0.2),
                                ),
                              ),
                            ],
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationType extends StatelessWidget {
  const NotificationType({
    super.key,
    required this.icon,
    required this.title,
    required this.active,
    required this.onTap,
  });
  final String icon;
  final String title;
  final bool active;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 72,
            width: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: active
                  ? FoodlieColors.foodliePink
                  : FoodlieColors.foodlieWhite,
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                color: active
                    ? FoodlieColors.foodlieWhite
                    : FoodlieColors.foodliePink,
              ),
            ),
          ),
          const Gap(5),
          TextSemiBold(
            title,
            fontSize: 17,
            color:
                active ? FoodlieColors.foodliePink : FoodlieColors.foodlieBlack,
          )
        ],
      ),
    );
  }
}
