// ignore_for_file: sized_box_shrink_expand

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:gap/gap.dart';
import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/app/widgets/input_field.dart';
import 'package:Foodlify/core/constant/constant.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({super.key});

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  @override
  Widget build(BuildContext context) {
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
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextBold(
                      'Search for any services\nyou want below',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: FoodlieColors.foodliePink,
                    ),
                    const Gap(21),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.locationIcon,
                        ),
                        const Gap(10),
                        Expanded(
                          child: InputField(
                            controller: TextEditingController(),
                            placeholder: 'Search for services',
                            suffix: SvgPicture.asset(
                              AppAssets.searchIcon,
                            ),
                          ),
                        )
                      ],
                    ),
                    const Gap(29),
                    TextBody(
                      'Suggestion',
                      fontSize: 14,
                      color: const Color(0xff575B53),
                    ),
                    const Gap(22),
                    Row(
                      children: List.generate(
                        2,
                        (index) => LocationSuggestions(
                          image: AppAssets.lImg1,
                          title: 'Yakoyo Restaurant ',
                          onTap: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(34),
              Expanded(
                child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.asset(
                    AppAssets.map,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    BusyButton(
                      title: 'Search Location',
                      onTap: () {},
                    ),
                    const Gap(20)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LocationSuggestions extends StatelessWidget {
  const LocationSuggestions({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });
  final String image;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 6),
        child: SizedBox(
          width: 118,
          child: Row(
            children: [
              Container(
                height: 31,
                width: 35,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(image),
              ),
              const Gap(6),
              Expanded(
                child: TextSemiBold(
                  title,
                  fontSize: 14,
                  color: const Color(0xff575B53),
                  maxLines: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
