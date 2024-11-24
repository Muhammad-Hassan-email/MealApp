import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  //Define the function
  void _selectedCategory(BuildContext context, Category category){
    final filteredDummyMeal = availableMeals.where(
      (meal) => meal.categories.contains(category.id)).toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title, 
          meals: filteredDummyMeal,
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(24),
        //Set size for grids
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          childAspectRatio: 3/2, 
          crossAxisSpacing: 20, 
          mainAxisSpacing: 20
        ),

        //calling the grid data from available category object
        children: [
          //first category is a parameter and second is a value used
          for (final category in availableCategories)
            CategoryGridItem(category: category, onSelectedCategory: () {
              _selectedCategory(context, category); //category passing as a value //Passing the function
            },),
        ],
      );
    }
}