import 'package:flutter/material.dart';
import 'package:meals/app/components/drawer.dart';
import 'package:meals/app/components/floating_bottom_bar.dart';
import 'package:meals/app/screens/category_screen.dart';
import 'package:meals/app/screens/favorite_screen.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen({
    super.key,
    required this.favoriteMeals,
  });

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int? _selectedIndexScreen = 0;
  List<Map<String, Object>>? _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Category List',
        'screen': const CategoriesScreen(),
      },
      {
        'title': 'My Favourites',
        'screen': FavoriteScreen(favoriteMeals: widget.favoriteMeals),
      }
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedIndexScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens![_selectedIndexScreen!]['title'].toString(),
        ),
      ),
      drawer: const MainDrawer(),
      body: _screens![_selectedIndexScreen!]['screen'] as Widget,
      bottomNavigationBar: FloatingBottomNavigationBar(
        onTap: _selectScreen,
        currentIndex: _selectedIndexScreen as int,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
