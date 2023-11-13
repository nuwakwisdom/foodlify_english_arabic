// ignore_for_file: lines_longer_than_80_chars

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:Foodlify/features/home/domain/entities/users_entity.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_all_restaurant_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_user_cubit.dart';
import 'package:Foodlify/features/restaurant/presentation/pages/restaurant_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ViewAllRestaurant extends StatefulWidget {
  const ViewAllRestaurant({super.key});

  @override
  State<ViewAllRestaurant> createState() => _ViewAllRestaurantState();
}

class _ViewAllRestaurantState extends State<ViewAllRestaurant> {
  @override
  Widget build(BuildContext context) {
    final restaurants = context.read<GetAllRestaurantCubit>().allRestaurant;
    final user = context.read<GetUserCubit>().users;
    return Scaffold(
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
          'Restaurants',
          fontSize: 17,
          color: FoodlieColors.foodlieBlack,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      backgroundColor: FoodlieColors.foodlieWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(30),
            TextSemiBold(
              'Restaurants in Zaria',
              fontSize: 20,
              color: FoodlieColors.primaryColor,
            ),
            const Gap(20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    restaurants?.length ?? 0,
                    (index) => Padding(
                      padding: const EdgeInsets.only(
                        bottom: 15,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteName.restaurantPage,
                            arguments: RestaurantArguement(
                              restaurantEntity: restaurants![index],
                              usersEntity: user ?? const UsersEntity(),
                            ),
                          );
                        },
                        child: Container(
                          height: 140,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: FoodlieColors.foodlieWhite,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 8,
                                color: Color(0xffDCDFE5),
                                offset: Offset(0, 1),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                            ),
                            child: Row(
                              children: [
                                Image.network(
                                  restaurants?[index].logo ?? '',
                                  height: 80,
                                  width: 80,
                                ),
                                const Gap(10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextBold(
                                        restaurants?[index].name ?? '',
                                        fontSize: 14,
                                        color: FoodlieColors.primaryColor,
                                      ),
                                      const Gap(5),
                                      TextSemiBold(
                                        restaurants?[index].address ?? '',
                                        fontSize: 12,
                                        color: FoodlieColors.grey,
                                      ),
                                      const Gap(5),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            RestaurantItem(
                                              icon: AppAssets.clockIcon,
                                              title:
                                                  'Open ${restaurants?[index].open_time}',
                                            ),
                                            const Gap(10),
                                            RestaurantItem(
                                              icon: AppAssets.clockIcon,
                                              title:
                                                  'Close ${restaurants?[index].close_time}',
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
