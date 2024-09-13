import 'package:coffe_shop/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffe_shop/provider/cart_provider.dart';
import 'package:coffe_shop/screen/home_screen/components/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) => Column(
        children: [
          Text(
            'Cart',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context, index) {
                  CartModel cart = value.userCart[index];
                  return CartItem(cart: cart);
                }),
          )
        ],
      ),
    );
  }
}
