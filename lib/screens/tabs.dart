import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:udemytest/data/dummy_data.dart';
import 'package:udemytest/models/bag.dart';
import 'package:udemytest/providers/bags_provider.dart';
import 'package:udemytest/providers/cart_provider.dart';
import 'package:udemytest/screens/all_product.dart';
import 'package:udemytest/screens/bags.dart';
import 'package:udemytest/screens/cart_screen.dart';
import 'package:udemytest/screens/categories.dart';
import 'package:udemytest/screens/filters.dart';
import 'package:udemytest/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.CottonFabric: false,
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectePageIndex = 0;

  final List<Bag> _cartBag = [];

  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _showMassage(String msg) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void _toggleBagCartStatus(Bag bag) {
    final isExisting = _cartBag.contains(bag);
    if (isExisting == true) {
      setState(() {
        _cartBag.remove(bag);
      });
      _showMassage('Bag is no longer in cart');
    } else {
      setState(() {
        _cartBag.add(bag);
      });
      _showMassage('Bag is added to cart');
    }
  }

  void _selectPage(index) {
    setState(() {
      _selectePageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(
            currentFilters: _selectedFilters,
          ),
        ),
      );

      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Bag bag;
    final bags = ref.watch(bagsProvider);
    final availableBags = bags.where((bag) {
      if (_selectedFilters[Filter.CottonFabric]! && !bag.isCottonFabric) {
        return false;
      }

      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      onToggleCart: _toggleBagCartStatus,
      availableBags: availableBags,
    );
    //var activePageTitle = 'Categories';
    var activePageTitle = 'Swadeshi Brands';
    if (_selectePageIndex == 1) {
      final cartBags = ref.watch(cartBagProvider);
      activePage = BagsScreen(
        bags: _cartBag,
        onToggleCart: _toggleBagCartStatus,
      );
      activePageTitle = 'Cart';
    }
    if (_selectePageIndex == 2) {
      activePage =
          BagsScreen(bags: _cartBag, onToggleCart: _toggleBagCartStatus);
      activePageTitle = 'My Accout';
    }
    // if (_selectePageIndex == 3) {
    //   activePage = AllProductsStateless(
    //     bag: bag,
    //   );
    //   activePageTitle = 'Search';
    // }
    if (_selectePageIndex == 3) {
      activePage = AllProductScreen(
        onToggleCart: (Bag bag) {},
      );
      activePageTitle = 'All Products';
    }

    if (_selectePageIndex == 4) {
      activePage = CartScreen();
      activePageTitle = 'cart Product';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          activePageTitle,
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(0, 136, 204, 5),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectePageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal),
              label: 'shop',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'profile',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Colors.blue)
        ],
      ),
    );
  }
}
