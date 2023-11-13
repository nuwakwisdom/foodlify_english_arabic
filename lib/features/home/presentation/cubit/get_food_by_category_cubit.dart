import 'dart:async';

import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/utils/flushbar_notification.dart';
import 'package:Foodlify/features/home/domain/entities/restaurant_food_entity.dart';
import 'package:Foodlify/features/home/domain/usecases/get_all_food_usecase.dart';
import 'package:Foodlify/features/home/domain/usecases/get_food_by_categories.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_food_by_category_cubit.freezed.dart';
part 'get_food_by_category_state.dart';

class GetFoodByCategoryCubit extends Cubit<GetFoodByCategoryState> {
  GetFoodByCategoryCubit({
    required this.getFoodByCategoriesUsecase,
    required this.getAllFoodUsecase,
  }) : super(const GetFoodByCategoryState.initial());
  final GetFoodByCategoriesUsecase getFoodByCategoriesUsecase;
  final GetAllFoodUsecase getAllFoodUsecase;
  List<RestaurantFoodEntity>? foodByCategries;
  List<RestaurantFoodEntity>? allFood;
  List<RestaurantFoodEntity> paginatedFoodList = [];
  String? getPresentLocation;
  void getLocation({required String presentLoaction}) {
    getPresentLocation = presentLoaction;
    print(getPresentLocation);
  }

  Future<void> getFoodByCategories(
    BuildContext context, {
    required String location,
    required String category,
  }) async {
    //emit(const GetCartState.loading());
    // unawaited(sl<AppLoadingPopup>().show(context));
    final response = await getFoodByCategoriesUsecase(
      GetFoodByCategoryParams(location: location, category: category),
    );
    response.fold((l) {
      //  Navigator.pop(context);
      FlushbarNotification.showErrorMessage(
        context,
        message: FailureToMessage.mapFailureToMessage(l),
      );
      emit(
        const GetFoodByCategoryState.error(),
      );
    }, (r) {
      // Navigator.pop(context);
      foodByCategries = r;
      emit(GetFoodByCategoryState.success(foodByCategries: r));
    });
  }

  Future<void> getAllFood(BuildContext context,
      {required String location, required int page}) async {
    emit(const GetFoodByCategoryState.loading());
    // unawaited(sl<AppLoadingPopup>().show(context));
    final response = await getAllFoodUsecase(
      GetAllFoodParams(location: location, page: page),
    );
    response.fold((l) {
      //  Navigator.pop(context);
      FlushbarNotification.showErrorMessage(
        context,
        message: FailureToMessage.mapFailureToMessage(l),
      );
      emit(
        const GetFoodByCategoryState.error(),
      );
    }, (r) {
      // Navigator.pop(context);
      allFood = r;
      paginatedFoodList.addAll(r);
      emit(
        GetFoodByCategoryState.success(
          foodByCategries: r..shuffle(),
        ),
      );
    });
  }

  Future<void> getPaginatedFood(BuildContext context,
      {required String location, required int page}) async {
    emit(const GetFoodByCategoryState.loading());
    // unawaited(sl<AppLoadingPopup>().show(context));
    final response = await getAllFoodUsecase(
      GetAllFoodParams(location: location, page: page),
    );
    response.fold((l) {
      //  Navigator.pop(context);
      /* FlushbarNotification.showErrorMessage(
        context,
        message: FailureToMessage.mapFailureToMessage(l),
      );*/
      emit(
        const GetFoodByCategoryState.error(),
      );
    }, (r) {
      // Navigator.pop(context);
      allFood = r;
      paginatedFoodList.addAll(r);
      emit(
        GetFoodByCategoryState.success(
          foodByCategries: r..shuffle(),
        ),
      );
    });
  }
}
