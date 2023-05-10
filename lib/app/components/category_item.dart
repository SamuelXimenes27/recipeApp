import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category? category;

  const CategoryItem({
    super.key,
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: [
          category!.color!.withOpacity(0.5),
          category!.color!,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Center(
        child: Text(
          category!.title!,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
