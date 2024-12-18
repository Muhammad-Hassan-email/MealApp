import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/Provider/meal_provider.dart';

enum Filter{
  glutenfree,
  lactosefree,
  vegetarian,
  vegun,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>>{
  FiltersNotifier() : super({
    Filter.glutenfree: false,
    Filter.lactosefree: false,
    Filter.vegetarian: false,
    Filter.vegun: false,
  });

  void setFilters(Map<Filter, bool> chosenFilters){
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive)
  {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier());

final filteredMealsProvider = Provider((ref){
  final meals = ref.watch(mealsProvider);
  final activeFilters =  ref.watch(filtersProvider);
      return meals.where((meal){
      if(activeFilters[Filter.glutenfree]! && !meal.isGlutenFree){
        return false;
      }

      if(activeFilters[Filter.lactosefree]! && !meal.isLactoseFree){
        return false;
      }

      if(activeFilters[Filter.vegetarian]! && !meal.isVegetarian){
        return false;
      }

      if(activeFilters[Filter.vegun]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();
  });