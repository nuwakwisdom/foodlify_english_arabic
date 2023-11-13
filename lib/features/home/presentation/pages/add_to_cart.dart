// ignore_for_file: deprecated_member_use, inference_failure_on_function_invocation, lines_longer_than_80_chars, unnecessary_statements, avoid_bool_literals_in_conditional_expressions

import 'dart:io';

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/app/widgets/busy_button.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:Foodlify/features/account/presentation/cubit/favourite_cubit.dart';
import 'package:Foodlify/features/home/domain/entities/restaurant_food_entity.dart';
import 'package:Foodlify/features/home/presentation/cubit/add_to_cart_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_food_by_category_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_user_cubit.dart';
import 'package:Foodlify/features/home/presentation/pages/timelin_screen.dart';
import 'package:Foodlify/features/home/presentation/widgets/login_required_dialog.dart';
import 'package:Foodlify/features/restaurant/presentation/pages/restaurant_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({
    super.key,
    required this.params,
  });
  final FoodArgument params;

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool toppings = true;
  bool beverages = false;
  int quantity = 1;
  String symbol = '';
  String getCurrency() {
    final format =
        NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
    symbol = format.currencySymbol;
    return format.currencySymbol;
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<GetFoodByCategoryCubit>().getFoodByCategories(
            context,
            location: widget.params.location ?? '',
            category: widget.params.foodDetails.category,
          );
    });
    getCurrency();
  }

  @override
  Widget build(BuildContext context) {
    final amount = NumberFormat.currency(
      customPattern: '#,###,###',
      locale: 'en_us',
      symbol: '₦',
      decimalDigits: 2,
    ).format(
      widget.params.foodDetails.price,
    );
    final relatedFood = context.read<GetFoodByCategoryCubit>().foodByCategries;
    final favourites = context.read<FavouriteCubit>().favourites;
    final user = context.read<GetUserCubit>().users;

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
            color: Color(0xff000000),
          ),
        ),
        title: TextSemiBold(
          'Food Detail',
          fontSize: 14,
          color: const Color(0xff000000),
        ),
        centerTitle: true,
      ),
      bottomSheet: Container(
        height: 88,
        width: double.infinity,
        decoration: BoxDecoration(
          color: FoodlieColors.foodlieWhite,
          boxShadow: [
            BoxShadow(
              blurRadius: 9,
              color: FoodlieColors.foodlieBlack.withOpacity(0.06),
              spreadRadius: 1,
              offset: const Offset(0, -5),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextSemiBold(
                        'Price',
                        fontSize: 14,
                        color: FoodlieColors.grey,
                      ),
                      TextSemiBold(
                        '$symbol$amount',
                        fontSize: 21,
                        color: FoodlieColors.foodlieBlack,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      user == null
                          ? showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => const LoginRequiredDialog(),
                            )
                          : Navigator.pushNamed(
                              context,
                              RouteName.cartProceed,
                            );
                      /* showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return const DeliveryMode(
                                    directOrder: true,
                                    name: '',
                                  );nuwak
                                },*/
                    },
                    child: Container(
                      height: 40,
                      width: 142,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: FoodlieColors.primaryColor,
                      ),
                      child: Center(
                        child: TextSemiBold(
                          'View Cart',
                          fontSize: 14,
                          color: FoodlieColors.foodlieWhite,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Gap(19),
            ],
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(20),
                    Align(
                      child: Container(
                        height: 141,
                        width: 141,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffD9D9D9),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: ClipOval(
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(48), // Image radius

                              child: CachedNetworkImage(
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.error,
                                  color: FoodlieColors.primaryColor,
                                  size: 30,
                                ),
                                imageUrl: widget.params.foodDetails.image,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(
                                    color: FoodlieColors.primaryColor,
                                  ),
                                ),
                                height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Gap(19),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 24,
                          width: 63,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xffDCDFE5).withOpacity(0.3),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppAssets.clockIcon,
                              ),
                              const Gap(6),
                              TextBody(
                                '20 min',
                                fontSize: 10,
                                color: const Color(0xff363C4F),
                              )
                            ],
                          ),
                        ),
                        const Gap(12),
                        Container(
                          height: 24,
                          width: 44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xffDCDFE5).withOpacity(0.3),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppAssets.starIcon,
                              ),
                              const Gap(6),
                              TextBody(
                                '4.5 ',
                                fontSize: 10,
                                color: const Color(0xff363C4F),
                              )
                            ],
                          ),
                        ),
                        const Gap(12),
                        Container(
                          height: 24,
                          width: 51,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xffDCDFE5).withOpacity(0.3),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppAssets.locationIcon2,
                                height: 12,
                                width: 9,
                                color: const Color(0xff000000),
                              ),
                              const Gap(6),
                              TextBody(
                                '2km',
                                fontSize: 10,
                                color: const Color(0xff363C4F),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    /*   Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: FoodlieColors.primaryColor,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                quantity == 1 ? null : quantity--;
                              });
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: FoodlieColors.primaryColor,
                            ),
                          ),
                          TextSemiBold(
                            '$quantity',
                            fontSize: 16,
                            color: FoodlieColors.primaryColor,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            icon: const Icon(
                              Icons.add,
                              color: FoodlieColors.primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),*/
                    const Gap(10),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextSemiBold(
                                widget.params.foodDetails.title,
                                fontSize: 18,
                                color: FoodlieColors.textColor,
                              ),
                              const Gap(10),
                            ],
                          ),
                        ),
                        const Gap(20),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border:
                                Border.all(color: FoodlieColors.primaryColor),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity == 1 ? null : quantity--;
                                  });
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: FoodlieColors.primaryColor,
                                ),
                              ),
                              TextSemiBold(
                                '$quantity',
                                fontSize: 14,
                                color: FoodlieColors.primaryColor,
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: FoodlieColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteName.restaurantPage,
                            );
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AppAssets.newHome,
                              ),
                              const Gap(10),
                              TextBold(
                                widget.params.foodDetails.restaurant,
                                fontSize: 13,
                                color: FoodlieColors.primaryColor,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppAssets.kitchenIcon,
                            ),
                            const Gap(5),
                            TextBold(
                              'Restaurant',
                              fontSize: 13,
                              color: FoodlieColors.textColor,
                            )
                          ],
                        )
                      ],
                    ),
                    TextBody(
                      widget.params.foodDetails.description,
                      fontSize: 16,
                      color: FoodlieColors.grey,
                      maxLines: 1000,
                    ),
                    const Gap(21),
                    BusyButton(
                        title: 'Add To Cart',
                        onTap: () {
                          user == null
                              ? showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) =>
                                      const LoginRequiredDialog(),
                                )
                              : context.read<AddToCartCubit>().addToCart(
                                    context,
                                    foodId: widget.params.foodDetails.food_id,
                                    qty: quantity,
                                  );
                        }),
                    const Gap(21),
                    TextSemiBold(
                      'Related Food',
                      fontSize: 18,
                      color: FoodlieColors.primaryColor,
                    ),
                    const Gap(20),
                    Column(
                      children:
                          List.generate(relatedFood?.length ?? 0, (index) {
                        final amount = NumberFormat.currency(
                          customPattern: '#,###,###',
                          locale: 'en_us',
                          symbol: '₦',
                          decimalDigits: 2,
                        ).format(relatedFood?[index].price ?? 0);
                        final isFavourite = relatedFood == null
                            ? false
                            : favourites.any(
                                (element) =>
                                    element.food_id ==
                                    relatedFood[index].food_id,
                              );

                        return MealAroundMeCard(
                          restaurantName: relatedFood?[index].restaurant ?? '',
                          // ignore: unnecessary_string_interpolations
                          img: '${relatedFood?[index].image ?? ''}',
                          foodName: relatedFood?[index].title ?? '',
                          foodPrice: '$symbol$amount',
                          favourite: isFavourite,
                          onTap: () {
                            /* Navigator.pushNamed(
                              context,
                              RouteName.addToCart,
                              arguments: FoodArgument(
                                foodDetails: relatedFood![index],
                                location: widget.params.location,
                              ),
                            );*/
                          },
                          description: relatedFood?[index].description ?? '',
                          onTapAddtoCart: () {
                            user == null
                                ? showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) =>
                                        const LoginRequiredDialog(),
                                  )
                                : context.read<AddToCartCubit>().addToCart(
                                      context,
                                      foodId: relatedFood?[index].food_id ?? '',
                                      qty: 1,
                                    );
                          },
                          onTapFavourite: () {
                            if (isFavourite) {
                              context.read<FavouriteCubit>().removedFavourites(
                                    relatedFood[index].food_id,
                                    context,
                                  );
                            } else {
                              context.read<FavouriteCubit>().addToFavourites(
                                    relatedFood![index].food_id,
                                    context,
                                  );
                            }
                          },
                          onTapOrder: () {
                            /*  user == null
                                ? showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) =>
                                        const LoginRequiredDialog(),
                                  )
                                : Navigator.pushNamed(
                                    context, RouteName.newDeliveryScreen,
                                    arguments: DeliveryArguement(
                                          
                                        amount:
                                            foodByCategory?[index].price ??
                                                0,
                                        cartId: foodByCategory?[index]
                                                .food_id ??
                                            '',
                                        noItem: 1,
                                        fromCart: false,
                                        username:
                                            '${user.first_name} ${user.last_name}'));*/
                          },
                          onTapAdd: () {},
                          onTapRemove: () {
                            setState(() {});
                          },
                          qty: 1,
                        );
                      }),
                    )
                    /*  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ToppingsContainner(
                          title: 'Toppings',
                          onTap: () {
                            setState(() {
                              toppings = !toppings;
                            });
                          },
                        ),
                        ToppingsContainner(
                          title: 'Beverages',
                          onTap: () {
                            setState(() {
                              beverages = !beverages;
                            });
                          },
                        )
                      ],
                    ),
                    const Gap(11),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextSemiBold(
                          'Reviews',
                          fontSize: 16,
                          color: FoodlieColors.textColor,
                        ),
                        TextBody(
                          'comment (3)',
                          fontSize: 12,
                          color: const Color(0xff757575),
                        )
                      ],
                    ),
                    const Gap(22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                AppAssets.userImg,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const Gap(10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextSemiBold(
                                  'Faith Uju',
                                  fontSize: 14,
                                  color: FoodlieColors.textColor,
                                ),
                                TextBody(
                                  '15 orders',
                                  fontSize: 12,
                                  color: FoodlieColors.grey,
                                )
                              ],
                            )
                          ],
                        ),
                        RatingBarIndicator(
                          rating: 2.75,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: FoodlieColors.primaryColor,
                          ),
                          itemCount: 5,
                          itemSize: 30.0,
                          direction: Axis.horizontal,
                        ),
                      ],
                    ),
                    const Gap(12),
                    TextBody(
                      'The salad arrived fresh and delicious.',
                      fontSize: 14,
                      color: const Color(0xff757575),
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppAssets.likeIcon,
                            ),
                            const Gap(5),
                            TextBody(
                              '5',
                              fontSize: 12,
                              color: FoodlieColors.textColor,
                            )
                          ],
                        ),
                        const Gap(24),
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppAssets.dislike,
                            ),
                            const Gap(5),
                            TextBody(
                              '1',
                              fontSize: 12,
                              color: FoodlieColors.textColor,
                            )
                          ],
                        ),
                      ],
                    )*/
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ToppingsContainner extends StatelessWidget {
  const ToppingsContainner({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: FoodlieColors.foodliePink,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Center(
            child: TextSemiBold(title,
                fontSize: 16, color: FoodlieColors.foodlieWhite),
          ),
        ),
      ),
    );
  }
}

class FoodArgument {
  FoodArgument({
    required this.foodDetails,
    this.location,
  });

  final RestaurantFoodEntity foodDetails;
  String? location;
}
