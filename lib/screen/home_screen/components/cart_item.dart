import 'package:coffe_shop/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffe_shop/provider/cart_provider.dart';
import 'package:coffe_shop/screen/utils/constants/colors.dart';
import 'package:coffe_shop/screen/utils/helpers/helper_function.dart';

class CartItem extends StatefulWidget {
  final CartModel cart;
  const CartItem({super.key, required this.cart});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void deleteItemFromCart(CartModel cart) {
    Provider.of<CartProvider>(context, listen: false).removeItemFromCart(cart);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
          color: HelperFunction.isDarkMode(context)
              ? AppColors.secondaryDark
              : AppColors.secondaryLight,
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Image.asset(widget.cart.coffee.imageUrl),
        title: Text(
          '${widget.cart.quantity}x ${widget.cart.coffee.name}',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '\$${widget.cart.totalPrice.toStringAsFixed(2)}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        trailing: IconButton(
            onPressed: () => deleteItemFromCart(widget.cart),
            icon: Icon(
              Icons.delete,
              color: HelperFunction.isDarkMode(context)
                  ? AppColors.light
                  : AppColors.dark,
            )),
      ),
    );
  }
}
