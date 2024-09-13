import 'package:coffe_shop/screen/home_screen/components/coffee_list.dart';
import 'package:flutter/material.dart';
import 'package:coffe_shop/model/cart_model.dart';
import 'package:coffe_shop/model/coffee_model.dart';

class CartProvider extends ChangeNotifier {
  int quantity = 1; // Initial quantity set to 1
  String size = 'M'; // Default size

  List<CartModel> userCart = [];

  // Reset quantity when a new coffee is selected
  void resetQuantity() {
    quantity = 0;
    notifyListeners();
  }

  // Get list of available coffee
  List<CoffeeModel> getCoffeeList() => coffeesList;

  // Get the user's cart
  List<CartModel> getUserCart() => userCart;

  // Add item to cart or update quantity if already exists
  void addItemToCart(CartModel cart) {
    int index = userCart.indexWhere((element) =>
        element.coffee == cart.coffee && element.size == cart.size);
    if (index != -1) {
      // Update quantity if item already exists in cart
      userCart[index] = userCart[index]
          .copyWith(quantity: userCart[index].quantity + cart.quantity);
    } else {
      // Add new item to cart
      userCart.add(cart);
    }
    notifyListeners();
  }

  // Remove item from cart
  void removeItemFromCart(CartModel cart) {
    userCart.removeWhere(
        (item) => item.coffee == cart.coffee && item.size == cart.size);
    notifyListeners();
  }

  // Update quantity of a specific item in the cart
  void updateItemQuantity(CartModel cart, int newQuantity) {
    int index = userCart.indexWhere((element) =>
        element.coffee == cart.coffee && element.size == cart.size);
    if (index != -1 && newQuantity > 0) {
      userCart[index] = userCart[index].copyWith(quantity: newQuantity);
      notifyListeners();
    }
  }

  // Get total price of the cart
  double getTotalPrice() {
    return userCart.fold(0, (sum, item) => sum + item.totalPrice);
  }

  // Increment and decrement quantity methods
  void incrementQuantity() {
    quantity++;
    notifyListeners();
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
      notifyListeners();
    }
  }

  // Set coffee size
  void setSize(String selectedSize) {
    size = selectedSize;
    notifyListeners();
  }
}
