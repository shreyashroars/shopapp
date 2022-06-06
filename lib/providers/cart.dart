import 'package:flutter/cupertino.dart';

class CartItem {
  String id;
  String title;
  int quantity;
  double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemlength {
    return _items.length;
  }

  double get totalAmt {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void additems(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingproduct) => CartItem(
              id: existingproduct.id,
              title: existingproduct.title,
              quantity: existingproduct.quantity + 1,
              price: existingproduct.price));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              price: price));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
}
