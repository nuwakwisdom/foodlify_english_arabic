import 'dart:io';

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/app_colors.dart';
import 'package:Foodlify/core/navigators/route_name.dart';
import 'package:Foodlify/features/account/presentation/cubit/favourite_cubit.dart';
import 'package:Foodlify/features/account/presentation/cubit/favourite_state.dart';
import 'package:Foodlify/features/home/domain/entities/restaurant_entitties.dart';
import 'package:Foodlify/features/home/domain/entities/restaurant_food_entity.dart';
import 'package:Foodlify/features/home/presentation/cubit/add_to_cart_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_user_cubit.dart';
import 'package:Foodlify/features/home/presentation/pages/add_to_cart.dart';
import 'package:Foodlify/features/home/presentation/pages/timelin_screen.dart';
import 'package:Foodlify/features/home/presentation/widgets/delivery_mode_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  int foodTypeIndex = 0;
  int? selectedCategories;
  bool allCategories = true;
  List<RestaurantEntity>? restaurants;
  List<RestaurantFoodEntity>? foods;
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

    Future.delayed(Duration.zero, () {
      context.read<FavouriteCubit>().getFavourites(context);
    });
    getCurrency();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<GetUserCubit>().users;
    return Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
      appBar: AppBar(
        backgroundColor: FoodlieColors.foodlieWhite,
        elevation: 0,
        title: TextSemiBold(
          'Favourites',
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
        child: BlocConsumer<FavouriteCubit, FavouriteState>(
          listener: (context, state) {},
          builder: (context, state) {
            final favourites = context.read<FavouriteCubit>().favourites;
            return favourites.isEmpty
                ? const Center(
                    child: Text(
                      'No favourite food found!!',
                    ),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      favourites.length ?? 0,
                      (index) {
                        final amount = NumberFormat.currency(
                          customPattern: '#,##,000',
                          locale: 'en_us',
                          symbol: '₦',
                          decimalDigits: 2,
                        ).format(favourites[index].price ?? 0);
                        return Slidable(
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (_) async {
                                  await context.read<FavouriteCubit>().removedFavourites(
                                        favourites[index].food_id,
                                        context,
                                      );
                                },
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Remove',
                              ),
                            ],
                          ),
                          child: MealAroundMeCard(
                            restaurantName: favourites[index].restaurant ?? '',
                            // ignore: unnecessary_string_interpolations
                            img: '${favourites[index].image ?? ''}',
                            foodName: favourites[index].title ?? '',
                            foodPrice: '$symbol$amount',
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteName.addToCart,
                                arguments: FoodArgument(
                                  foodDetails: favourites[index],
                                ),
                              );
                            },
                            description: favourites[index].description ?? '',
                            onTapAddtoCart: () {
                              context.read<AddToCartCubit>().addToCart(
                                    context,
                                    foodId: favourites[index].food_id ?? '',
                                    qty: 1,
                                  );
                            },
                            onTapOrder: () {
                              user == null
                                  ? Navigator.pushNamed(
                                      context,
                                      RouteName.loginScreen,
                                    )
                                  : showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return DeliveryMode(
                                          directOrder: true,
                                          foodEntity: favourites?[index],
                                          name: '${user?.first_name ?? ''} ${user?.last_name ?? ''}',
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
                          ),
                        );
                      },
                    ),
                  );
          },
        ),
      ),
    );
  }
}
