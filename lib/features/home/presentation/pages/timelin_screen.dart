// ignore_for_file: deprecated_member_use, avoid_bool_literals_in_conditional_expressions, unnecessary_statements, inference_failure_on_function_invocation, lines_longer_than_80_chars, duplicate_ignore, use_if_null_to_convert_nulls_to_bools, prefer_is_empty, unnecessary_string_interpolations

import 'dart:io';

import 'package:Foodlify/app/style/fonts.dart';
import 'package:Foodlify/core/constant/app_assets.dart';
import 'package:Foodlify/core/constant/app_colors.dart';
import 'package:Foodlify/core/navigators/route_name.dart';
import 'package:Foodlify/features/account/presentation/cubit/favourite_cubit.dart';
import 'package:Foodlify/features/home/domain/entities/restaurant_entitties.dart';
import 'package:Foodlify/features/home/domain/entities/restaurant_food_entity.dart';
import 'package:Foodlify/features/home/domain/entities/users_entity.dart';
import 'package:Foodlify/features/home/presentation/cubit/add_to_cart_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_all_restaurant_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_cart_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_food_by_category_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_food_categories_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_user_cubit.dart';
import 'package:Foodlify/features/home/presentation/pages/add_to_cart.dart';
import 'package:Foodlify/features/home/presentation/pages/choose_location_page.dart';
import 'package:Foodlify/features/home/presentation/widgets/login_required_dialog.dart';
import 'package:Foodlify/features/restaurant/presentation/pages/restaurant_page.dart';
import 'package:Foodlify/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upgrader/upgrader.dart';
import 'package:Foodlify/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TimelinScreen extends StatefulWidget {
  const TimelinScreen({
    super.key,
    required this.cityName,
  });
  final String cityName;
  @override
  State<TimelinScreen> createState() => _TimelinScreenState();
}

class _TimelinScreenState extends State<TimelinScreen> {
  List<Widget> imageSlider = [
    Image.asset(
      AppAssets.sliderImg,
    ),
    Image.asset(
      AppAssets.sliderImg,
    ),
    Image.asset(
      AppAssets.sliderImg,
    ),
  ];

  int _current = 0;
  int foodTypeIndex = 0;
  int? selectedCategories;
  bool allCategories = true;
  final CarouselController _controller = CarouselController();
  List<RestaurantEntity>? restaurants;
  List<RestaurantFoodEntity>? foods;
  int foodQty = 1;
  String symbol = '';
  String getCurrency() {
    final format =
        NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
    symbol = format.currencySymbol;
    return format.currencySymbol;
  }

