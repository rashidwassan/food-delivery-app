import 'package:flutter/material.dart';
import 'package:sayfood/models/food.dart';

class CardItemsProvider extends ChangeNotifier {
  List<Food> cardItems = [];
  double totalPrice = 0.0;

  void addToCard(Food food) {
    cardItems.add(food);
    totalPrice += food.price;
    notifyListeners();
  }

  void removeFromCard(Food food) {
    cardItems.remove(food);
    totalPrice -= food.price;
    notifyListeners();
  }

  void clearCard() {
    cardItems.clear();
    totalPrice = 0.0;
    notifyListeners();
  }
}
