import 'package:flutter/material.dart';
import 'package:meals/app/components/floating_bottom_bar.dart';
import 'package:meals/app/screens/category_screen.dart';
import 'package:meals/app/screens/favorite_screen.dart';
import 'package:meals/app/screens/settings_screen.dart';

import '../models/meal.dart';
import '../models/settings.dart';

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
  Settings settings = Settings();

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
    });
  }

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
      },
      {
        'title': 'Settings',
        'screen': SettingsScreen(
          settings: settings,
          onSettingsChanged: _filterMeals,
        ),
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100),
            ),
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                _screens![_selectedIndexScreen!]['title'].toString(),
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
