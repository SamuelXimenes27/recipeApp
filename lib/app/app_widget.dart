import 'package:flutter/material.dart';
import 'package:meals/app/screens/categories_meals_screen.dart';
import 'package:meals/app/screens/meal_details.screen.dart';
import 'package:meals/app/screens/settings_screen.dart';
import 'package:meals/app/screens/tabs_screen.dart';
import 'package:meals/app/utils/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        RoutesConst.categoriesMeals: (context) => const CategoriesMealsScreen(),
        RoutesConst.mealDetails: (context) => const MealDetailsScreen(),
        RoutesConst.settings: (context) => const SettingsScreen(),
      },
    );
  }
}
