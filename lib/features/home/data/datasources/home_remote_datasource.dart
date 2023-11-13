// ignore_for_file: one_member_abstracts, inference_failure_on_function_invocation, lines_longer_than_80_chars, avoid_dynamic_calls, non_constant_identifier_names

import 'dart:io';

import 'package:Foodlify/core/errors/error.dart';
import 'package:Foodlify/core/local_data/local_data_storage.dart';
import 'package:Foodlify/core/network/network.dart';
import 'package:Foodlify/features/home/data/models/banner_list_model.dart';
import 'package:Foodlify/features/home/data/models/food_categories_model.dart';
import 'package:Foodlify/features/home/data/models/food_category_list.dart';
import 'package:Foodlify/features/home/data/models/new_cart_model.dart';
import 'package:Foodlify/features/home/data/models/notification_list_model.dart';
import 'package:Foodlify/features/home/data/models/notification_model.dart';
import 'package:Foodlify/features/home/data/models/order_list_model.dart';
import 'package:Foodlify/features/home/data/models/order_model.dart';
import 'package:Foodlify/features/home/data/models/restaurant_food_list.dart';
import 'package:Foodlify/features/home/data/models/restaurant_food_model.dart';
import 'package:Foodlify/features/home/data/models/restaurant_list_model.dart';
import 'package:Foodlify/features/home/data/models/restaurant_model.dart';
import 'package:Foodlify/features/home/data/models/ticket_list_model.dart';
import 'package:Foodlify/features/home/data/models/ticket_model.dart';
import 'package:Foodlify/features/home/data/models/user_model.dart';
import 'package:Foodlify/features/home/data/models/wallet_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

abstract class HomeRemoteDatasource {
  Future<bool> addToCart({
    required String foodId,
    required int qty,
  });
  Future<NewCartModel> getCart();
  Future<List<RestaurantModel>> getRestaurants();
  Future<List<RestaurantFoodModel>> getFoodByRestaurant({
    required String location,
    required String id,
  });
  Future<List<RestaurantModel>> getAllRestaurant({
    required String location,
  });
  Future<List<RestaurantFoodModel>> getFoodByCategories({
    required String location,
    required String category,
  });
  Future<List<RestaurantFoodModel>> getAllFood({
    required String location,
    required int page,
  });
  Future<UserModel> getUser();
  Future<List<FoodCategoriesModel>> getFoodCateries({
    required String location,
  });
  Future<bool> orderFood({
    required String foodId,
    required num amountPaid,
    required String address_id,
  });
  Future<bool> removeFoodFromCart({
    required String foodId,
  });
  Future<bool> orderCart({
    required String cartId,
    required String address_id,
  });
  Future<bool> reduceFoodCartCount({
    required String foodId,
    required int quantity,
  });

  Future<bool> generateReferralCode();

  Future<bool> addFoodToFavourite(String id);

  Future<bool> removeFoodFromFavourite(String id);

  Future<List<RestaurantFoodModel>> getFavouriteFood();

  Future<bool> addFoodCartCount({
    required String foodId,
    required int quantity,
  });
  Future<List<OrderModel>> getOrders();

  Future<WalletModel> getWallet();

  Future<List<RestaurantFoodModel>> searchFood({
    required String food,
    required String location,
  });
  Future<List<NotificationModel>> getNotifications();

  Future<String> topUpWallet({
    required double amount,
  });
  Future<List<String>> getBanners();
  /* Future<List<RestaurantFoodModel>> getFoodByCategoriesPage({
    required String location,
    required String category,
    required int page,
  });*/
  Future<bool> postTicket({
    required String category,
    required String message,
  });
  Future<bool> putTicketFile({
    required String ticketId,
    required File file,
  });
  Future<List<TicketModel>> getTickets({
    required int page,
  });
  Future<bool> viewNotification({
    required int id,
  });
}

String newticketId = '';

