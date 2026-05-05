import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urbanharmony/Models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _favorites = [];
  List<Product> get cart => _favorites;

  void toggleFavorite(Product product) {
    if (_favorites.contains(product)) {
      for (Product element in _favorites) {
        element.quantity++;
      }
    } else {
      _favorites.add(product);
    }
    notifyListeners();
  }

  void incrementQtn(int index) {
    _favorites[index].quantity++;
    notifyListeners(); // Ensure UI updates
  }

  void decrementQtn(int index) {
    if (_favorites[index].quantity > 0) {
      _favorites[index].quantity--;
      notifyListeners(); // Ensure UI updates
    }
  }

  double totalPrice() {
    double total1 = 0.0;
    for (Product element in _favorites) {
      total1 += element.price * element.quantity;
    }
    return total1;
  }

  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
