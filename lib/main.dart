import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushishop/models/shop.dart';
import 'package:sushishop/pages/cart.dart';
import 'package:sushishop/pages/intro_page.dart';
import 'package:sushishop/pages/menu_page.dart'; // Ensure you import the MenuPage

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Shop(),
    child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),  // Ensure consistency with the const keyword
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/menupage': (context) => const MenuPage(),
        '/cartPage': (context) => const CartPage(),
      },
    );
  }
}

