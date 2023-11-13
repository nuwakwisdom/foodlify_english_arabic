import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/utils/flushbar_notification.dart';
import 'package:Foodlify/features/home/domain/entities/food_category_entity.dart';
import 'package:Foodlify/features/home/domain/usecases/get_food_categories_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_food_categories_cubit.freezed.dart';
part 'get_food_categories_state.dart';

class GetFoodCategoriesCubit extends Cubit<GetFoodCategoriesState> {
  GetFoodCategoriesCubit({
    required this.getFoodCategoriesUsecase,
  }) : super(const GetFoodCategoriesState.initial());

  final GetFoodCategoriesUsecase getFoodCategoriesUsecase;
  List<FoodCategoryEntity>? foodCategories;

  Future<void> getFoodCategories(
    BuildContext context, {
    required String location,
  }) async {
    emit(const GetFoodCategoriesState.loading());

    final response = await getFoodCategoriesUsecase(
      FoodCategoriesParams(location: location),
    );
    response.fold((l) {
      FlushbarNotification.showErrorMessage(
        context,
        message: FailureToMessage.mapFailureToMessage(l),
      );
      emit(
        GetFoodCategoriesState.error(
          error: FailureToMessage.mapFailureToMessage(l),
        ),
      );
    }, (r) {
      foodCategories = r;
      emit(const GetFoodCategoriesState.success());
    });
  }
}