@LazySingleton(as: HomeRemoteDatasource)
class HomeRemoteDatasourceImpl extends HomeRemoteDatasource {
  HomeRemoteDatasourceImpl({
    required this.localDataStorage,
    required this.apiRequester,
    required this.networkInfo,
  });

  final LocalDataStorage localDataStorage;
  final ApiRequester apiRequester;
  final NetworkInfo networkInfo;

  @override
  Future<bool> addToCart({required String foodId, required int qty}) async {
    if (await networkInfo.isConnected) {
      final body = {
        'food_id': foodId,
        'quantity': qty,
      };
      final dio = Dio();

      Logger().d(body);
      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.post(
        'http://34.194.114.40:8090/api/v1/user/add_food_to_cart',
        data: body,
        options: Options(),
      );
      print(response.data);
      return response.statusCode == 200;
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<NewCartModel> getCart() async {
    if (await networkInfo.isConnected) {
      final dio = Dio();

      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.get(
        'http://34.194.114.40:8090/api/v1/user/cart',
        options: Options(),
      );
      final cartsItem = NewCartModel.fromJson(
        response.data['body'] as Map<String, dynamic>,
      );
      print(response.data);

      return cartsItem;
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<List<RestaurantModel>> getRestaurants() async {
    if (await networkInfo.isConnected) {
      final dio = Dio();

      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.get(
        'http://34.194.114.40:8090//api/v1/user/restaurants',
        options: Options(),
      );
      final restaurants = RestaurantList.fromJson(
        response.data as Map<String, dynamic>,
      ).body;
      print(response.data);
      return restaurants?.toList() ?? [];
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<List<RestaurantFoodModel>> getFoodByRestaurant({
    required String location,
    required String id,
  }) async {
    if (await networkInfo.isConnected) {
      final dio = Dio();

      final response = await dio.get(
        'http://34.194.114.40:8090/api/v1/public/food_by_restaurant?location=$location&restaurant_id=$id',
        options: Options(),
      );
      final foodByRestaurant = RestaurantModelList.fromJson(
        response.data as Map<String, dynamic>,
      ).body;
      print(response.data);
      return foodByRestaurant?.toList() ?? [];
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<UserModel> getUser() async {
    if (await networkInfo.isConnected) {
      final dio = Dio();

      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.get(
        'http://34.194.114.40:8090/api/v1/user/profile',
        options: Options(),
      );

      Logger().d(response);
      return UserModel.fromJson(
        response.data['body'] as Map<String, dynamic>,
      );
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<List<RestaurantModel>> getAllRestaurant({
    required String location,
  }) async {
    if (await networkInfo.isConnected) {
      final dio = Dio();

      //  dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.get(
        'http://34.194.114.40:8090/api/v1/public/all_restaurant?location=$location',
        options: Options(),
      );
      final foodByRestaurant = RestaurantList.fromJson(
        response.data as Map<String, dynamic>,
      ).body;
      print(response.data);
      return foodByRestaurant?.toList() ?? [];
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<List<FoodCategoriesModel>> getFoodCateries({
    required String location,
  }) async {
    if (await networkInfo.isConnected) {
      final dio = Dio();

      //  dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.get(
        'http://34.194.114.40:8090/api/v1/public/food_categories?location=$location',
        options: Options(),
      );
      final foodCategories = FoodCategoriesListModel.fromJson(
        response.data as Map<String, dynamic>,
      ).body;
      Logger().d(response.data);
      return foodCategories?.toList() ?? [];
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<List<RestaurantFoodModel>> getFoodByCategories({
    required String location,
    required String category,
  }) async {
    if (await networkInfo.isConnected) {
      final dio = Dio();

      final response = await dio.get(
        'http://34.194.114.40:8090/api/v1/public/food_by_category?location=$location&food_category=$category',
        options: Options(),
      );
      final foodByRestaurant = RestaurantModelList.fromJson(
        response.data as Map<String, dynamic>,
      ).body;
      print(response.data);
      return foodByRestaurant?.toList() ?? [];
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<bool> orderFood({
    required String foodId,
    required num amountPaid,
    required String address_id,
  }) async {
    if (await networkInfo.isConnected) {
      final body = {
        'food_id': foodId,
        'amount_paid': amountPaid,
        'address_id': address_id,
      };
      final dio = Dio();

      Logger().d(body);
      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.post(
        'http://34.194.114.40:8090/api/v1/user/order',
        data: body,
        options: Options(),
      );
      print(response.data);
      return response.statusCode == 200;
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<bool> removeFoodFromCart({required String foodId}) async {
    if (await networkInfo.isConnected) {
      final body = {
        'food_id': foodId,
      };
      final dio = Dio();

      Logger().d(body);
      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.put(
        'http://34.194.114.40:8090/api/v1/user/remove_food_from_cart/$foodId',
        data: body,
        options: Options(),
      );
      print(response.data);
      return response.statusCode == 200;
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<bool> orderCart({
    required String cartId,
    required String address_id,
  }) async {
    if (await networkInfo.isConnected) {
      final body = {
        'cart_id': cartId,
        'address_id': address_id,
      };
      final dio = Dio();

      Logger().d(body);
      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.post(
        'http://34.194.114.40:8090/api/v1/user/order_cart',
        data: body,
        options: Options(),
      );
      print(response.data);
      return response.statusCode == 200;
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<bool> reduceFoodCartCount({
    required String foodId,
    required int quantity,
  }) async {
    if (await networkInfo.isConnected) {
      final dio = Dio();

      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.put(
        'http://34.194.114.40:8090/api/v1/user/reduce_cart_food_count/$foodId/$quantity',
        options: Options(),
      );
      return response.statusCode == 200;
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<bool> generateReferralCode() async {
    if (await networkInfo.isConnected) {
      final dio = Dio();

      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.post(
        'http://34.194.114.40:8090/api/v1/user/generate_referral_code',
        options: Options(),
      );
      return response.statusCode == 200;
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<bool> addFoodToFavourite(String id) async {
    if (await networkInfo.isConnected) {
      final dio = Dio();

      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.put(
        'http://34.194.114.40:8090/api/v1/user/add_favourite_food/$id',
        options: Options(),
      );
      return response.statusCode == 200;
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<List<RestaurantFoodModel>> getFavouriteFood() async {
    if (await networkInfo.isConnected) {
      final dio = Dio();

      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.get(
        'http://34.194.114.40:8090/api/v1/user/favourite_foods',
        options: Options(),
      );
      return (response.data['body'] as List<dynamic>)
          .map(
            (e) => RestaurantFoodModel.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<bool> removeFoodFromFavourite(String id) async {
    if (await networkInfo.isConnected) {
      final dio = Dio();

      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.put(
        'http://34.194.114.40:8090/api/v1/user/remove_food_from_favourite/$id',
        options: Options(),
      );
      return response.statusCode == 200;
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<WalletModel> getWallet() async {
    if (await networkInfo.isConnected) {
      final dio = Dio();

      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.get(
        'http://34.194.114.40:8090/api/v1/user/wallet',
        options: Options(),
      );

      Logger().d(response);
      return WalletModel.fromJson(
        response.data['body'] as Map<String, dynamic>,
      );
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<bool> addFoodCartCount({
    required String foodId,
    required int quantity,
  }) async {
    if (await networkInfo.isConnected) {
      final dio = Dio();

      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.put(
        'http://34.194.114.40:8090/api/v1/user/add_cart_food_count/$foodId/$quantity',
        options: Options(),
      );
      return response.statusCode == 200;
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<List<OrderModel>> getOrders() async {
    if (await networkInfo.isConnected) {
      final dio = Dio();
      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.get(
        'http://34.194.114.40:8090/api/v1/user/order',
        options: Options(),
      );
      final orders = OrdersListModel.fromJson(
        response.data as Map<String, dynamic>,
      ).body;
      print(response.data);
      return orders ?? [];
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<List<RestaurantFoodModel>> searchFood({
    required String food,
    required String location,
  }) async {
    if (await networkInfo.isConnected) {
      final dio = Dio();

      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.get(
        'http://34.194.114.40:8090/api/v1/public/food_by_title',
        options: Options(),
        queryParameters: {
          'location': location,
          'title': food,
        },
      );

      return (response.data['body'] as List<dynamic>)
          .map(
            (e) => RestaurantFoodModel.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<List<NotificationModel>> getNotifications() async {
    if (await networkInfo.isConnected) {
      final dio = Dio();
      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.get(
        'http://34.194.114.40:8090/api/v1/user/notifications',
        options: Options(),
      );
      print(response.data);
      final notifications = NotificationListModel.fromJson(
        response.data as Map<String, dynamic>,
      ).body;

      return notifications ?? [];
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<String> topUpWallet({
    required double amount,
  }) async {
    if (await networkInfo.isConnected) {
      final dio = Dio();
      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.post(
        'http://34.194.114.40:8090/api/v1/user/init_transaction/$amount',
        options: Options(),
      );
      final checkOutUrl = response.data['body']['checkout_url'] as String;
      return checkOutUrl;
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<List<String>> getBanners() async {
    if (await networkInfo.isConnected) {
      final dio = Dio();

      final response = await dio.get(
        'http://34.194.114.40:8090/api/v1/public/banner',
        options: Options(),
      );
      final banners = BannnerListMoodel.fromJson(
        response.data as Map<String, dynamic>,
      ).body;
      return banners ?? [];
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<List<RestaurantFoodModel>> getAllFood(
      {required String location, required int page}) async {
    if (await networkInfo.isConnected) {
      final dio = Dio();

      final response = await dio.get(
        'http://34.194.114.40:8090/api/v1/public/all_food_paged?location=$location&page=$page',
        options: Options(),
      );
      final foodByRestaurant = RestaurantModelList.fromJson(
        response.data as Map<String, dynamic>,
      ).body;
      print(response.data);
      return foodByRestaurant?.toList() ?? [];
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<bool> postTicket(
      {required String category, required String message}) async {
    if (await networkInfo.isConnected) {
      final body = {
        'category': category,
        'message': message,
      };
      final dio = Dio();
      Logger().d(body);
      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.post(
        'http://34.194.114.40:8090/api/v1/user/ticket',
        data: body,
        options: Options(),
      );
      newticketId = response.data['body']['ticket_id'];
      print(newticketId);
      return response.statusCode == 200;
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<bool> putTicketFile(
      {required String ticketId, required File file}) async {
    if (await networkInfo.isConnected) {
      final body = {
        'file': await MultipartFile.fromFile(file.path),
      };
      final dio = Dio();
      Logger().d(body);
      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.put(
        'http://34.194.114.40:8090/api/v1/user/add_ticket_file/$newticketId',
        data: FormData.fromMap(body),
        options: Options(),
      );

      return response.statusCode == 200;
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<List<TicketModel>> getTickets({required int page}) async {
    if (await networkInfo.isConnected) {
      final dio = Dio();

      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.get(
        'http://34.194.114.40:8090/api/v1/user/tickets?page=$page',
        options: Options(),
      );
      final tickets = TicketListModel.fromJson(
        response.data as Map<String, dynamic>,
      ).body;
      print(response.data);
      return tickets?.toList() ?? [];
    } else {
      throw NoDataException();
    }
  }

  @override
  Future<bool> viewNotification({required int id}) async {
    if (await networkInfo.isConnected) {
      final body = {'id': id};
      final dio = Dio();

      dio.options.headers['Authorization'] = await localDataStorage.getToken();
      final response = await dio.put(
        'http://34.194.114.40:8090/api/v1/user/notification/viewed/$id',
        data: body,
        options: Options(),
      );
      Logger().d(body);
      // newticketId = response.data['body']['ticket_id'];
      // print();
      return response.statusCode == 200;
    } else {
      throw NoDataException();
    }
  }

  /* @override
  Future<List<RestaurantFoodModel>> getFoodByCategoriesPage(
      {required String location,
      required String category,
      required int page}) async {}*/
}
