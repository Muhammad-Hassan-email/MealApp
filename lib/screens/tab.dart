import 'package:flutter/material.dart';
import 'package:meals_app/screens/categoryscreen.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/Provider/favorites_provider.dart';
import 'package:meals_app/Provider/filters_provider.dart';

const kInitialFilters = {
    Filter.glutenfree: false,
    Filter.lactosefree: false,
    Filter.vegetarian: false,
    Filter.vegun: false,
  };

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({
    super.key,
  });

  

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedPageIndex = 0;
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if(identifier == 'filter')
    {
      await Navigator.of(context).push<Map<Filter,bool>>
      (
        MaterialPageRoute
        (
          builder: (ctx) => const Filters(),
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoryScreen(
      availableMeals: availableMeals,
      );
    var activePageTitle = 'Category';

    if(_selectedPageIndex == 1){
      final favoriteMeal = ref.watch(favoriteMealProvider);
      activePage = MealsScreen(
        meals: favoriteMeal, 
        );
      activePageTitle = 'Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen : _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Category',),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites' ),
        ],
      ),
    );
  }
}