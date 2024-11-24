import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoritesMealNotifier extends StateNotifier<List <Meal>>{
  FavoritesMealNotifier() : super([]); //Passing the same type that's why we pass list of meal
  bool toggleMealFavouriteStatus(Meal meal){
    final mealIsFavourite = state.contains(meal);

    //Riverpod package is not allowed to call add or remove method
    if(mealIsFavourite){
      //Here we check the meal is exist through meal.id,
      //from where method we get the list and filter teh list
      //This line remove the item
      state = state.where((meal) => meal.id !=meal.id).toList();
      return false;
    }
    else
    {
      //we adding the meal and call teh existing list through spread operator(...) and call state
      state = [...state, meal];
      return true;
    }
  }

}

final favoriteMealProvider = StateNotifierProvider<FavoritesMealNotifier ,List<Meal>>(
  (ref) 
  {
    return FavoritesMealNotifier();
    }
);