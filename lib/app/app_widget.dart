import 'package:flutter/material.dart';
import 'package:meals/app/data/mock_data.dart';
import 'package:meals/app/models/meal.dart';
import 'package:meals/app/models/settings.dart';
import 'package:meals/app/screens/categories_meals_screen.dart';
import 'package:meals/app/screens/meal_details.screen.dart';
import 'package:meals/app/screens/settings_screen.dart';
import 'package:meals/app/screens/tabs_screen.dart';
import 'package:meals/app/utils/routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = mockMeal;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = mockMeal.where((meal) {
        final filterGluten = settings.isGlutenFree! && !meal.isGlutenFree!;
        final filterLactose = settings.isLactoseFree! && !meal.isLactoseFree!;
        final filterVegan = settings.isVegan! && !meal.isVegan!;
        final filterVegetarian = settings.isVegetarian! && !meal.isVegetarian!;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'PasseioTest',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'PasseioTest',
              ),
              titleMedium: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'PasseioTest',
              ),
            ),
      ),
      routes: {
        RoutesConst.home: (context) => TabsScreen(
              favoriteMeals: _favoriteMeals,
            ),
        RoutesConst.categoriesMeals: (context) =>
            CategoriesMealsScreen(meals: _availableMeals),
        RoutesConst.mealDetails: (context) => MealDetailsScreen(
              onToggleFavorite: _toggleFavorite,
              isFavorite: _isFavorite,
            ),
        RoutesConst.settings: (context) => SettingsScreen(
              settings: settings,
              onSettingsChanged: _filterMeals,
            ),
      },
    );
  }
}
