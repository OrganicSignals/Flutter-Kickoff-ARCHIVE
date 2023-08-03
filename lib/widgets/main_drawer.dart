import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: Row(
              children: const [
                Icon(
                  Icons.menu_book,
                  size: 48,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  'Menu',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ],
            )),
        ListTile(
          leading: Icon(
            Icons.house_outlined,
            size: 30,
          ),
          title: const Text(
            'Home',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          onTap: () {
            //Navigator.of(context).push(route)
            onSelectScreen('Categories');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.shopping_bag_outlined,
            size: 30,
          ),
          title: const Text(
            'Shop',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          onTap: () {
            onSelectScreen('Bags');
          },
        ),
        // ListTile(
        //   leading: Icon(
        //     Icons.settings,
        //     size: 30,
        //   ),
        //   title: const Text(
        //     'Filter',
        //     style: TextStyle(
        //         fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        //   ),
        //   onTap: () {
        //     onSelectScreen('filters');
        //   },
        // ),
      ]),
    );
  }
}
