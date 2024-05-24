import 'package:flutter/material.dart';
import 'package:project06/data/dummy_data.dart';
import 'package:project06/model/category.dart';
import 'package:project06/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          // ignore: non_constant_identifier_names
          for (final Category in availableCategories)
            CategoryGridItem(category: Category)
        ],
      ),
    );
  }
}
