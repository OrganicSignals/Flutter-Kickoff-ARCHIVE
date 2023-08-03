import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:udemytest/providers/cart_provider_test.dart';
import 'package:udemytest/screens/splashScreen.dart';
//import 'package:udemytest/screens/tabs.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    //brightness: Brightness.dark,
    seedColor: Colors.blue,
  ),
  //textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: splashScreen(title: 'Swadeshi Brands'));
    //TabScreen());
  }
}
