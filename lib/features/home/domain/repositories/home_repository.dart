// ignore_for_file: one_member_abstracts, non_constant_identifier_names

import 'dart:io';

import 'package:Foodlify/core/errors/failure.dart';
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
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, bool>> addToCart({
    required String foodId,
    required int qty,
  });
  Future<Either<Failure, NewCartModel>> getCarts();
  Future<Either<Failure, List<RestaurantModel>>> getRestaurants();
  Future<Either<Failure, List<RestaurantFoodModel>>> getFoodByRestaurant({
    required String location,
    required String id,
  });
  Future<Either<Failure, UserModel>> getUser();
  Future<Either<Failure, List<RestaurantModel>>> getAllRestaurant({
    required String location,
  });
  Future<Either<Failure, List<FoodCategoriesModel>>> getFoodCategories({
    required String locstion,
  });
  Future<Either<Failure, List<RestaurantFoodModel>>>
      getFoodByCategoryAndLoaction({
    required String location,
    required String category,
  });
  Future<Either<Failure, bool>> orderFood({
    required String foodId,
    required num amountPaid,
    required String address_id,
  });
  Future<Either<Failure, bool>> removeFoodFromCart({
    required String foodId,
  });
  Future<Either<Failure, bool>> orderCart({
    required String cartId,
    required String address_id,
  });
  Future<Either<Failure, bool>> reduceFoodCart({
    required String foodId,
    required int quantity,
  });
  Future<Either<Failure, WalletModel>> getWallet();

  Future<Either<Failure, bool>> generateReferralCode();
  Future<Either<Failure, bool>> addFoodCart({
    required String foodId,
    required int quantity,
  });

  Future<Either<Failure, bool>> addFoodToFavourite(String id);

  Future<Either<Failure, bool>> removeFoodFromFavourite(String id);

  Future<Either<Failure, List<RestaurantFoodEntity>>> getFavouriteFood();
  Future<Either<Failure, List<OrderModel>>> getOrders();

  Future<Either<Failure, List<RestaurantFoodEntity>>> searchFood({
    required String food,
    required String location,
  });
  Future<Either<Failure, List<NotificationModel>>> getNNotification();

  Future<Either<Failure, String>> topUpWallet({
    required double amount,
  });
  Future<Either<Failure, List<String>>> getBanner();
  Future<Either<Failure, List<RestaurantFoodModel>>> getAllFood({
    required String location,
    required int page,
  });
  Future<Either<Failure, bool>> postTicket({
    required String category,
    required String message,
  });
  Future<Either<Failure, bool>> putTicketFilde({
    required String ticketId,
    required File file,
  });
  Future<Either<Failure, List<TicketModel>>> getTickest({
    required int page,
  });
  Future<Either<Failure, bool>> viewNotification({
    required int id,
  });
}
