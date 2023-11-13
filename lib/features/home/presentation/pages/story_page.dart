import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:Foodlify/features/home/presentation/pages/timelin_screen.dart';
import 'package:story_view/story_view.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final storyController = StoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            Align(
              child: TextSemiBold(
                'Story',
                fontSize: 13,
                color: FoodlieColors.grey1,
              ),
            ),
            const Gap(20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: List.generate(
                    7,
                    (index) => RestaurantStories(
                      active: index == 0,
                      title: 'Aburo Sha...',
                      restaurant: 'QTSS',
                      color: FoodlieColors.primaryColor,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteName.foodStory,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            const Gap(20),
            Expanded(
              child: SizedBox(
                height: double.infinity,
                child: Stack(
                  children: [
                    StoryView(
                      indicatorColor: FoodlieColors.primaryColor,
                      storyItems: [
                        StoryItem.pageProviderImage(
                          const AssetImage(
                            AppAssets.storyImg1,
                          ),
                          duration: const Duration(
                            seconds: 4,
                          ),
                          imageFit: BoxFit.fill,
                        ),
                        StoryItem.pageProviderImage(
                            const AssetImage(
                              AppAssets.storyImg2,
                            ),
                            duration: const Duration(
                              seconds: 4,
                            ),
                            imageFit: BoxFit.fill),
                        StoryItem.pageProviderImage(
                          const AssetImage(
                            AppAssets.storyImg3,
                          ),
                          duration: const Duration(
                            seconds: 4,
                          ),
                          imageFit: BoxFit.fill,
                        ),
                      ],
                      onStoryShow: (s) {},
                      onComplete: () {},
                      controller: storyController,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        left: 30,
                        right: 30,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2.5,
                                color: FoodlieColors.primaryColor,
                              ),
                            ),
                            child: Center(
                              child: Center(
                                child: Container(
                                  height: 17,
                                  width: 17,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: FoodlieColors.primaryColor,
                                  ),
                                  child: Center(
                                    child: TextBold(
                                      'QTS',
                                      fontSize: 4,
                                      color: FoodlieColors.foodlieWhite,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Gap(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextBold(
                                'QTT Restaurant',
                                fontSize: 8,
                                color: FoodlieColors.foodlieWhite,
                              ),
                              TextBody(
                                '10:55',
                                fontSize: 8,
                                color: FoodlieColors.foodlieWhite,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(40),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: BusyButton(
                title: 'Order Now',
                onTap: () {},
              ),
            ),
            const Gap(40),
          ],
        ),
      ),
    );
  }
}
