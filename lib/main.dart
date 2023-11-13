// ignore_for_file: await_only_futures

import 'package:Foodlify/core/sl/sl_container.dart';
import 'package:Foodlify/features/account/presentation/cubit/get_address_cubit.dart';
import 'package:Foodlify/features/auth/presentation/notifier/auth_notifier.dart';
import 'package:Foodlify/features/home/domain/usecases/get_tickets_usecase.dart';
import 'package:Foodlify/features/home/domain/usecases/post_ticket_usecase.dart';
import 'package:Foodlify/features/home/domain/usecases/put_ticket_field_usecase.dart';
import 'package:Foodlify/features/home/domain/usecases/view_notification_usecase.dart';
import 'package:Foodlify/features/home/presentation/cubit/add_to_cart_cubit.dart';
import 'package:Foodlify/features/home/presentation/cubit/post_ticket_cubit.dart';
import 'package:Foodlify/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upgrader/upgrader.dart';

import 'core/constant/constant.dart';
import 'core/navigators/navigator.dart';
import 'features/account/domain/usecases/edit_name_usecase.dart';
import 'features/account/domain/usecases/get_address_usecase.dart';
import 'features/account/domain/usecases/get_default_address_usecase.dart';
import 'features/account/domain/usecases/set_default_address_usecase.dart';
import 'features/account/domain/usecases/update_address_usecase.dart';
import 'features/account/presentation/cubit/favourite_cubit.dart';
import 'features/account/presentation/cubit/set_default_address_cubit.dart';
import 'features/account/presentation/cubit/update_adress_cubit.dart';
import 'features/auth/domain/usecases/login_with_email_usecase.dart';
import 'features/auth/domain/usecases/logout_usecase.dart';
import 'features/auth/presentation/cubit/login_cubit.dart';
import 'features/home/domain/repositories/home_repository.dart';
import 'features/home/domain/usecases/add_cart_food_count.dart';
import 'features/home/domain/usecases/add_to_cart_usecase.dart';
import 'features/home/domain/usecases/get_all_food_usecase.dart';
import 'features/home/domain/usecases/get_all_restaurant_usecase.dart';
import 'features/home/domain/usecases/get_banner_usecase.dart';
import 'features/home/domain/usecases/get_cart_usecase.dart';
import 'features/home/domain/usecases/get_food_by_categories.dart';
import 'features/home/domain/usecases/get_food_categories_usecase.dart';
import 'features/home/domain/usecases/get_notification_usecase.dart';
import 'features/home/domain/usecases/get_order_usecase.dart';
import 'features/home/domain/usecases/get_restaurant_food_usecase.dart';
import 'features/home/domain/usecases/get_restaurant_usecase.dart';
import 'features/home/domain/usecases/get_user_usecase.dart';
import 'features/home/domain/usecases/get_wallet_usecase.dart';
import 'features/home/domain/usecases/order_cart_usecase.dart';
import 'features/home/domain/usecases/order_food_usecase.dart';
import 'features/home/domain/usecases/reduce_cart_food_count_model.dart';
import 'features/home/domain/usecases/remove_food_from_cart_usecase.dart';
import 'features/home/presentation/cubit/add_cart_food_count_cubit.dart';
import 'features/home/presentation/cubit/get_all_restaurant_cubit.dart';
import 'features/home/presentation/cubit/get_cart_cubit.dart';
import 'features/home/presentation/cubit/get_food_by_category_cubit.dart';
import 'features/home/presentation/cubit/get_food_categories_cubit.dart';
import 'features/home/presentation/cubit/get_orders_cubit.dart';
import 'features/home/presentation/cubit/get_restaurant_cubit.dart';
import 'features/home/presentation/cubit/get_restaurant_food_cubit.dart';
import 'features/home/presentation/cubit/get_user_cubit.dart';
import 'features/home/presentation/cubit/order_cart_cubit.dart';
import 'features/home/presentation/cubit/order_food_cubit.dart';
import 'features/home/presentation/cubit/reduce_cart_food_count_cubit.dart';
import 'features/home/presentation/cubit/remove_food_from_cart_cubit.dart';
import 'features/home/presentation/cubit/wallet_cubit.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Upgrader.clearSavedSettings;
  configureDependencies();
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  OneSignal.initialize("71d5223d-6150-41c0-ba0c-3252b5e15089");

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.Notifications.requestPermission(true);

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitUp,
    ],
  ).then(
    (value) {
      runApp(const App());
    },
  );
}

