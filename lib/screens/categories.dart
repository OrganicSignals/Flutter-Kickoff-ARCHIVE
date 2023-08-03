import 'package:flutter/material.dart';
import 'package:udemytest/data/dummy_data.dart';
import 'package:udemytest/models/bag.dart';
import 'package:udemytest/models/categoey.dart';
import 'package:udemytest/screens/bags.dart';
import 'package:udemytest/screens/carousel.dart';
import 'package:udemytest/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key, required this.onToggleCart, required this.availableBags});
  final void Function(Bag bag) onToggleCart;
  final List<Bag> availableBags;

  void _selectCategory(BuildContext context, Category category) {
    final filteredBags = availableBags
        .where((bags) => bags.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BagsScreen(
              title: category.name,
              bags: filteredBags,
              onToggleCart: onToggleCart,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 240, // constrain height
            child: Carousel(),
          ),
          Text(
            'Categories',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Flexible(
              child: GridView(
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
            ),
            children: [
              for (final category in availableCategories)
                CategoryGridItem(
                  category: category,
                  onSelectCategory: (() {
                    _selectCategory(context, category);
                    Image.asset(category.catImage);
                  }),
                ),
              // Image.network(availableBags[0].imageUrl),
              // Text(availableBags.length.toString()),
            ],
          ))
        ],
      ),
    );
  }
}
