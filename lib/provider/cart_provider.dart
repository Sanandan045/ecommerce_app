import 'package:flutter/material.dart';
import 'package:dukaan/models/cart_model.dart';
import 'package:dukaan/models/product_model.dart';
import 'package:collection/collection.dart';

class CartProvider extends ChangeNotifier {
  final List<CartModel> _shoppingCart = [];

  void addToCart(ProductModel product) {
    var existingItem = _shoppingCart
        .firstWhereOrNull((element) => element.product.id == product.id);
    if (existingItem == null) {
      _shoppingCart.add(CartModel(
        product: product,
        quantity: 1,
      ));
    } else {
      existingItem.quantity += 1;
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _shoppingCart.removeWhere((element) => element.product.id == productId);
    notifyListeners();
  }

  void incrementQty(String productId) {
    var item = _shoppingCart
        .firstWhereOrNull((element) => element.product.id == productId);
    if (item != null) {
      item.quantity++;
      notifyListeners();
    }
  }

  void decrementQty(String productId) {
    var item = _shoppingCart
        .firstWhereOrNull((element) => element.product.id == productId);
    if (item != null) {
      if (item.quantity > 1) {
        item.quantity--;
      } else {
        _shoppingCart.remove(item);
      }
      notifyListeners();
    }
  }

  double getCartTotal() {
    return _shoppingCart.fold(
        0.0,
        (total, cartItem) =>
            total + (cartItem.product.price * cartItem.quantity));
  }

  List<CartModel> get shoppingCart => List.unmodifiable(_shoppingCart);
  double get cartSubTotal => getCartTotal();
  double get shippingCharge => 120;
  double get cartTotal => cartSubTotal + shippingCharge;
}
