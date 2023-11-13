import 'package:Foodlify/core/errors/errors.dart';
import 'package:Foodlify/features/home/domain/repositories/home_repository.dart';
import 'package:Foodlify/features/home/presentation/cubit/search_food_state.dart';
import 'package:bloc/bloc.dart';

class SearchFoodCubit extends Cubit<SearchFoodState> {
  SearchFoodCubit({
    required this.homeRepository,
  }) : super(
          const SearchFoodState.initial(),
        );
  final HomeRepository homeRepository;

  Future<void> searchFood(String food) async {
    emit(const SearchFoodState.loading());
    final response = await homeRepository.searchFood(
      food: food,
      location: 'Zaria',
    );
    return response.fold(
      (failure) {
        emit(
          SearchFoodState.error(message: FailureToMessage.mapFailureToMessage(failure)),
        );
      },
      (foods) {
        emit(SearchFoodState.foods(foods: foods));
      },
    );
  }
}
