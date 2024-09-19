import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/provider/meal_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FilterNotifier extends StateNotifier<Map<Filter, bool>>{
  FilterNotifier() : super({
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  });

  void setFilters(dynamic currentFilters){
    state = currentFilters;
  }

  void setFilter(Filter filter, bool isEnabled){
    state = {...state, filter:isEnabled,};
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, Map<Filter, bool>> ((ref){
  return FilterNotifier();
});

final filterMealsProvider = Provider((ref){
  final meals = ref.watch(mealProvider);
  final activeFilters = ref.watch(filterProvider);
  return meals.where((meal) {
      if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (activeFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
});