  String language = '';
  Future<String?> getLocationString() async {
    final preferences = await SharedPreferences.getInstance();
    final location = preferences.getString('location');
    final selectedlanguage = preferences.getString('languageCode') ?? 'en';
    setState(() {
      selectedlanguage == 'ar' ? language = 'عربي' : language = 'English';
    });
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

  int pageNumber = 0;
  late ScrollController scrollController;
  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      setState(() {
        pageNumber++;
        print(pageNumber);
        context.read<GetFoodByCategoryCubit>().getPaginatedFood(context,
            location: finalLocation ?? '', page: pageNumber);
      });
    }
    if (scrollController.offset <= scrollController.position.minScrollExtent &&
        !scrollController.position.outOfRange) {
      setState(() {});
    }
  }

  bool loadingPagination = false;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    checkLocation();
    super.initState();
    getCurrency();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<GetUserCubit>().users;
    final cart = context.read<GetCartCubit>().carts;
    final favourites = context.read<FavouriteCubit>().favourites;
    final banners = context.read<GetAllRestaurantCubit>().banners;
    return UpgradeAlert(
      upgrader: Upgrader(
          durationUntilAlertAgain: const Duration(seconds: 2),
          showIgnore: true,
          minAppVersion: '1.0.0',
          showLater: false,
          showReleaseNotes: true,
          canDismissDialog: true,
          dialogStyle: UpgradeDialogStyle.cupertino),
      child: Scaffold(
        backgroundColor: FoodlieColors.foodlieWhite,
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12),
                                  ),
                                ),
                                context: context,
                                builder: (context) {
                                  return const LocationModal();
                                });
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_city,
                                  color: FoodlieColors.grey,
                                ),
                                const Gap(5),
                                TextBold(
                                  widget.cityName,
                                  fontSize: 14,
                                  color: FoodlieColors.textColor,
                                ),
                                const Gap(5),
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: FoodlieColors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: FoodlieColors.foodlieWhite,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              Navigator.pop(context);
                                              App.setLocale(
                                                context,
                                                const Locale('en'),
                                              );
                                              language = 'English';
                                            });
                                          },
                                          child: TextSemiBold(
                                            'English',
                                            fontSize: 15,
                                            color: FoodlieColors.primaryColor,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              Navigator.pop(context);
                                              App.setLocale(
                                                context,
                                                const Locale('ar'),
                                              );
                                              language = 'عربي';
                                            });
                                          },
                                          child: TextSemiBold(
                                            'عربي',
                                            fontSize: 15,
                                            color: FoodlieColors.primaryColor,
                                          ),
                                        ),
                                        const Gap(30),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: TextSemiBold(
                            language,
                            fontSize: 15,
                            color: FoodlieColors.primaryColor,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocConsumer<GetUserCubit, GetUserState>(
                          listener: (context, state) {
                            state.maybeWhen(orElse: () {}, error: () {});
                          },
                          builder: (context, state) {
                            return TextSemiBold(
                              user == null
                                  ? ''
                                  : '${AppLocalizations.of(context).hi} ${user.first_name ?? ''}',
                              fontSize: 15,
                              color: FoodlieColors.primaryColor,
                            );
                          },
                        ),
                        Row(
                          children: [
                            TopBarOOptions(
                              icon: AppAssets.searchIcon1,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RouteName.searchFood,
                                );
                              },
                            ),
                            const Gap(15),
                            /*
                            TopBarOOptions(
                              icon: AppAssets.wallet,
                              onTap: () {
                                user == null
                                    ? showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) =>
                                            const LoginRequiredDialog(),
                                      )
                                    : Navigator.pushNamed(
                                        context,
                                        RouteName.walletPage,
                                      );
                              },
                            ),*/
                            //const Gap(15),
                            GestureDetector(
                              onTap: () {
                                user == null
                                    ? showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) =>
                                            const LoginRequiredDialog(),
                                      )
                                    : Navigator.pushNamed(
                                        context,
                                        RouteName.cartProceed,
                                      );
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: FoodlieColors.primaryColor,
                                ),
                                child: Stack(
                                  children: [
                                    Center(
                                      child: SvgPicture.asset(
                                        AppAssets.cartIcon,
                                        height: 20,
                                        width: 20,
                                        color: FoodlieColors.foodlieWhite,
                                      ),
                                    ),
                                    /*if (cart == null || cart.cart_foods.isEmpty)
                                      const SizedBox()
                                    else*/
                                    if (cart?.cart_foods.length == 0 ||
                                        cart?.cart_foods == null)
                                      const SizedBox()
                                    else
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          height: 18,
                                          width: 18,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xff27790A),
                                          ),
                                          child: Center(
                                            child: TextSemiBold(
                                              '${cart?.cart_foods.length ?? 0}',
                                              fontSize: 6,
                                              color: FoodlieColors.foodlieWhite,
                                            ),
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            ),
                            const Gap(15),
                            TopBarOOptions(
                              icon: AppAssets.bell,
                              onTap: () {
                                user == null
                                    ? showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) =>
                                            const LoginRequiredDialog(),
                                      )
                                    : Navigator.pushNamed(
                                        context,
                                        RouteName.notificationScreen,
                                      );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Gap(10),
                  ],
                ),
              ),
              const Gap(11),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: BlocConsumer<GetFoodCategoriesCubit,
                              GetFoodCategoriesState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              final foodCategories = context
                                  .read<GetFoodCategoriesCubit>()
                                  .foodCategories;
                              return Row(
                                children: [
                                  FoodTypeWidget(
                                    img: '',
                                    title: 'All',
                                    active: allCategories,
                                    onTap: () {
                                      setState(() {
                                        allCategories = true;
                                        selectedCategories = null;
                                        context
                                            .read<GetFoodByCategoryCubit>()
                                            .getAllFood(context,
                                                location: finalLocation ?? '',
                                                page: 0);
                                      });
                                    },
                                  ),
                                  Row(
                                    children: List.generate(
                                      foodCategories?.length ?? 0,
                                      (index) {
                                        return FoodTypeWidget(
                                          img: '',
                                          title: foodCategories?[index]
                                                  .category_name ??
                                              '',
                                          active: selectedCategories == index,
                                          onTap: () {
                                            setState(
                                              () {
                                                selectedCategories = index;
                                                allCategories = false;
                                                context
                                                    .read<
                                                        GetFoodByCategoryCubit>()
                                                    .getFoodByCategories(
                                                      context,
                                                      location: widget.cityName,
                                                      category: foodCategories?[
                                                                  selectedCategories!]
                                                              .category_name ??
                                                          '',
                                                    );
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      const Gap(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBold(
                                  '${AppLocalizations.of(context).restaurantAroundYou}',
                                  fontSize: 13,
                                  color: FoodlieColors.foodlieBlack
                                      .withOpacity(0.6),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          RouteName.viewAllRestaurant,
                                        );
                                      },
                                      child: TextSemiBold(
                                        AppLocalizations.of(context).showAll,
                                        fontSize: 11,
                                        color: FoodlieColors.foodliePink,
                                      ),
                                    ),
                                    const Gap(5),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      color: FoodlieColors.foodliePink,
                                      size: 12,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const Gap(20),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: BlocBuilder<GetAllRestaurantCubit,
                                  GetAllRestaurantState>(
                                builder: (context, state) {
                                  final newRestaurannt = context
                                      .read<GetAllRestaurantCubit>()
                                      .allRestaurant;
                                  state.maybeWhen(
                                    orElse: () {},
                                    success: () {},
                                  );
                                  return Row(
                                    children: List.generate(
                                        newRestaurannt?.length ?? 0,
                                        // ignore: lines_longer_than_80_chars
                                        (index) {
                                      return FavRestaurantContainer(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            RouteName.restaurantPage,
                                            arguments: RestaurantArguement(
                                              restaurantEntity:
                                                  newRestaurannt![index],
                                              usersEntity:
                                                  user ?? const UsersEntity(),
                                            ),
                                          );
                                        },
                                        img: newRestaurannt?[index].logo ?? '',
                                        active: false,
                                        name: newRestaurannt?[index].name ?? '',
                                      );
                                    }),
                                  );
                                },
                              ),
                            ),
                            const Gap(9),
                            CarouselSlider(
                              items:
                                  List.generate(banners?.length ?? 0, (index) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: CachedNetworkImage(
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                      Icons.error,
                                      color: FoodlieColors.primaryColor,
                                      size: 30,
                                    ),
                                    imageUrl: banners?[index] ?? '',
                                  ),
                                );
                              }),
                              carouselController: _controller,
                              options: CarouselOptions(
                                viewportFraction: 1,
                                padEnds: false,
                                autoPlay: true,
                                enlargeCenterPage: true,
                                aspectRatio: 2,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: banners?.asMap().entries.map((entry) {
                                    return GestureDetector(
                                      onTap: () =>
                                          _controller.animateToPage(entry.key),
                                      child: Container(
                                        width: _current == entry.key ? 24 : 8.0,
                                        height: 8,
                                        margin: const EdgeInsets.only(
                                          right: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: _current == entry.key
                                              ? BorderRadius.circular(8)
                                              : null,
                                          shape: _current == entry.key
                                              ? BoxShape.rectangle
                                              : BoxShape.circle,
                                          color: _current == entry.key
                                              ? FoodlieColors.foodliePink
                                              : FoodlieColors.grey,
                                        ),
                                      ),
                                    );
                                  }).toList() ??
                                  [],
                            ),
                            const Gap(6),
                            TextSemiBold(
                              AppLocalizations.of(context).mealsAroundYou,
                              fontSize: 14.3,
                              color:
                                  FoodlieColors.foodlieBlack.withOpacity(0.6),
                              fontWeight: FontWeight.w700,
                            ),
                            const Gap(18),
                            BlocBuilder<GetFoodByCategoryCubit,
                                GetFoodByCategoryState>(
                              builder: (context, state) {
                                final foodByCategory = context
                                    .read<GetFoodByCategoryCubit>()
                                    .paginatedFoodList;
                                state.maybeWhen(
                                  orElse: () => const SizedBox(),
                                  loading: () {
                                    loadingPagination = true;
                                  },
                                  success: (r) {
                                    loadingPagination = false;
                                  },
                                  error: () {
                                    loadingPagination = false;
                                  },
                                );

                                return Column(
                                  children: [
                                    Column(
                                      children: List.generate(
                                          foodByCategory?.length ?? 0, (index) {
                                        final amount = NumberFormat.currency(
                                          customPattern: '#,##,000',
                                          locale: 'en_us',
                                          symbol: '₦',
                                          decimalDigits: 2,
                                        ).format(
                                            foodByCategory?[index].price ?? 0);
                                        final isFavourite = foodByCategory ==
                                                null
                                            ? false
                                            : favourites.any((element) =>
                                                element.food_id ==
                                                foodByCategory[index].food_id);

                                        return MealAroundMeCard(
                                          restaurantName: foodByCategory?[index]
                                                  .restaurant ??
                                              '',
                                          // ignore: unnecessary_string_interpolations
                                          img:
                                              '${foodByCategory?[index].image ?? ''}',
                                          foodName:
                                              foodByCategory?[index].title ??
                                                  '',
                                          foodPrice: '$symbol$amount',
                                          favourite: isFavourite,
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              RouteName.addToCart,
                                              arguments: FoodArgument(
                                                foodDetails:
                                                    foodByCategory![index],
                                                location: widget.cityName,
                                              ),
                                            );
                                          },
                                          description: foodByCategory?[index]
                                                  .description ??
                                              '',
                                          onTapAddtoCart: () {
                                            user == null
                                                ? showDialog(
                                                    barrierDismissible: false,
                                                    context: context,
                                                    builder: (context) =>
                                                        const LoginRequiredDialog(),
                                                  )
                                                : context
                                                    .read<AddToCartCubit>()
                                                    .addToCart(
                                                      context,
                                                      foodId:
                                                          foodByCategory?[index]
                                                                  .food_id ??
                                                              '',
                                                      qty: 1,
                                                    );
                                          },
                                          onTapFavourite: () {
                                            if (isFavourite) {
                                              context
                                                  .read<FavouriteCubit>()
                                                  .removedFavourites(
                                                    foodByCategory[index]
                                                        .food_id,
                                                    context,
                                                  );
                                            } else {
                                              context
                                                  .read<FavouriteCubit>()
                                                  .addToFavourites(
                                                    foodByCategory![index]
                                                        .food_id,
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
                                      }),
                                    ),
                                    loadingPagination
                                        ? Platform.isAndroid
                                            ? const Align(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FoodlieColors
                                                      .primaryColor,
                                                ),
                                              )
                                            : const Align(
                                                child:
                                                    CupertinoActivityIndicator(
                                                  color: FoodlieColors
                                                      .primaryColor,
                                                ),
                                              )
                                        : const SizedBox(),
                                    const Gap(30)
                                  ],
                                );
                              },
                            ),
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
      ),
    );
  }
}

