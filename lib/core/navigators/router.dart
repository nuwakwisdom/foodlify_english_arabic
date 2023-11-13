// ignore_for_file: cast_nullable_to_non_nullable, strict_raw_type

import 'package:Foodlify/core/navigators/navigator.dart';
import 'package:Foodlify/features/account/presentation/pages/account_page.dart';
import 'package:Foodlify/features/account/presentation/pages/add_address.dart';
import 'package:Foodlify/features/account/presentation/pages/address.dart';
import 'package:Foodlify/features/account/presentation/pages/advance_setting.dart';
import 'package:Foodlify/features/account/presentation/pages/delete_account.dart';
import 'package:Foodlify/features/account/presentation/pages/favourite_page.dart';
import 'package:Foodlify/features/account/presentation/pages/profile_setting.dart';
import 'package:Foodlify/features/account/presentation/pages/reset_password.dart';
import 'package:Foodlify/features/account/presentation/pages/support.dart';
import 'package:Foodlify/features/account/presentation/pages/terms_condition.dart';
import 'package:Foodlify/features/account/presentation/pages/ticket_details.dart';
import 'package:Foodlify/features/account/presentation/pages/ticket_history.dart';
import 'package:Foodlify/features/account/presentation/pages/ticketing.dart';
import 'package:Foodlify/features/account/presentation/pages/view_addresses.dart';
import 'package:Foodlify/features/auth/presentation/pages/discover_now_page.dart';
import 'package:Foodlify/features/auth/presentation/pages/get_started.dart';
import 'package:Foodlify/features/auth/presentation/pages/let_you_in.dart';
import 'package:Foodlify/features/auth/presentation/pages/login_screenn.dart';
import 'package:Foodlify/features/auth/presentation/pages/new_login_email.dart';
import 'package:Foodlify/features/auth/presentation/pages/referral_code_page.dart';
import 'package:Foodlify/features/auth/presentation/pages/registration_complete.dart';
import 'package:Foodlify/features/auth/presentation/pages/reset_password_screen.dart';
import 'package:Foodlify/features/auth/presentation/pages/search_location.dart';
import 'package:Foodlify/features/auth/presentation/pages/set_password.dart';
import 'package:Foodlify/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:Foodlify/features/auth/presentation/pages/sign_up_with_number.dart';
import 'package:Foodlify/features/auth/presentation/pages/verify_email.dart';
import 'package:Foodlify/features/check_out_cart/presentation/pages/order_picked_by_rider_page.dart';
import 'package:Foodlify/features/home/presentation/pages/add_to_cart.dart';
import 'package:Foodlify/features/home/presentation/pages/cart_proceed.dart';
import 'package:Foodlify/features/home/presentation/pages/choose_location_page.dart';
import 'package:Foodlify/features/home/presentation/pages/food_story.dart';
import 'package:Foodlify/features/home/presentation/pages/home_nav.dart';
import 'package:Foodlify/features/home/presentation/pages/new_delivery_screen.dart';
import 'package:Foodlify/features/home/presentation/pages/noInter_page.dart';
import 'package:Foodlify/features/home/presentation/pages/pick_up_track_order.dart';
import 'package:Foodlify/features/home/presentation/pages/search_food_page.dart';
import 'package:Foodlify/features/home/presentation/pages/view_restaurants_page.dart';
import 'package:Foodlify/features/live_tracking/presentation/pages/live_tracking.dart';
import 'package:Foodlify/features/notification/presentation/pages/notification_screen.dart';
import 'package:Foodlify/features/notification/presentation/pages/transaction_details.dart';
import 'package:Foodlify/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:Foodlify/features/onboarding/presentation/pages/pages.dart';
import 'package:Foodlify/features/orders/presentation/pages/order_details.dart';
import 'package:Foodlify/features/orders/presentation/pages/track_order_page.dart';
import 'package:Foodlify/features/refer/presentation/pages/refer_onboarding_page.dart';
import 'package:Foodlify/features/refer/presentation/pages/referral_page.dart';
import 'package:Foodlify/features/restaurant/presentation/pages/restaurant_page.dart';
import 'package:Foodlify/features/track_orders/presentation/pages/order_receipt.dart';
import 'package:Foodlify/features/track_orders/presentation/pages/order_tracking.dart';
import 'package:Foodlify/features/track_orders/presentation/pages/rate_order_screen.dart';
import 'package:Foodlify/features/wallet/presentation/pages/wallet_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> gennerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteName.splashScreen:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const SplashScreen(),
      );
    case RouteName.onBoardingScreen:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const OnBoardingScreen(),
      );
    case RouteName.loginScreen:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const LoginScreen(),
      );
    case RouteName.letYouInScreen:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const LetYouInScreen(),
      );
    case RouteName.signUpScreen:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUpScreen(
          params: settings.arguments as SignUpArguement,
        ),
      );
    case RouteName.verifyEmailPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: VerifyEmailPage(
          params: settings.arguments as VerifyOtpArgment,
        ),
      );
    case RouteName.signUpWithNumber:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const SignUpWithNumber(),
      );
    case RouteName.searchLocation:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const SearchLocation(),
      );
    case RouteName.setPassword:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SetPassword(
          params: settings.arguments as SetPasswordArguement,
        ),
      );
    case RouteName.getStarted:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const GetStarted(),
      );
    case RouteName.orderTracking:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const OrderTracking(),
      );
    case RouteName.rateOrder:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const RateOrders(),
      );
    case RouteName.orderDetails:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: NewOrdersDetails(
          params: settings.arguments as OrderDetailsArguement,
        ),
      );
    case RouteName.homeNav:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const HomeNav(
            //  params: settings.arguments as HomeArguement,
            ),
      );
    case RouteName.addToCart:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: AddToCart(
          params: settings.arguments as FoodArgument,
        ),
      );
    case RouteName.cartProceed:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const CartProceed(),
      );
    case RouteName.foodStory:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const FoodStory(),
      );
    case RouteName.pickUpTrackCart:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const PickUpTrackOrder(),
      );
    case RouteName.receiptPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const OrderReceipt(),
      );
    case RouteName.notificationScreen:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const NotificationScreen(),
      );
    case RouteName.accountPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const AccountPage(),
      );
    case RouteName.profileSetting:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const ProfileSetting(),
      );
    case RouteName.addressSetting:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const AddressSetting(),
      );
    case RouteName.advanceSetting:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const AdvanceSetting(),
      );
    case RouteName.resetPasswordPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ResetPassword(
          params: settings.arguments as ResetPasswordArguement,
        ),
      );
    case RouteName.discoverNowPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const DiscoverNowPage(),
      );
    case RouteName.newDeliveryScreen:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: NewDeliveryScreen(
          params: settings.arguments as DeliveryArguement,
        ),
      );
    case RouteName.orderPickedPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const OrderPicked(),
      );
    case RouteName.trackOrders:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const TrackOrders(),
      );
    case RouteName.restaurantPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: RestaurantPage(
          params: settings.arguments as RestaurantArguement,
        ),
      );
    case RouteName.loginWithEmail:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginWithEmail(
          params: settings.arguments as LoginArgument,
        ),
      );
    case RouteName.liveTracking:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const LiveTrackingPage(),
      );
    case RouteName.referOnBoarding:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const ReferOnBoarding(),
      );
    case RouteName.referralPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const ReferralPage(),
      );
    case RouteName.walletPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const WalletPage(),
      );
    case RouteName.supportPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const SupportPage(),
      );
    case RouteName.termsAndCondtion:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const TermsAndCondition(),
      );
    case RouteName.transactionDetails:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const TransactionDetails(),
      );
    case RouteName.newResetPassword:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const NewResetPasswoord(),
      );
    case RouteName.deletAccount:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const DeleteAccount(),
      );
    case RouteName.addAddress:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const AddAdress(),
      );
    case RouteName.viewAddress:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const ShowAddresses(),
      );
    case RouteName.favouritePage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const FavouritePage(),
      );
    case RouteName.searchFood:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const SearchFoodPage(),
      );
    case RouteName.noInternetPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const NoInternetPage(),
      );
    case RouteName.referralRegistrationPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ReferralRegistrationPage(
          params: settings.arguments! as ReferralCodeParams,
        ),
      );
    case RouteName.viewAllRestaurant:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const ViewAllRestaurant(),
      );
    case RouteName.registrationCompletePage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const RegistrationComplete(),
      );
    case RouteName.selectLocationPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const SelectLocationPage(),
      );
    case RouteName.ticketingPage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const TicketingPage(),
      );
    case RouteName.ticketHistory:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const TicketHistory(),
      );
    case RouteName.ticketDetails:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: TicketDetails(
          params: settings.arguments as TicketsArguement,
        ),
      );

    case RouteName.passwordResetOptions:
    default:
      return MaterialPageRoute<void>(
        builder: (_) => Scaffold(
          body: Center(
            child: Text(
              'No route defined for ${settings.name}',
            ),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute({String? routeName, Widget? viewToShow}) {
  return MaterialPageRoute<void>(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow!,
  );
}
