import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';
import '../utils/routes.dart';

class CategoryItem extends StatelessWidget {
  final Category? category;

  const CategoryItem({
    super.key,
    this.category,
  });

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      RoutesConst.categoriesMeals,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          image: category!.imageUrl! != ''
              ? DecorationImage(
                  image: CachedNetworkImageProvider(
                    category!.imageUrl!,
                  ),
                  fit: BoxFit.cover,
                )
              : null,
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
      ),
    );
  }
}
