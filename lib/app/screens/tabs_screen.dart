import 'package:flutter/material.dart';
import 'package:meals/app/components/drawer.dart';
import 'package:meals/app/screens/categories_meals_screen.dart';
import 'package:meals/app/screens/category_screen.dart';
import 'package:meals/app/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int? _selectedIndexScreen = 0;
  final List<Map<String, Object>> _screens = const [
    {
      'title': 'Lista de Categorias',
      'screen': CategoriesScreen(),
    },
    {
      'title': 'Meus Favoritos',
      'screen': FavoriteScreen(),
    }
  ];

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
          _screens[_selectedIndexScreen!]['title'].toString(),
        ),
      ),
      drawer: const MainDrawer(),
      body: _screens[_selectedIndexScreen!]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedIndexScreen as int,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
