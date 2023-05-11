import 'package:flutter/material.dart';
import 'package:meals/app/components/meal_item.dart';
import 'package:meals/app/data/mock_data.dart';
import 'package:meals/app/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals = mockMeal.where(
      (meal) {
        return meal.categories!.contains(category.id);
      },
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title!),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return MealItem(
            meal: categoryMeals[index],
          );
        },
      ),
    );
  }
}
