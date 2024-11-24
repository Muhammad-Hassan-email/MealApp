import 'package:flutter/material.dart';
import 'package:meals_app/Provider/favorites_provider.dart';
import 'package:meals_app/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealsDetailScreen extends ConsumerWidget {
  const MealsDetailScreen({
    super.key, 
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealProvider);
    final isFavorite = favoriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: (){
              final wasAdded = ref.read(
                favoriteMealProvider.notifier
              ).toggleMealFavouriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(wasAdded ? 'Meal added as favorite' : 'Meal removed'),
      duration: const Duration(seconds: 1),),
    );
              
            }, 
            icon: Icon(isFavorite ? Icons.star : Icons.star_border),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 24,),
        
            for(final ingredients in meal.ingredients)
              Text(
                ingredients,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),

            const SizedBox(height: 14),
            Text('Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            for(final Step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  Step,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  )
                ),
              ),
          ],
        ),
      ),
    );
  }
}