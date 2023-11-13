// ignore_for_file: deprecated_member_use, lines_longer_than_80_chars, inference_failure_on_function_invocation, use_build_context_synchronously

import 'dart:io';

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:Foodlify/features/home/domain/entities/restaurant_entitties.dart';
import 'package:Foodlify/features/home/domain/entities/restaurant_food_entity.dart';
import 'package:Foodlify/features/home/domain/entities/users_entity.dart';
import 'package:Foodlify/features/home/presentation/cubit/add_to_cart_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_restaurant_food_cubit.dart';
import 'package:Foodlify/features/home/presentation/pages/add_to_cart.dart';
import 'package:Foodlify/features/home/presentation/pages/timelin_screen.dart';
import 'package:Foodlify/features/home/presentation/widgets/delivery_mode_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({
    super.key,
    required this.params,
  });
  final RestaurantArguement params;
  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  bool meals = true;
  bool hotDeals = false;
  List<RestaurantFoodEntity>? foodByRestaurant;
  Future<void> getFoodFromRestaurant() async {
    await checkLocation();
    context.read<GetRestaurantFoodCubit>().getFoodByRestaurant(
          context,
          id: widget.params.restaurantEntity.restaurant_id ?? '',
          location: finalLocation ?? '',
        );
  }

  String symbol = '';
  String getCurrency() {
    final format =
        NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
    symbol = format.currencySymbol;
    return format.currencySymbol;
  }

  Future<String?> getLocationString() async {
    final preferences = await SharedPreferences.getInstance();
    final location = preferences.getString('location');
    return location;
  }

  String? finalLocation;
  checkLocation() async {
    final newlocation = await getLocationString();
    if (newlocation != null || newlocation != '') {
      setState(() {
        finalLocation = newlocation!;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, getFoodFromRestaurant);
    getCurrency();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetRestaurantFoodCubit, GetRestaurantFoodState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          success: (r) {
            setState(() {
              foodByRestaurant =
                  context.read<GetRestaurantFoodCubit>().foodByRetaurant;
            });
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            height: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 230,
                  child: Stack(
                    children: [
                      Image.asset(
                        AppAssets.restaurantCover,
                        height: 208,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 208,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Gap(40),
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: FoodlieColors.foodlieWhite,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: Align(
                          child: Container(
                            height: 73,
                            width: 73,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: FoodlieColors.primaryColor,
                              border: Border.all(
                                width: 5,
                                color: FoodlieColors.foodlieWhite,
                              ),
                            ),
                            child: Center(
                              child: TextBold(
                                '${widget.params.restaurantEntity.name?.characters.first}${widget.params.restaurantEntity.name?.characters.last}',
                                fontSize: 21,
                                fontWeight: FontWeight.w700,
                                color: FoodlieColors.foodlieWhite,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Gap(8),
                Container(
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffDCDFE5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppAssets.kitchenIcon),
                        const Gap(5),
                        TextBody(
                          'Restaurannt',
                          fontSize: 10,
                          color: FoodlieColors.textColor,
                        )
                      ],
                    ),
                  ),
                ),
                const Gap(9),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          child: Column(
                            children: [
                              const Gap(10),
                              TextBold(
                                widget.params.restaurantEntity.name ?? '',
                                fontSize: 15,
                                color: FoodlieColors.primaryColor,
                              ),
                              const Gap(5),
                              TextSemiBold(
                                widget.params.restaurantEntity.address ?? '',
                                fontSize: 13,
                                color: FoodlieColors.grey,
                              ),
                              const Gap(15),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RestaurantItem(
                                      icon: AppAssets.clockIcon,
                                      title: 'Close 10:00pm',
                                    ),
                                    RestaurantItem(
                                      icon: AppAssets.starIcon,
                                      title: '4.5 ',
                                    ),
                                    RestaurantItem(
                                      icon: AppAssets.locationIcon2,
                                      title: '2km',
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(29),
                              /* Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.searchIcon,
                                    height: 32,
                                    width: 32,
                                    color: FoodlieColors.grey,
                                  ),
                                  RestaurantSearchItem(
                                    title: 'Salad',
                                    active: true,
                                    onTap: () {},
                                  ),
                                  RestaurantSearchItem(
                                    title: 'Rice',
                                    active: false,
                                    onTap: () {},
                                  ),
                                  RestaurantSearchItem(
                                    title: 'Sushi',
                                    active: false,
                                    onTap: () {},
                                  ),
                                  RestaurantSearchItem(
                                    title: 'Sea Food',
                                    active: false,
                                    onTap: () {},
                                  )
                                ],
                              )*/
                              /* Container(
                                height: 118,
                                width: double.infinity,
                                color: const Color(0xffFFE8D2).withOpacity(0.3),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextSemiBold(
                                            'Gallery',
                                            fontSize: 12,
                                            color: FoodlieColors.grey,
                                          ),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                  height: 17,
                                                  width: 17,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: FoodlieColors
                                                          .primaryColor,
                                                    ),
                                                  ),
                                                  child: const Center(
                                                    child: Icon(
                                                      Icons.keyboard_arrow_left,
                                                      color: FoodlieColors
                                                          .primaryColor,
                                                      size: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const Gap(8),
                                              GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                  height: 17,
                                                  width: 17,
                                                  decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color:
                                                        FoodlieColors.primaryColor,
                                                  ),
                                                  child: const Center(
                                                    child: Icon(
                                                      Icons.keyboard_arrow_right,
                                                      color: FoodlieColors
                                                          .foodlieWhite,
                                                      size: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Gap(10),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                        ),
                                        child: Row(
                                          children: List.generate(
                                            10,
                                            (index) => Padding(
                                              padding: const EdgeInsets.only(
                                                right: 5,
                                              ),
                                              child: Image.asset(
                                                AppAssets.amala,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),*/
                              const Gap(10),
                              Container(
                                height: 55,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xffF2EAEA),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            meals = true;
                                            hotDeals = false;
                                          });
                                        },
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: FoodlieColors.foodlieWhite,
                                            borderRadius:
                                                const BorderRadius.only(
                                              topRight: Radius.circular(24),
                                              bottomRight: Radius.circular(24),
                                            ),
                                            gradient: meals
                                                ? const LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: [
                                                      Color(0xffFD654D),
                                                      Color(0XFFfd674c),
                                                      Color(0xffFC6748),
                                                      Color(0xffF38A2B),
                                                      Color(0xffF38B2A)
                                                    ],
                                                  )
                                                : null,
                                          ),
                                          child: Center(
                                            child: meals
                                                ? TextBold(
                                                    'Meals',
                                                    fontSize: 14,
                                                    color: FoodlieColors
                                                        .foodlieWhite,
                                                  )
                                                : TextBody(
                                                    'Meals',
                                                    fontSize: 14,
                                                    color: FoodlieColors
                                                        .primaryColor,
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            hotDeals = true;
                                            meals = false;
                                          });
                                        },
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(24),
                                              bottomLeft: Radius.circular(24),
                                            ),
                                            gradient: hotDeals
                                                ? const LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: [
                                                      Color(0xffFD654D),
                                                      Color(0XFFfd674c),
                                                      Color(0xffFC6748),
                                                      Color(0xffF38A2B),
                                                      Color(0xffF38B2A)
                                                    ],
                                                  )
                                                : null,
                                            color: FoodlieColors.foodlieWhite,
                                          ),
                                          child: Center(
                                            child: hotDeals
                                                ? TextBold(
                                                    'Hot Deals',
                                                    fontSize: 14,
                                                    color: FoodlieColors
                                                        .foodlieWhite,
                                                  )
                                                : TextBody(
                                                    'Hot Deals',
                                                    fontSize: 14,
                                                    color: FoodlieColors
                                                        .primaryColor,
                                                  ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Gap(9),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                ),
                                child: meals
                                    ? Column(
                                        children: List.generate(
                                            foodByRestaurant?.length ?? 0,
                                            (index) {
                                          final amount = NumberFormat.currency(
                                            customPattern: '#,##,000',
                                            locale: 'en_us',
                                            symbol: '₦',
                                            decimalDigits: 2,
                                          ).format(
                                              foodByRestaurant?[index].price ??
                                                  0);
                                          return MealAroundMeCard(
                                            restaurantName:
                                                foodByRestaurant?[index]
                                                        .restaurant ??
                                                    '',
                                            foodName: foodByRestaurant?[index]
                                                    .title ??
                                                '',
                                            foodPrice: '$symbol$amount',
                                            onTap: () {
                                              Navigator.pushNamed(
                                                context,
                                                RouteName.addToCart,
                                                arguments: FoodArgument(
                                                  foodDetails:
                                                      foodByRestaurant![index],
                                                ),
                                              );
                                            },
                                            description:
                                                foodByRestaurant?[index]
                                                        .description ??
                                                    '',
                                            onTapAddtoCart: () {
                                              context
                                                  .read<AddToCartCubit>()
                                                  .addToCart(
                                                    context,
                                                    foodId:
                                                        foodByRestaurant?[index]
                                                                .food_id ??
                                                            '',
                                                    qty: 1,
                                                  );
                                            },
                                            onTapOrder: () {
                                              showModalBottomSheet(
                                                context: context,
                                                builder: (context) {
                                                  return DeliveryMode(
                                                    directOrder: true,
                                                    foodEntity:
                                                        foodByRestaurant?[
                                                            index],
                                                    name:
                                                        '${widget.params.usersEntity.first_name} ${widget.params.usersEntity.last_name}',
                                                  );
                                                },
                                              );
                                            },
                                            onTapAdd: () {},
                                            onTapRemove: () {},
                                            qty: 1,
                                            img: foodByRestaurant?[index]
                                                    .image ??
                                                '',
                                          );
                                        }),
                                      )
                                    : const SizedBox(), /*  Column(
                                        children: List.generate(
                                          3,
                                          (index) => Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 15,
                                            ),
                                            child: Container(
                                              height: 139,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                  16,
                                                ),
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
                                                  horizontal: 16,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 110,
                                                      width: 110,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: FoodlieColors
                                                            .foodlieWhite,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: FoodlieColors
                                                                .foodlieBlack
                                                                .withOpacity(
                                                              0.15,
                                                            ),
                                                            blurRadius: 20,
                                                            offset:
                                                                const Offset(0, 10),
                                                          ),
                                                        ],
                                                      ),
                                                      child: const Center(
                                                        child: CircleAvatar(
                                                          radius: 45,
                                                          backgroundImage:
                                                              AssetImage(
                                                            AppAssets.amala,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const Gap(10),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          TextSemiBold(
                                                            'Vegetable Soup',
                                                            fontSize: 13,
                                                            color: FoodlieColors
                                                                .foodlieBlack,
                                                          ),
                                                          const Gap(4),
                                                          TextBody(
                                                            'Freshly cooked vegetable soup with eba (garri)',
                                                            fontSize: 13,
                                                            color:
                                                                FoodlieColors.grey,
                                                          ),
                                                          const Gap(13),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                height: 23,
                                                                width: 63,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FoodlieColors
                                                                      .primaryColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    8,
                                                                  ),
                                                                ),
                                                                child: Center(
                                                                  child: TextBold(
                                                                    'Get it Now',
                                                                    fontSize: 10,
                                                                    color: FoodlieColors
                                                                        .foodlieWhite,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                height: 23,
                                                                width: 81,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    8,
                                                                  ),
                                                                  color:
                                                                      const Color(
                                                                    0xff27790A,
                                                                  ),
                                                                ),
                                                                child: Center(
                                                                  child: TextBold(
                                                                    '20% Discount',
                                                                    fontSize: 10,
                                                                    color: FoodlieColors
                                                                        .foodlieWhite,
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          const Gap(10),
                                                          Row(
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {},
                                                                child: Container(
                                                                  height: 28,
                                                                  width: 94,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                      8,
                                                                    ),
                                                                    color:
                                                                        const Color(
                                                                      0xffDCDFE5,
                                                                    ).withOpacity(
                                                                      0.5,
                                                                    ),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      SvgPicture
                                                                          .asset(
                                                                        AppAssets
                                                                            .cartIcon,
                                                                        height: 15,
                                                                        width: 15,
                                                                        color:
                                                                            const Color(
                                                                          0xff757575,
                                                                        ),
                                                                      ),
                                                                      const Gap(4),
                                                                      TextBody(
                                                                        'Add to Cart',
                                                                        fontSize:
                                                                            10,
                                                                        color:
                                                                            const Color(
                                                                          0xff363C4F,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              const Gap(9),
                                                              GestureDetector(
                                                                onTap: () {},
                                                                child: Container(
                                                                  height: 28,
                                                                  width: 62,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                      8,
                                                                    ),
                                                                    color:
                                                                        const Color(
                                                                      0xffDCDFE5,
                                                                    ).withOpacity(
                                                                      0.5,
                                                                    ),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      SvgPicture
                                                                          .asset(
                                                                        AppAssets
                                                                            .ordersIcon,
                                                                        height: 15,
                                                                        width: 12,
                                                                      ),
                                                                      const Gap(9),
                                                                      TextBody(
                                                                        'Order',
                                                                        fontSize:
                                                                            10,
                                                                        color: FoodlieColors
                                                                            .textColor,
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
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
                                          ),
                                        ),
                                      ),*/
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class RestaurantSearchItem extends StatelessWidget {
  const RestaurantSearchItem({
    super.key,
    required this.title,
    required this.active,
    required this.onTap,
  });
  final String title;
  final bool active;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 29,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          color:
              active ? FoodlieColors.foodlieBlack : FoodlieColors.foodlieWhite,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color(0xffDCDFE5),
              offset: Offset(0, 1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: Center(
            child: TextBody(
              title,
              fontSize: 12,
              color: active
                  ? FoodlieColors.foodlieWhite
                  : const Color(
                      0xff757575,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class RestaurantItem extends StatelessWidget {
  const RestaurantItem({
    super.key,
    required this.icon,
    required this.title,
  });
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xffDCDFE5).withOpacity(0.3),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              color: const Color(0xff363C4F),
              height: 14,
              width: 14,
            ),
            const Gap(6),
            TextBody(
              title,
              fontSize: 10,
              color: FoodlieColors.textColor,
            )
          ],
        ),
      ),
    );
  }
}

class RestaurantArguement {
  RestaurantArguement({
    required this.restaurantEntity,
    required this.usersEntity,
  });

  final RestaurantEntity restaurantEntity;
  final UsersEntity usersEntity;
}
