import 'package:flutter/material.dart';
import 'package:udemytest/main.dart';
import 'package:udemytest/models/bag.dart';
import 'package:udemytest/screens/bags.dart';
import 'package:udemytest/screens/categories.dart';
import 'package:udemytest/screens/tabs.dart';
import 'package:udemytest/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    this.currentFilters,
  });

  final currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

enum Filter {
  CottonFabric,
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _cottonBagFilterSet = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cottonBagFilterSet = widget.currentFilters[Filter.CottonFabric]!;
  }

  late List<Bag> bags;
  late void Function(Bag bag) onToggleCart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: MainDrawer(
        onSelectScreen: (identifier) {
          Navigator.of(context).pop();
          if (identifier == 'Categories') {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => TabScreen()),
              ),
            );
          }

          if (identifier == 'Bags') {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    BagsScreen(bags: bags, onToggleCart: onToggleCart)));
          }
        },
      ),
      body: WillPopScope(
        onWillPop: (() async {
          Navigator.of(context).pop({
            Filter.CottonFabric: _cottonBagFilterSet,
          });
          return false;
        }),
        child: Column(
          children: [
            SwitchListTile(
              value: _cottonBagFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _cottonBagFilterSet = isChecked;
                });
              },
              title: Text(
                'Cotton fabric',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only cotton fabric bags',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            )
          ],
        ),
      ),
    );
  }
}
