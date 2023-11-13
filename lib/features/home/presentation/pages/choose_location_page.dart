// ignore_for_file: use_build_context_synchronously

import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_food_by_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app/style/fonts.dart';

class SelectLocationPage extends StatefulWidget {
  const SelectLocationPage({super.key});

  @override
  State<SelectLocationPage> createState() => _SelectLocationPageState();
}

class _SelectLocationPageState extends State<SelectLocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              child: Image.asset(
                AppAssets.bikeMan,
                height: 200,
                width: 200,
              ),
            ),
            const Gap(30),
            BusyButton(
              title: 'Select Location',
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const LocationModal();
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}

class LocationModal extends StatefulWidget {
  const LocationModal({super.key});

  @override
  State<LocationModal> createState() => _LocationModalState();
}

class _LocationModalState extends State<LocationModal> {
  Future<String> setSaveLocation({required String location}) async {
    final saveLocation = await SharedPreferences.getInstance();
    saveLocation.setString('location', location);
    return location;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: FoodlieColors.foodlieWhite,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(20),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                await setSaveLocation(location: 'Zaria');
                context
                    .read<GetFoodByCategoryCubit>()
                    .paginatedFoodList
                    .clear();
                Navigator.pushNamedAndRemoveUntil(
                    context, RouteName.homeNav, (route) => false);
                /* context
                    .read<GetFoodByCategoryCubit>()
                    .getLocation(presentLoaction: 'Zaria');*/
              },
              child: TextSemiBold(
                'Zaria',
                fontSize: 16,
                color: FoodlieColors.primaryColor,
              ),
            ),
            Container(
              height: 0.5,
              color: FoodlieColors.grey,
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                await setSaveLocation(location: 'Kaduna');
                context
                    .read<GetFoodByCategoryCubit>()
                    .paginatedFoodList
                    .clear();
                Navigator.pushNamedAndRemoveUntil(
                    context, RouteName.homeNav, (route) => false);
                /* context
                    .read<GetFoodByCategoryCubit>()
                    .getLocation(presentLoaction: 'Kaduna');*/
              },
              child: TextSemiBold(
                'Kaduna',
                fontSize: 16,
                color: FoodlieColors.primaryColor,
              ),
            ),
            const Gap(30),
          ],
        ),
      ),
    );
  }
}
