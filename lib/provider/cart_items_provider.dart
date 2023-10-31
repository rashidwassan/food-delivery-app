import 'package:flutter/material.dart';
import 'package:sayfood/models/food.dart';

class CartItemsProvider extends ChangeNotifier {
  List<Food> cartItems = [];
  double totalPrice = 0.0;
  double discountPrice = 0.0;

  void addToCart(Food food) {
    cartItems.add(food);
    totalPrice += food.previousPrice;
    discountPrice += food.price;
    notifyListeners();
  }

  void removeFromCart(Food food) {
    cartItems.remove(food);
    totalPrice -= food.previousPrice;
    discountPrice -= food.price;
    notifyListeners();
  }

  void clearCart() {
    cartItems.clear();
    totalPrice = 0.0;
    discountPrice = 0.0;
    notifyListeners();
  }
}
