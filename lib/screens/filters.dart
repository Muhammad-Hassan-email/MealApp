import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/Provider/filters_provider.dart';

class Filters extends ConsumerWidget {
  const Filters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: Column(
          children: [
            SwitchListTile(
              value: activeFilters[Filter.glutenfree]!, 
              onChanged: (isChecked){
                ref.
                read(filtersProvider.notifier)
                .setFilter(Filter.glutenfree, isChecked);
              }, 
              title: Text(
                'Gluten_free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include gluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
        
            SwitchListTile(
              value: activeFilters[Filter.lactosefree]!, 
              onChanged: (isChecked){
                ref.
                read(filtersProvider.notifier)
                .setFilter(Filter.lactosefree, isChecked);
              },  
              title: Text(
                'Lactose_free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
        
            SwitchListTile(
              value: activeFilters[Filter.vegetarian]!, 
              onChanged: (isChecked){
                ref.
                read(filtersProvider.notifier)
                .setFilter(Filter.vegetarian, isChecked);
              }, 
              title: Text(
                'Vegetarian_free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include Vegetarian-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
        
            SwitchListTile(
              value: activeFilters[Filter.vegun]!, 
              onChanged: (isChecked){
                ref.
                read(filtersProvider.notifier)
                .setFilter(Filter.vegun, isChecked);
              }, 
              title: Text(
                'Vegan_free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include Vegan-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
    );
  }
}