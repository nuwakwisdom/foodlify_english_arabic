// ignore_for_file: inference_failure_on_function_invocation

import 'dart:io';

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/third_party_loader.dart';
import 'package:Foodlify/core/constant/app_assets.dart';
import 'package:Foodlify/core/constant/app_colors.dart';
import 'package:Foodlify/core/navigators/route_name.dart';
import 'package:Foodlify/core/sl/sl_container.dart';
import 'package:Foodlify/core/utils/debouncer.dart';
import 'package:Foodlify/core/utils/flushbar_notification.dart';
import 'package:Foodlify/features/home/domain/entities/restaurant_entitties.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';
import 'package:Foodlify/features/home/presentation/cubit/add_to_cart_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_user_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/search_food_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/search_food_state.dart';
import 'package:Foodlify/features/home/presentation/pages/add_to_cart.dart';
import 'package:Foodlify/features/home/presentation/pages/timelin_screen.dart';
import 'package:Foodlify/features/home/presentation/widgets/delivery_mode_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SearchFoodPage extends StatefulWidget {
  const SearchFoodPage({super.key});

  @override
  State<SearchFoodPage> createState() => _SearchFoodPageState();
}

class _SearchFoodPageState extends State<SearchFoodPage> {
  final TextEditingController searchController = TextEditingController();
  int foodTypeIndex = 0;
  int? selectedCategories;
  bool allCategories = true;
  List<RestaurantEntity>? restaurants;
  int foodQty = 1;
  String symbol = '';
  String getCurrency() {
    final format = NumberFormat.simpleCurrency(
      locale: Platform.localeName,
      name: 'NGN',
    );
    symbol = format.currencySymbol;
    return format.currencySymbol;
  }

  @override
  void initState() {
    super.initState();
  }

  final DeBouncer deBouncer = DeBouncer(
    interval: const Duration(seconds: 1),
  );

  @override
  Widget build(BuildContext context) {
    final user = context.read<GetUserCubit>().users;
    return BlocProvider(
      create: (context) => SearchFoodCubit(
        homeRepository: sl<HomeRepository>(),
      ),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: FoodlieColors.foodlieWhite,
            appBar: AppBar(
              backgroundColor: FoodlieColors.foodlieWhite,
              elevation: 0,
              title: TextSemiBold(
                'Search Food',
                fontSize: 14,
                color: const Color(0xff363C4F),
              ),
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
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  const Gap(10),
                  Container(
                    height: 46,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: const Color(0xffDCDFE5).withOpacity(0.3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppAssets.searchIcon),
                          const Gap(20),
                          Expanded(
                            child: TextFormField(
                              style: GoogleFonts.roboto(
                                fontSize: 13,
                                color: const Color(0xff676262),
                              ),
                              controller: searchController,
                              onChanged: (value) {
                                deBouncer.call(() {
                                  context
                                      .read<SearchFoodCubit>()
                                      .searchFood(value);
                                });
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search',
                                hintStyle: GoogleFonts.roboto(
                                  fontSize: 13,
                                  color: const Color(0xff676262),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Gap(20),
                  BlocConsumer<SearchFoodCubit, SearchFoodState>(
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
                      return state.maybeWhen(
                        orElse: () => const Text(
                          'Nothing to show here !!',
                        ),
                        loading: () => const ThirdPartyLoader(),
                        foods: (foods) {
                          return foods.isEmpty
                              ? const Text(
                                  'Nothing to show here !!',
                                )
                              : Flexible(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: List.generate(
                                        foods.length,
                                        (index) {
                                          final amount = NumberFormat.currency(
                                            customPattern: '#,##,000',
                                            locale: 'en_us',
                                            symbol: '₦',
                                            decimalDigits: 2,
                                          ).format(foods[index].price ?? 0);
                                          return MealAroundMeCard(
                                            restaurantName:
                                                foods[index].restaurant,
                                            // ignore: unnecessary_string_interpolations
                                            img: '${foods[index].image}',
                                            foodName: foods[index].title,
                                            foodPrice: '$symbol$amount',
                                            onTap: () {
                                              Navigator.pushNamed(
                                                context,
                                                RouteName.addToCart,
                                                arguments: FoodArgument(
                                                  foodDetails: foods[index],
                                                ),
                                              );
                                            },
                                            description:
                                                foods[index].description ?? '',
                                            onTapAddtoCart: () {
                                              context
                                                  .read<AddToCartCubit>()
                                                  .addToCart(
                                                    context,
                                                    foodId:
                                                        foods[index].food_id,
                                                    qty: 1,
                                                  );
                                            },
                                            onTapOrder: () {
                                              user == null
                                                  ? Navigator.pushNamed(context,
                                                      RouteName.loginScreen)
                                                  : showModalBottomSheet(
                                                      context: context,
                                                      builder: (context) {
                                                        return DeliveryMode(
                                                          directOrder: true,
                                                          foodEntity:
                                                              foods[index],
                                                          name:
                                                              '${user?.first_name ?? ''} ${user?.last_name ?? ''}',
                                                        );
                                                      },
                                                    );
                                            },
                                            onTapAdd: () {
                                              setState(() {
                                                foodQty++;
                                              });
                                            },

                                            onTapRemove: () {
                                              setState(() {
                                                foodQty == 1 ? null : foodQty--;
                                              });
                                            },
                                            qty: foodQty,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