class MealAroundMeCard extends StatefulWidget {
  const MealAroundMeCard({
    super.key,
    required this.foodName,
    required this.foodPrice,
    required this.onTap,
    required this.description,
    required this.onTapAddtoCart,
    required this.onTapOrder,
    required this.onTapAdd,
    required this.onTapRemove,
    required this.qty,
    required this.img,
    required this.restaurantName,
    this.onTapFavourite,
    this.favourite = false,
  });
  final String foodName;
  final String foodPrice;
  final String description;
  final VoidCallback onTapAddtoCart;
  final VoidCallback onTapOrder;
  final VoidCallback onTap;
  final VoidCallback onTapAdd;
  final VoidCallback onTapRemove;
  final String img;
  final int qty;
  final String restaurantName;
  final VoidCallback? onTapFavourite;
  final bool favourite;

  @override
  State<MealAroundMeCard> createState() => _MealAroundMeCardState();
}

class _MealAroundMeCardState extends State<MealAroundMeCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: FoodlieColors.foodlieWhite,
            boxShadow: const [
              BoxShadow(
                blurRadius: 8,
                spreadRadius: 0,
                color: Color(0xffDCDFE5),
                offset: Offset(0, 1),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 7,
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 120,
                  width: 110,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: FoodlieColors.foodlieWhite,
                            boxShadow: [
                              BoxShadow(
                                color: FoodlieColors.foodlieBlack.withOpacity(
                                  0.15,
                                ),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Center(
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
                                  imageUrl: widget.img,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                      color: FoodlieColors.primaryColor,
                                    ),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (widget.onTapFavourite != null)
                        GestureDetector(
                          onTap: widget.onTapFavourite,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 10,
                            ),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                height: 23,
                                width: 23,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: widget.favourite
                                      ? FoodlieColors.foodliePink
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: widget.favourite
                                        ? Colors.transparent
                                        : FoodlieColors.foodliePink,
                                  ),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    AppAssets.loveIcon,
                                    color: widget.favourite
                                        ? FoodlieColors.foodlieWhite
                                        : FoodlieColors.foodliePink,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(20),
                      TextSemiBold(
                        widget.foodName,
                        fontSize: 13,
                        color: FoodlieColors.foodlieBlack,
                      ),
                      const Gap(4),
                      TextBold(
                        widget.restaurantName,
                        fontSize: 13,
                        color: FoodlieColors.primaryColor,
                      ),
                      const Gap(4),
                      TextBody(
                        widget.description,
                        fontSize: 13,
                        color: FoodlieColors.grey,
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          TextBody(
                            widget.foodPrice,
                            fontSize: 15,
                            color: const Color(0xff363C4F),
                          ),
                          const Gap(29),
                          /* Container(
                            height: 25,
                            width: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: FoodlieColors.primaryColor,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: widget.onTapRemove,
                                    child: const Icon(
                                      Icons.remove,
                                      color: FoodlieColors.primaryColor,
                                      size: 15,
                                    ),
                                  ),
                                  TextSemiBold(
                                    '${widget.qty}',
                                    fontSize: 16,
                                    color: FoodlieColors.primaryColor,
                                  ),
                                  GestureDetector(
                                    onTap: widget.onTapAdd,
                                    child: const Icon(
                                      Icons.add,
                                      color: FoodlieColors.primaryColor,
                                      size: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )*/
                        ],
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: widget.onTapAddtoCart,
                            child: Container(
                              height: 28,
                              width: 94,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xffDCDFE5).withOpacity(0.5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.cartIcon,
                                    height: 15,
                                    width: 15,
                                    color: const Color(0xff757575),
                                  ),
                                  const Gap(4),
                                  TextBody(
                                    'Add to Cart',
                                    fontSize: 10,
                                    color: const Color(0xff363C4F),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Gap(9),
                          /*  GestureDetector(
                            onTap: widget.onTapOrder,
                            child: Container(
                              height: 28,
                              width: 62,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xffDCDFE5).withOpacity(0.5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.ordersIcon,
                                    height: 15,
                                    width: 12,
                                  ),
                                  const Gap(9),
                                  TextBody(
                                    'Order',
                                    fontSize: 10,
                                    color: FoodlieColors.textColor,
                                  )
                                ],
                              ),
                            ),
                          )*/
                        ],
                      ),
                      const Gap(20)
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

class FavRestaurantContainer extends StatelessWidget {
  const FavRestaurantContainer({
    super.key,
    required this.img,
    required this.active,
    required this.name,
    required this.onTap,
  });

  final String img;
  final bool active;
  final String name;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 60,
          width: 144,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                ),
                child: Container(
                  height: 54,
                  width: 144,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(77),
                    color: active
                        ? FoodlieColors.primaryColor
                        : const Color(0xffE1E5E7),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Row(
                      children: [
                        Image.network(
                          img,
                          height: 32,
                          width: 47,
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox();
                          },
                        ),
                        const Gap(2),
                        Expanded(
                          child: TextBold(
                            name,
                            fontSize: 9,
                            color: active
                                ? FoodlieColors.foodlieWhite
                                : FoodlieColors.foodlieBlack,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    height: 23,
                    width: 23,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: FoodlieColors.grey,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AppAssets.loveIcon,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FoodTypeWidget extends StatelessWidget {
  const FoodTypeWidget({
    super.key,
    required this.img,
    required this.title,
    required this.active,
    required this.onTap,
  });
  final String img;
  final String title;
  final bool active;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            color:
                active ? const Color(0xffFF6B01) : FoodlieColors.foodlieWhite,
            boxShadow: [
              if (active)
                const BoxShadow()
              else
                BoxShadow(
                  color: const Color(0xffDCDFE5).withOpacity(0.8),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Center(
              child: TextSemiBold(
                title,
                fontSize: 13.24,
                color: active ? FoodlieColors.foodlieWhite : FoodlieColors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RestaurantStories extends StatelessWidget {
  const RestaurantStories({
    super.key,
    required this.title,
    required this.restaurant,
    required this.color,
    required this.onTap,
    required this.active,
  });
  final String title;
  final String restaurant;
  final Color color;
  final bool active;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 22,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 65,
          child: Column(
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2.5,
                    color: active
                        ? FoodlieColors.foodliePink
                        : FoodlieColors.grey1,
                  ),
                ),
                child: Center(
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color,
                    ),
                    child: Center(
                      child: TextBold(
                        restaurant,
                        fontSize: 10,
                        color: FoodlieColors.foodlieWhite,
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(5),
              TextBold(
                title,
                fontSize: 10,
                color: FoodlieColors.foodlieBlack,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopBarOOptions extends StatelessWidget {
  const TopBarOOptions({
    super.key,
    required this.icon,
    required this.onTap,
  });
  final String icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: FoodlieColors.primaryColor,
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            width: 20,
            height: 20,
            color: FoodlieColors.foodlieWhite,
          ),
        ),
      ),
    );
  }
}
