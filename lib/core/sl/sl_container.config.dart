// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:device_info_plus/device_info_plus.dart' as _i6;
import 'package:dio/dio.dart' as _i8;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i10;
import 'package:package_info_plus/package_info_plus.dart' as _i5;

import '../../app/widgets/app_loader.dart' as _i3;
import '../../features/account/data/datasources/account_remote_datasauce.dart'
    as _i42;
import '../../features/account/data/repositories/accounnt_reposutory_imple.dart'
    as _i44;
import '../../features/account/domain/repositories/account_repository.dart'
    as _i43;
import '../../features/account/domain/usecases/edit_name_usecase.dart' as _i48;
import '../../features/account/domain/usecases/get_address_usecase.dart'
    as _i49;
import '../../features/account/domain/usecases/get_default_address_usecase.dart'
    as _i54;
import '../../features/account/domain/usecases/set_default_address_usecase.dart'
    as _i64;
import '../../features/account/domain/usecases/update_address_usecase.dart'
    as _i65;
import '../../features/auth/data/datasources/auth_remote_data_sorce.dart'
    as _i14;
import '../../features/auth/data/repositories/auth_repositories_impl.dart'
    as _i18;
import '../../features/auth/domain/repositories/repositories.dart' as _i17;
import '../../features/auth/domain/usecases/change_password_usecase.dart'
    as _i19;
import '../../features/auth/domain/usecases/login_with_email_usecase.dart'
    as _i23;
import '../../features/auth/domain/usecases/logout_usecase.dart' as _i24;
import '../../features/auth/domain/usecases/register_with_email.dart' as _i30;
import '../../features/auth/domain/usecases/register_with_phone_usecase.dart'
    as _i31;
import '../../features/auth/domain/usecases/resend_otp_sms_usecase.dart'
    as _i33;
import '../../features/auth/domain/usecases/reset_password_email_usecase.dart'
    as _i34;
import '../../features/auth/domain/usecases/reset_password_phone.dart' as _i35;
import '../../features/auth/domain/usecases/send_otp_usecase.dart' as _i36;
import '../../features/auth/domain/usecases/set_password_usecase.dart' as _i37;
import '../../features/auth/domain/usecases/update_profile_number_usecase.dart'
    as _i39;
import '../../features/auth/domain/usecases/update_profile_with_email_usecase.dart'
    as _i38;
import '../../features/auth/domain/usecases/verify_otp_usecase.dart' as _i40;
import '../../features/auth/presentation/notifier/auth_notifier.dart' as _i47;
import '../../features/home/data/datasources/home_remote_datasource.dart'
    as _i20;
import '../../features/home/data/repositories/home_repository_impl.dart'
    as _i22;
import '../../features/home/domain/repositories/home_repository.dart' as _i21;
import '../../features/home/domain/usecases/add_cart_food_count.dart' as _i45;
import '../../features/home/domain/usecases/add_to_cart_usecase.dart' as _i46;
import '../../features/home/domain/usecases/get_all_food_usecase.dart' as _i50;
import '../../features/home/domain/usecases/get_all_restaurant_usecase.dart'
    as _i51;
import '../../features/home/domain/usecases/get_banner_usecase.dart' as _i52;
import '../../features/home/domain/usecases/get_cart_usecase.dart' as _i53;
import '../../features/home/domain/usecases/get_food_by_categories.dart'
    as _i55;
import '../../features/home/domain/usecases/get_food_categories_usecase.dart'
    as _i57;
import '../../features/home/domain/usecases/get_notification_usecase.dart'
    as _i58;
import '../../features/home/domain/usecases/get_order_usecase.dart' as _i59;
import '../../features/home/domain/usecases/get_restaurant_food_usecase.dart'
    as _i56;
import '../../features/home/domain/usecases/get_restaurant_usecase.dart'
    as _i60;
import '../../features/home/domain/usecases/get_tickets_usecase.dart' as _i61;
import '../../features/home/domain/usecases/get_user_usecase.dart' as _i62;
import '../../features/home/domain/usecases/get_wallet_usecase.dart' as _i63;
import '../../features/home/domain/usecases/order_cart_usecase.dart' as _i25;
import '../../features/home/domain/usecases/order_food_usecase.dart' as _i26;
import '../../features/home/domain/usecases/post_ticket_usecase.dart' as _i27;
import '../../features/home/domain/usecases/put_ticket_field_usecase.dart'
    as _i28;
