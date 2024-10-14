import 'package:flutter/material.dart';
import 'package:sushishop/models/food.dart';

class Shop extends ChangeNotifier{
   // Food menu list
   final List<Food> _foodMenu = [
    // Nigiri
    Food(
      name: "Nigiri",
      price: "21.00",
      imagepath: 'lib/images/nigiri.png',
      rating: "4.9",
    ),
    // Ikura sushi
    Food(
      name: "Ikura sushi",
      price: "29.00",
      imagepath: 'lib/images/ikura-sushi.png',
      rating: "4.7",
    ),
  ];

//customer's cart
  List<Food> _cart = [];

  //getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  //add to cart
  void addToCart(Food FoodItem,int quantity){
    for (int i=0; i<quantity; i++) {
      _cart.add(FoodItem);
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart (Food food){
    _cart.remove(food);
    notifyListeners();
  }

}