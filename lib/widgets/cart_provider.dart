import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  /// storing data in cart variable ,
  final List<Map<String, dynamic>> cart = [];

  /// list for data storing

  void addProduct(Map<String, dynamic> item) {
    /// adding cart to items
    cart.add(item);

    /// adding in cart variable

    notifyListeners();

    /// this is notify for asking some changes occur, menas showing data to another screen
  }

  void removeProduct(Map<String, dynamic> removeItem) {
    cart.remove(removeItem);
    notifyListeners();
  }
}
