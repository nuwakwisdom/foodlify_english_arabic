// ignore_for_file: lines_longer_than_80_chars, non_constant_identifier_names, deprecated_member_use

import 'dart:io';

import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/features/home/data/datasources/home_remote_datasource.dart';
import 'package:Foodlify/features/home/data/models/food_categories_model.dart';
import 'package:Foodlify/features/home/data/models/new_cart_model.dart';
import 'package:Foodlify/features/home/data/models/notification_model.dart';
import 'package:Foodlify/features/home/data/models/order_model.dart';
import 'package:Foodlify/features/home/data/models/restaurant_food_model.dart';
import 'package:Foodlify/features/home/data/models/restaurant_model.dart';
import 'package:Foodlify/features/home/data/models/ticket_model.dart';
import 'package:Foodlify/features/home/data/models/user_model.dart';
import 'package:Foodlify/features/home/data/models/wallet_model.dart';
import 'package:Foodlify/features/home/domain/entities/restaurant_food_entity.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: HomeRepository)
class HomeRespositoryImpl extends HomeRepository {
  HomeRespositoryImpl({
    required this.homeRemoteDatasource,
  });

  final HomeRemoteDatasource homeRemoteDatasource;

  @override
  Future<Either<Failure, bool>> addToCart({
    required String foodId,
    required int qty,
  }) async {
    try {
      final response = await homeRemoteDatasource.addToCart(
        foodId: foodId,
        qty: qty,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, NewCartModel>> getCarts() async {
    try {
      final response = await homeRemoteDatasource.getCart();
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, List<RestaurantModel>>> getRestaurants() async {
    try {
      final response = await homeRemoteDatasource.getRestaurants();
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, List<RestaurantFoodModel>>> getFoodByRestaurant({
    required String location,
    required String id,
  }) async {
    try {
      final response = await homeRemoteDatasource.getFoodByRestaurant(
        id: id,
        location: location,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUser() async {
    try {
      final response = await homeRemoteDatasource.getUser();
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, List<RestaurantModel>>> getAllRestaurant({
    required String location,
  }) async {
    try {
      final response = await homeRemoteDatasource.getAllRestaurant(
        location: location,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, List<FoodCategoriesModel>>> getFoodCategories({
    required String locstion,
  }) async {
    try {
      final response = await homeRemoteDatasource.getFoodCateries(
        location: locstion,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, List<RestaurantFoodModel>>>
      getFoodByCategoryAndLoaction(
          {required String location, required String category}) async {
    try {
      final response = await homeRemoteDatasource.getFoodByCategories(
        location: location,
        category: category,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> orderFood({
    required String foodId,
    required num amountPaid,
    required String address_id,
  }) async {
    try {
      final response = await homeRemoteDatasource.orderFood(
        foodId: foodId,
        amountPaid: amountPaid,
        address_id: address_id,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> removeFoodFromCart(
      {required String foodId}) async {
    try {
      final response = await homeRemoteDatasource.removeFoodFromCart(
        foodId: foodId,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> orderCart({
    required String cartId,
    required String address_id,
  }) async {
    try {
      final response = await homeRemoteDatasource.orderCart(
        cartId: cartId,
        address_id: address_id,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> reduceFoodCart({
    required String foodId,
    required int quantity,
  }) async {
    try {
      final response = await homeRemoteDatasource.reduceFoodCartCount(
        foodId: foodId,
        quantity: quantity,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> generateReferralCode() async {
    try {
      final response = await homeRemoteDatasource.generateReferralCode();
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, WalletModel>> getWallet() async {
    try {
      final response = await homeRemoteDatasource.getWallet();
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> addFoodCart({
    required String foodId,
    required int quantity,
  }) async {
    try {
      final response = await homeRemoteDatasource.addFoodCartCount(
        foodId: foodId,
        quantity: quantity,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getOrders() async {
    try {
      final response = await homeRemoteDatasource.getOrders();
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> addFoodToFavourite(String id) async {
    try {
      final response = await homeRemoteDatasource.addFoodToFavourite(id);
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, List<RestaurantFoodEntity>>> getFavouriteFood() async {
    try {
      final response = await homeRemoteDatasource.getFavouriteFood();
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          Logger().d(e.response!.data);
          if ((e.response?.data as Map<String, dynamic>)['message'] ==
              'Not Favourite Food Found') {
            return const Right([]);
          } else {
            return Left(
              ServerFailure(
                message:
                    '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
              ),
            );
          }
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> removeFoodFromFavourite(String id) async {
    try {
      final response = await homeRemoteDatasource.removeFoodFromFavourite(id);
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, List<RestaurantFoodEntity>>> searchFood({
    required String food,
    required String location,
  }) async {
    try {
      final response = await homeRemoteDatasource.searchFood(
        food: food,
        location: location,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          if ((e.response?.data as Map<String, dynamic>)['message'] ==
              'No Foods Found') {
            return const Right([]);
          } else {
            return Left(
              ServerFailure(
                message:
                    '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
              ),
            );
          }
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, List<NotificationModel>>> getNNotification() async {
    try {
      final response = await homeRemoteDatasource.getNotifications();
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          if ((e.response?.data as Map<String, dynamic>)['message'] ==
              'No Foods Found') {
            return const Right([]);
          } else {
            return Left(
              ServerFailure(
                message:
                    '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
              ),
            );
          }
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, String>> topUpWallet({
    required double amount,
  }) async {
    try {
      final response = await homeRemoteDatasource.topUpWallet(
        amount: amount,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);

          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, List<String>>> getBanner() async {
    try {
      final response = await homeRemoteDatasource.getBanners();
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);

          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, List<RestaurantFoodModel>>> getAllFood({
    required String location,
    required int page,
  }) async {
    try {
      final response = await homeRemoteDatasource.getAllFood(
        location: location,
        page: page,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);

          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> postTicket({
    required String category,
    required String message,
  }) async {
    try {
      final response = await homeRemoteDatasource.postTicket(
          category: category, message: message);
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);

          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> putTicketFilde(
      {required String ticketId, required File file}) async {
    try {
      final response = await homeRemoteDatasource.putTicketFile(
          ticketId: ticketId, file: file);
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);

          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, List<TicketModel>>> getTickest(
      {required int page}) async {
    try {
      final response = await homeRemoteDatasource.getTickets(page: page);
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);

          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> viewNotification({
    required int id,
  }) async {
    try {
      final response = await homeRemoteDatasource.viewNotification(
        id: id,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e..response!.statusCode);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);

          return Left(
            ServerFailure(
              message:
                  '${(e.response!.data as Map<String, dynamic>)['error'] ?? (e.response!.data as Map<String, dynamic>)['message'] ?? 'Service unavailable, please try again!'}',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }
}