import '../../features/home/domain/usecases/reduce_cart_food_count_model.dart'
    as _i29;
import '../../features/home/domain/usecases/remove_food_from_cart_usecase.dart'
    as _i32;
import '../../features/home/domain/usecases/view_notification_usecase.dart'
    as _i41;
import '../device_infos/app_version.dart' as _i4;
import '../device_infos/device_information.dart' as _i7;
import '../local_data/local_data.dart' as _i16;
import '../local_data/local_data_storage.dart' as _i11;
import '../network/api_requester.dart' as _i13;
import '../network/network.dart' as _i15;
import '../network/network_info.dart' as _i12;
import 'register_module.dart' as _i66;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AppLoadingPopup>(() => _i3.AppLoadingPopup());
  gh.lazySingleton<_i4.AppVersion>(
      () => _i4.AppVersion(packageInfo: gh<_i5.PackageInfo>()));
  gh.factory<_i6.DeviceInfoPlugin>(() => registerModule.deviceInfoPlugin);
  gh.lazySingleton<_i7.DeviceInformation>(() =>
      _i7.DeviceInformation(deviceInfoPlugin: gh<_i6.DeviceInfoPlugin>()));
  gh.factory<_i8.Dio>(() => registerModule.dio);
  gh.factory<_i9.FlutterSecureStorage>(
      () => registerModule.flutterSecureStorage);
  gh.factory<_i10.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i11.LocalDataStorage>(
      () => _i11.LocalDataStorageImpl(gh<_i9.FlutterSecureStorage>()));
  gh.lazySingleton<_i12.NetworkInfo>(
      () => _i12.NetworkInfoImpl(gh<_i10.InternetConnectionChecker>()));
  gh.lazySingleton<_i13.ApiRequester>(
      () => _i13.ApiRequester(dio: gh<_i8.Dio>()));
  gh.lazySingleton<_i14.AuthRemoteDatasource>(
      () => _i14.AuthhRemoteDatasourceImpl(
            networkInfo: gh<_i15.NetworkInfo>(),
            apiRequester: gh<_i15.ApiRequester>(),
            localDataStorage: gh<_i16.LocalDataStorage>(),
          ));
  gh.lazySingleton<_i17.AuthRepository>(() => _i18.AuthRepositoryImpl(
      remoteDatasource: gh<_i14.AuthRemoteDatasource>()));
  gh.lazySingleton<_i19.ChangePasswordEmailUsecase>(() =>
      _i19.ChangePasswordEmailUsecase(
          authRepository: gh<_i17.AuthRepository>()));
  gh.lazySingleton<_i20.HomeRemoteDatasource>(
      () => _i20.HomeRemoteDatasourceImpl(
            localDataStorage: gh<_i11.LocalDataStorage>(),
            apiRequester: gh<_i15.ApiRequester>(),
            networkInfo: gh<_i15.NetworkInfo>(),
          ));
  gh.lazySingleton<_i21.HomeRepository>(() => _i22.HomeRespositoryImpl(
      homeRemoteDatasource: gh<_i20.HomeRemoteDatasource>()));
  gh.lazySingleton<_i23.LoginWithEmailUsecase>(() =>
      _i23.LoginWithEmailUsecase(authRepository: gh<_i17.AuthRepository>()));
  gh.lazySingleton<_i24.LogoutUsecase>(
      () => _i24.LogoutUsecase(authRepository: gh<_i17.AuthRepository>()));
  gh.lazySingleton<_i25.OrderCartUsecase>(
      () => _i25.OrderCartUsecase(homeRepository: gh<_i21.HomeRepository>()));
  gh.lazySingleton<_i26.OrderFoodUsercase>(
      () => _i26.OrderFoodUsercase(homeRepository: gh<_i21.HomeRepository>()));
  gh.lazySingleton<_i27.PostTicketUsecase>(
      () => _i27.PostTicketUsecase(homeRepository: gh<_i21.HomeRepository>()));
  gh.lazySingleton<_i28.PutTicketFieldUsecase>(() =>
      _i28.PutTicketFieldUsecase(homeRepository: gh<_i21.HomeRepository>()));
  gh.lazySingleton<_i29.ReduceCartFoodCountUsecase>(() =>
      _i29.ReduceCartFoodCountUsecase(
          homeRepository: gh<_i21.HomeRepository>()));
  gh.lazySingleton<_i30.RegisterWithEmailUsecase>(() =>
      _i30.RegisterWithEmailUsecase(authRepository: gh<_i17.AuthRepository>()));
  gh.lazySingleton<_i31.RegisterWithPhoneUsecase>(() =>
      _i31.RegisterWithPhoneUsecase(authRepository: gh<_i17.AuthRepository>()));
  gh.lazySingleton<_i32.RemoveFoodFromCartUsecase>(() =>
      _i32.RemoveFoodFromCartUsecase(
          homeRepository: gh<_i21.HomeRepository>()));
  gh.lazySingleton<_i33.ResendOtpSmsUsecase>(() =>
      _i33.ResendOtpSmsUsecase(authRepository: gh<_i17.AuthRepository>()));
  gh.lazySingleton<_i34.ResetPasswordEmailUsecase>(() =>
      _i34.ResetPasswordEmailUsecase(
          authRepository: gh<_i17.AuthRepository>()));
  gh.lazySingleton<_i35.ResetPasswordPhoneUsecase>(() =>
      _i35.ResetPasswordPhoneUsecase(
          authRepository: gh<_i17.AuthRepository>()));
  gh.lazySingleton<_i36.SendOtpUsecase>(
      () => _i36.SendOtpUsecase(authRepository: gh<_i17.AuthRepository>()));
  gh.lazySingleton<_i37.SetPasswordUsecase>(
      () => _i37.SetPasswordUsecase(authRepository: gh<_i17.AuthRepository>()));
  gh.lazySingleton<_i38.UpdateProfileWithEmailUsecase>(() =>
      _i38.UpdateProfileWithEmailUsecase(
          authRepository: gh<_i17.AuthRepository>()));
  gh.lazySingleton<_i39.UpdateProfileWithPhoneNumberUsecase>(() =>
      _i39.UpdateProfileWithPhoneNumberUsecase(
          authRepository: gh<_i17.AuthRepository>()));
  gh.lazySingleton<_i40.VerifyOtpUsecase>(
      () => _i40.VerifyOtpUsecase(authRepository: gh<_i17.AuthRepository>()));
  gh.lazySingleton<_i41.ViewNotificationUsecase>(() =>
      _i41.ViewNotificationUsecase(homeRepository: gh<_i21.HomeRepository>()));
  gh.lazySingleton<_i42.AccountRemoteDatasource>(
      () => _i42.AccountRemoteDataSourceImpl(
            localDataStorage: gh<_i16.LocalDataStorage>(),
            apiRequester: gh<_i15.ApiRequester>(),
            networkInfo: gh<_i15.NetworkInfo>(),
          ));
  gh.lazySingleton<_i43.AccountRepository>(() => _i44.AccountRepositoryImpl(
      accountDataSource: gh<_i42.AccountRemoteDatasource>()));
  gh.lazySingleton<_i45.AddCartFoodCountUsecase>(() =>
      _i45.AddCartFoodCountUsecase(homeRepository: gh<_i21.HomeRepository>()));
  gh.lazySingleton<_i46.AddToCartUsecase>(
      () => _i46.AddToCartUsecase(homeRepository: gh<_i21.HomeRepository>()));
  gh.lazySingleton<_i47.AuthNotifier>(() => _i47.AuthNotifier(
        registerWithEmailUsecase: gh<_i30.RegisterWithEmailUsecase>(),
        registerWithPhoneUsecase: gh<_i31.RegisterWithPhoneUsecase>(),
        loginWithEmailUsecase: gh<_i23.LoginWithEmailUsecase>(),
        setPasswordUsecase: gh<_i37.SetPasswordUsecase>(),
        sendOtpUsecase: gh<_i36.SendOtpUsecase>(),
        verifyOtpUsecase: gh<_i40.VerifyOtpUsecase>(),
        resendOtpSmsUsecase: gh<_i33.ResendOtpSmsUsecase>(),
        updateProfileWithPhoneNumberUsecase:
            gh<_i39.UpdateProfileWithPhoneNumberUsecase>(),
        updateProfileWithEmailUsecase: gh<_i38.UpdateProfileWithEmailUsecase>(),
        resetPasswordEmailUsecase: gh<_i34.ResetPasswordEmailUsecase>(),
        changePasswordEmailUsecase: gh<_i19.ChangePasswordEmailUsecase>(),
        resetPasswordPhoneUsecae: gh<_i35.ResetPasswordPhoneUsecase>(),
      ));
  gh.lazySingleton<_i48.EditNameUsecase>(() =>
      _i48.EditNameUsecase(accountRepository: gh<_i43.AccountRepository>()));
  gh.lazySingleton<_i49.GetAddressUsecase>(() =>
      _i49.GetAddressUsecase(accountRepository: gh<_i43.AccountRepository>()));
  gh.lazySingleton<_i50.GetAllFoodUsecase>(
      () => _i50.GetAllFoodUsecase(homeRepository: gh<_i21.HomeRepository>()));
  gh.lazySingleton<_i51.GetAllRestaurantUsecase>(() =>
      _i51.GetAllRestaurantUsecase(homeRepository: gh<_i21.HomeRepository>()));
  gh.lazySingleton<_i52.GetBannersUsecase>(
      () => _i52.GetBannersUsecase(homeRepository: gh<_i21.HomeRepository>()));
  gh.lazySingleton<_i53.GetCartUsecase>(
      () => _i53.GetCartUsecase(homeRespository: gh<_i21.HomeRepository>()));
  gh.lazySingleton<_i54.GetDefaultAdressUsecase>(() =>
      _i54.GetDefaultAdressUsecase(
          accountRepository: gh<_i43.AccountRepository>()));
  gh.lazySingleton<_i55.GetFoodByCategoriesUsecase>(() =>
      _i55.GetFoodByCategoriesUsecase(
          homeRepository: gh<_i21.HomeRepository>()));
  gh.lazySingleton<_i56.GetFoodByRestaurantUsecase>(() =>
      _i56.GetFoodByRestaurantUsecase(
          homeRepository: gh<_i21.HomeRepository>()));
  gh.lazySingleton<_i57.GetFoodCategoriesUsecase>(() =>
      _i57.GetFoodCategoriesUsecase(homeRepository: gh<_i21.HomeRepository>()));
  gh.lazySingleton<_i58.GetNotificationUsecase>(() =>
      _i58.GetNotificationUsecase(homeRepository: gh<_i21.HomeRepository>()));
  gh.lazySingleton<_i59.GetOrderstUsecase>(
      () => _i59.GetOrderstUsecase(homeRespository: gh<_i21.HomeRepository>()));
  gh.lazySingleton<_i60.GetRestaurantUsecase>(() =>
      _i60.GetRestaurantUsecase(homeRespository: gh<_i21.HomeRepository>()));
  gh.lazySingleton<_i61.GetTicketUsecase>(
      () => _i61.GetTicketUsecase(homeRepository: gh<_i21.HomeRepository>()));
  gh.lazySingleton<_i62.GetUserUsecase>(
      () => _i62.GetUserUsecase(homeRepository: gh<_i21.HomeRepository>()));
  gh.lazySingleton<_i63.GetWalletUsecase>(
      () => _i63.GetWalletUsecase(homeRepository: gh<_i21.HomeRepository>()));
  gh.lazySingleton<_i64.SetDefaultAddressUsecase>(() =>
      _i64.SetDefaultAddressUsecase(
          accountRepository: gh<_i43.AccountRepository>()));
  gh.lazySingleton<_i65.UpdateAddressUsecase>(() => _i65.UpdateAddressUsecase(
      accountRepository: gh<_i43.AccountRepository>()));
  return getIt;
}

class _$RegisterModule extends _i66.RegisterModule {}
