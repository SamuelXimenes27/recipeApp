import 'package:flutter/material.dart';
import 'package:meals/app/components/category_item.dart';
import 'package:meals/app/data/mock_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Recipe App')),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: mockData.map((cat) {
          return CategoryItem(
            category: cat,
          );
        }).toList(),
      ),
    );
  }
}
