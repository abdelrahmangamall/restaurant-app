import 'package:flutter/material.dart';
import 'package:restaurant_mobile_app/models/menu_item.dart';

class CartProvider with ChangeNotifier {
  final List<MenuItem> _items = [];

  List<MenuItem> get items => _items;

  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.price);
  }

  void addToCart(MenuItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeFromCart(MenuItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}