class App extends StatefulWidget {
  const App({super.key});
  static void setLocale(BuildContext context, Locale newLocale) async {
    _AppState? state = context.findAncestorStateOfType<_AppState>();

    var prefs = await SharedPreferences.getInstance();
    prefs.setString('languageCode', newLocale.languageCode);
    prefs.setString('countryCode', "");

    state?.setState(() {
      state._locale = newLocale;
    });
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Locale _locale = const Locale('en', 'en');
  @override
  void initState() {
    super.initState();
    _fetchLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
  }

  Future<Locale> _fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();

    String languageCode = prefs.getString('languageCode') ?? 'en';
    String countryCode = prefs.getString('countryCode') ?? 'en';

    return Locale(languageCode, countryCode);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => sl<AuthNotifier>(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AddToCartCubit(
              addToCartUsecase: sl<AddToCartUsecase>(),
            ),
          ),
          BlocProvider(
            create: (context) => LoginCubit(
              loginWithEmailUsecase: sl<LoginWithEmailUsecase>(),
              logoutUsecase: sl<LogoutUsecase>(),
            ),
          ),
          BlocProvider(
            create: (context) => GetRestaurantCubit(
              getRestaurantUsecase: sl<GetRestaurantUsecase>(),
            ),
          ),
          BlocProvider(
            create: (context) => GetCartCubit(
              getCartUsecase: sl<GetCartUsecase>(),
            ),
          ),
          BlocProvider(
            create: (context) => GetRestaurantFoodCubit(
              getFoodByRestauranntUsecase: sl<GetFoodByRestaurantUsecase>(),
            ),
          ),
          BlocProvider(
            create: (context) => GetUserCubit(
              getUserUsecase: sl<GetUserUsecase>(),
              viewNotificationUsecase: sl<ViewNotificationUsecase>(),
              getNotificationUsecase: sl<GetNotificationUsecase>(),
            ),
          ),
          BlocProvider(
            create: (context) => GetAllRestaurantCubit(
              getAllRestaurantUsecase: sl<GetAllRestaurantUsecase>(),
              getBannersUsecase: sl<GetBannersUsecase>(),
            ),
          ),
          BlocProvider(
            create: (context) => GetFoodCategoriesCubit(
              getFoodCategoriesUsecase: sl<GetFoodCategoriesUsecase>(),
            ),
          ),
          BlocProvider(
            create: (context) => GetFoodByCategoryCubit(
              getFoodByCategoriesUsecase: sl<GetFoodByCategoriesUsecase>(),
              getAllFoodUsecase: sl<GetAllFoodUsecase>(),
            ),
          ),
          BlocProvider(
            create: (context) => OrderFoodCubit(
              orderFoodUsecase: sl<OrderFoodUsercase>(),
            ),
          ),
          BlocProvider(
            create: (context) => RemoveFoodFromCartCubit(
              removeFoodFromCartUsecase: sl<RemoveFoodFromCartUsecase>(),
            ),
          ),
          BlocProvider(
            create: (context) => OrderCartCubit(
              orderCartUsecase: sl<OrderCartUsecase>(),
            ),
          ),
          BlocProvider(
            create: (context) => UpdateAdressCubit(
              updateAddressUsecase: sl<UpdateAddressUsecase>(),
              editNameUsecase: sl<EditNameUsecase>(),
            ),
          ),
          BlocProvider(
            create: (context) => GetAddressCubit(
              getDeliveryAddressUsecase: sl<GetDefaultAdressUsecase>(),
              getAddressUsecase: sl<GetAddressUsecase>(),
            ),
          ),
          BlocProvider(
            create: (context) => WalletCubit(
              getWalletUsecase: sl<GetWalletUsecase>(),
            ),
          ),
          BlocProvider(
            create: (context) => ReduceCartFoodCountCubit(
              reduceCartFoodUsecase: sl<ReduceCartFoodCountUsecase>(),
            ),
          ),
          BlocProvider(
            create: (context) => AddCartFoodCountCubit(
              addCartFoodCountUsecase: sl<AddCartFoodCountUsecase>(),
            ),
          ),
          BlocProvider(
            create: (context) => FavouriteCubit(
              homeRepository: sl<HomeRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => GetOrdersCubit(
              getOrdersUsecase: sl<GetOrderstUsecase>(),
            ),
          ),
          BlocProvider(
            create: (context) => SetDefaultAddressCubit(
              setDefaultAddressUsecase: sl<SetDefaultAddressUsecase>(),
            ),
          ),
          BlocProvider(
            create: (context) => PostTicketCubit(
              postTicketUsecase: sl<PostTicketUsecase>(),
              putTicketFieldUsecase: sl<PutTicketFieldUsecase>(),
              getTicketUsecase: sl<GetTicketUsecase>(),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          supportedLocales: L10n.all,
          locale: _locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              color: FoodlieColors.primaryColor,
            ),
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: Colors.transparent,
            ),
            primaryColorLight: FoodlieColors.primaryColor,
            primaryColor: FoodlieColors.primaryColor,
            colorScheme: ColorScheme.fromSwatch(
              accentColor: FoodlieColors.primaryColor,
            ),
          ),
          onGenerateRoute: gennerateRoute,
          initialRoute: RouteName.splashScreen,
        ),
      ),
    );
  }
}
