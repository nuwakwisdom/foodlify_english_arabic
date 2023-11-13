import 'dart:async';

import 'package:Foodlify/app/widgets/app_loader.dart';
import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/core/sl/sl_container.dart';
import 'package:Foodlify/core/utils/flushbar_notification.dart';
import 'package:Foodlify/features/account/presentation/cubit/favourite_state.dart';
import 'package:Foodlify/features/home/domain/entities/restaurant_food_entity.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit({
    required this.homeRepository,
    FavouriteState? initialState,
  }) : super(
          initialState ?? const FavouriteState.initial(),
        );
  final HomeRepository homeRepository;

  List<RestaurantFoodEntity> favourites = [];

  Future<void> getFavourites(BuildContext context) async {
    emit(const FavouriteState.loading());
    // unawaited(sl<AppLoadingPopup>().show(context));
    final response = await homeRepository.getFavouriteFood();
    return response.fold(
      (failure) {
        // Navigator.pop(context);
        emit(
          FavouriteState.error(message: FailureToMessage.mapFailureToMessage(failure)),
        );
      },
      (favourites) {
        //  Navigator.pop(context);
        this.favourites = favourites;
        emit(FavouriteState.foods(favourites: favourites));
      },
    );
  }

  Future<void> removedFavourites(String id, BuildContext context) async {
    emit(const FavouriteState.loading());
    unawaited(sl<AppLoadingPopup>().show(context));
    final response = await homeRepository.removeFoodFromFavourite(id);
    return response.fold(
      (failure) {
        emit(
          FavouriteState.error(message: FailureToMessage.mapFailureToMessage(failure)),
        );
        Navigator.pop(context);
      },
      (r) async {
        final response = await homeRepository.getFavouriteFood();
        return response.fold(
          (failure) {
            Navigator.pop(context);
            emit(
              FavouriteState.error(message: FailureToMessage.mapFailureToMessage(failure)),
            );
          },
          (favourites) {
            Navigator.pop(context);
            this.favourites = favourites;
            emit(FavouriteState.foods(favourites: favourites));
            FlushbarNotification.showSuccessMessage(
              context,
              message: 'Removed from favourites',
            );
          },
        );
      },
    );
  }

  Future<void> addToFavourites(
    String id,
    BuildContext context,
  ) async {
    emit(const FavouriteState.loading());
    unawaited(sl<AppLoadingPopup>().show(context));
    final response = await homeRepository.addFoodToFavourite(id);
    return response.fold(
      (failure) {
        Navigator.pop(context);
        emit(
          FavouriteState.error(message: FailureToMessage.mapFailureToMessage(failure)),
        );
      },
      (r) async {
        final response = await homeRepository.getFavouriteFood();
        return response.fold(
          (failure) {
            Navigator.pop(context);
            emit(
              FavouriteState.error(message: FailureToMessage.mapFailureToMessage(failure)),
            );
          },
          (favourites) {
            Navigator.pop(context);
            this.favourites = favourites;
            emit(FavouriteState.foods(favourites: favourites));
            FlushbarNotification.showSuccessMessage(
              context,
              message: 'Added to favourites',
            );
          },
        );
      },
    );
  }
}
