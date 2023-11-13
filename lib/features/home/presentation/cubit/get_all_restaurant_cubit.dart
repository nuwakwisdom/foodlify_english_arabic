import 'package:Foodlify/core/usecase/usecase.dart';
import 'package:Foodlify/features/home/domain/entities/restaurant_entitties.dart';
import 'package:Foodlify/features/home/domain/usecases/get_all_restaurant_usecase.dart';
import 'package:Foodlify/features/home/domain/usecases/get_banner_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_restaurant_cubit.freezed.dart';
part 'get_all_restaurant_state.dart';

class GetAllRestaurantCubit extends Cubit<GetAllRestaurantState> {
  GetAllRestaurantCubit({
    required this.getAllRestaurantUsecase,
    required this.getBannersUsecase,
  }) : super(const GetAllRestaurantState.initial());
  final GetAllRestaurantUsecase getAllRestaurantUsecase;
  final GetBannersUsecase getBannersUsecase;
  List<RestaurantEntity>? allRestaurant;
  List<String>? banners;
  Future<void> getAllRestaurant(
    BuildContext context, {
    required String location,
  }) async {
    //emit(const GetCartState.loading());

    final response =
        await getAllRestaurantUsecase(AllRestaurantParams(location: location));
    response.fold((l) {
      emit(const GetAllRestaurantState.error());
    }, (r) {
      allRestaurant = r;
      print(r);
      emit(const GetAllRestaurantState.success());
    });
  }

  Future<void> getBanners() async {
    //emit(const GetCartState.loading());

    final response = await getBannersUsecase(NoParams());
    response.fold((l) {
      emit(const GetAllRestaurantState.error());
    }, (r) {
      banners = r;
      print(r);
      emit(const GetAllRestaurantState.success());
    });
  }
}
