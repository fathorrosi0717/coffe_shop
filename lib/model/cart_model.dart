import 'package:coffe_shop/model/coffee_model.dart';

class CartModel {
  final CoffeeModel coffee;
  final String size;
  final int quantity;

  // Constructor with validation
  CartModel({
    required this.coffee,
    required this.size,
    required int quantity,
  }) : quantity = quantity > 0 ? quantity : 1; // Ensure quantity is at least 1

  // Dynamic total price getter
  double get totalPrice => coffee.price * quantity;

  // Method to copy CartModel with modified values
  CartModel copyWith({
    CoffeeModel? coffee,
    String? size,
    int? quantity,
  }) {
    return CartModel(
      coffee: coffee ?? this.coffee,
      size: size ?? this.size,
      quantity: quantity ?? this.quantity,
    );
  }
}
