// ignore_for_file: deprecated_member_use, strict_raw_type, lines_longer_than_80_chars, use_build_context_synchronously, use_late_for_private_fields_and_variables, use_if_null_to_convert_nulls_to_bools, unnecessary_statements, inference_failure_on_function_invocation

import 'dart:async';

import 'package:Foodlify/core/constant/constant.dart';
import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:Foodlify/features/account/presentation/cubit/favourite_cubit.dart';
import 'package:Foodlify/features/account/presentation/cubit/get_address_cubit.dart';
import 'package:Foodlify/features/account/presentation/pages/account_page.dart';
import 'package:Foodlify/features/auth/presentation/pages/login_screenn.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_all_restaurant_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_cart_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_food_by_category_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_food_categories_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_orders_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/get_user_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/post_ticket_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/wallet_cubit.dart';
import 'package:Foodlify/features/home/presentation/pages/timelin_screen.dart';
import 'package:Foodlify/features/home/presentation/widgets/not_available_modal.dart';
import 'package:Foodlify/features/orders/presentation/pages/order_page.dart';
import 'package:Foodlify/features/wallet/presentation/pages/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({
    super.key,
    // required this.params,
  });
  //final HomeArguement params;
  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  Position? _currentPosition;
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Location services are disabled. Please enable the services',
          ),
        ),
      );
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied')),
        );
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Location permissions are permanently denied, we cannot request permissions.',
          ),
        ),
      );
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {});
  }

  String _currentAddress = '';
  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
      _currentPosition!.latitude,
      _currentPosition!.longitude,
    ).then((List<Placemark> placemarks) {
      final place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}';
        place.locality != ''
            ? showModalBottomSheet(
                isDismissible: false,
                context: context,
                builder: (context) {
                  return const NotAvailableModel();
                },
              )
            : const SizedBox();
      });
      print(_currentAddress);
    }).catchError((e) {});
  }

  int _currentIndex = 0;

  late final String city = '';

  Future<void> getHomeDetails() async {
    await context
        .read<GetUserCubit>()
        .getUser(context)
        .then((value) => context.read<GetAllRestaurantCubit>().getBanners())
        .then((value) {
          context.read<GetAllRestaurantCubit>().getAllRestaurant(
                context,
                location: finalLocation ?? '',
              );
        })
        .then((value) {
          context.read<GetFoodByCategoryCubit>().getAllFood(
                context,
                location: finalLocation ?? '',
                page: 0,
              );
        })
        .then((_) {
          context
              .read<GetFoodCategoriesCubit>()
              .getFoodCategories(context, location: finalLocation ?? '');
        })
        .then(
          (value) => context.read<GetCartCubit>().getCarts(context),
        )
        .then(
          (value) => context.read<GetAddressCubit>().getDeliveryAddress(
                context,
              ),
        )
        .then(
          (value) => context.read<WalletCubit>().getWallet(context),
        )
        .then(
          (value) => context.read<GetOrdersCubit>().getOrders(context),
        )
        .then(
          (value) => context.read<FavouriteCubit>().getFavourites(context),
        )
        .then(
          (value) => context.read<GetUserCubit>().getNotification(context),
        )
        .then(
          (value) => context.read<GetAddressCubit>().getDefaultAdreess(context),
        )
        .then(
          (value) =>
              context.read<PostTicketCubit>().getTicket(context, page: 0),
        )
        .then((value) => context.read<PostTicketCubit>().checkForUpdate(
              context,
            ));
  }

  bool connected = true;
  Future<void> getConnectionState() async {
    if (await InternetConnectionChecker().hasConnection) {
      await checkLocation();
      Future.delayed(Duration.zero, getHomeDetails);
      //  await _getCurrentPosition();
      setState(() {
        connected = true;
        print(true);
      });
    } else {
      await Navigator.pushNamed(context, RouteName.noInternetPage);
    }
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
    getConnectionState();
    super.initState();
  }

  void dispoose() {
    _getCurrentPosition();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      TimelinScreen(
        cityName: finalLocation ?? '',
      ),
      const OrderPage(),
      const WalletPage(),
      const AccountPage(),
    ];
    final user = context.read<GetUserCubit>().users;
    return Scaffold(
      backgroundColor: FoodlieColors.foodlieWhite,
      body: user == null && _currentIndex == 3
          ? const LoginScreen()
          : screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: FoodlieColors.foodliePink,
        unselectedItemColor: FoodlieColors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedFontSize: 12,
        selectedLabelStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: FoodlieColors.foodliePink,
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: FoodlieColors.grey,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 5,
              ),
              child: SvgPicture.asset(
                AppAssets.homeIcon,
                color: FoodlieColors.grey,
              ),
            ),
            label: 'Home',
            activeIcon: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 5,
              ),
              child: SvgPicture.asset(
                AppAssets.homeIcon,
                color: FoodlieColors.foodliePink,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: SvgPicture.asset(
                AppAssets.ordersIcon,
              ),
            ),
            label: 'Orders',
            activeIcon: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 5,
              ),
              child: SvgPicture.asset(
                AppAssets.ordersIcon,
                color: FoodlieColors.foodliePink,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: SvgPicture.asset(
                AppAssets.wallet,
                color: FoodlieColors.grey,
                height: 30,
                width: 30,
              ),
            ),
            label: 'Wallet',
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: SvgPicture.asset(
                AppAssets.wallet,
                height: 30,
                width: 30,
                color: FoodlieColors.foodliePink,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: SvgPicture.asset(
                AppAssets.profileIcon,
              ),
            ),
            label: 'Account',
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: SvgPicture.asset(
                AppAssets.profileIcon,
                color: FoodlieColors.foodliePink,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeArguement {
  HomeArguement({
    required this.location,
  });
  final String location;
}
