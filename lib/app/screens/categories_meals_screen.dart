import 'package:flutter/material.dart';
import 'package:meals/app/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final Category? category;

  const CategoriesMealsScreen({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category!.title!),
      ),
      body: const Center(
        child: Text('Receitas por categoria'),
      ),
    );
  }
}
