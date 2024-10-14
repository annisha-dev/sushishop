import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushishop/models/food.dart';
import 'package:sushishop/models/shop.dart';
import 'package:sushishop/themes/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text("My Cart"),
          backgroundColor: primaryColor,
        ),
        body: ListView.builder(
          itemCount: value.cart.length,
          itemBuilder: (context, index) {
            // Get the food item from the cart
            final Food food = value.cart[index];

            // Get food name
            final String foodName = food.name;

            // Get food price directly as a double
            final String foodPrice = food.price;

            // Return ListTile to display the food name and price
            return ListTile(
              title: Text(foodName),
              subtitle: Text(foodPrice),
            );
          },
        ),
      ),
    );
  }
}
