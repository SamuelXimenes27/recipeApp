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
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        RoutesConst.home: (context) => const TabsScreen(),
        RoutesConst.categoriesMeals: (context) =>
            CategoriesMealsScreen(meals: _availableMeals),
        RoutesConst.mealDetails: (context) => const MealDetailsScreen(),
        RoutesConst.settings: (context) => SettingsScreen(
              settings: settings,
              onSettingsChanged: _filterMeals,
            ),
      },
    );
  }
}
