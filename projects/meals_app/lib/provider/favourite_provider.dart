import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/model/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);
  bool toggleMealFavouriteStatus(Meal meal) {
    final isMealAlreadyExistsInFavourites = state.contains(meal);
    if (isMealAlreadyExistsInFavourites) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouriteMealProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>(
  (ref) {
    return FavouriteMealsNotifier();
  },
);
