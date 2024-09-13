import 'package:coffe_shop/screen/utils/constants/colors.dart';
import 'package:coffe_shop/screen/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffe_shop/model/coffee_model.dart';
import 'package:coffe_shop/model/cart_model.dart';
import 'package:coffe_shop/provider/cart_provider.dart';

class CoffeeDetailScreen extends StatefulWidget {
  final CoffeeModel coffee;

  const CoffeeDetailScreen({super.key, required this.coffee});

  @override
  State<CoffeeDetailScreen> createState() => _CoffeeDetailScreenState();
}

class _CoffeeDetailScreenState extends State<CoffeeDetailScreen> {
  @override
  void initState() {
    super.initState();

    // Call resetQuantity when the widget is initialized
    Future.delayed(Duration.zero, () {
      if (mounted) {
        Provider.of<CartProvider>(context, listen: false).resetQuantity();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.coffee.name,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w600)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            // Coffee Image
            Image.asset(
              widget.coffee.imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
            const Spacer(),
            // Using Consumer to listen to changes in CartProvider
            Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                return Column(
                  children: [
                    Text(
                      'Q U A N T I T Y',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 10),
                    // Quantity selector with + and - buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: cartProvider.decrementQuantity,
                          icon: const Icon(Icons.remove),
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: HelperFunction.isDarkMode(context)
                                  ? AppColors.secondaryDark
                                  : AppColors.secondaryLight),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('${cartProvider.quantity}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontWeight: FontWeight.w900)),
                          ),
                        ),
                        IconButton(
                          onPressed: cartProvider.incrementQuantity,
                          icon: Icon(
                            Icons.add,
                            color: HelperFunction.isDarkMode(context)
                                ? AppColors.secondaryLight
                                : AppColors.dark,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'S I Z E',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 10),
                    // Size selection using chips
                    Wrap(
                      spacing: 10.0,
                      children: ['S', 'M', 'L'].map((size) {
                        bool isSelected = cartProvider.size == size;
                        return ChoiceChip(
                          side: BorderSide.none,
                          label: Text(
                            size,
                            style: HelperFunction.isDarkMode(context)
                                ? Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: isSelected
                                            ? AppColors.dark
                                            : AppColors.secondaryLight)
                                : Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: isSelected
                                            ? AppColors.secondaryLight
                                            : AppColors.dark),
                          ),
                          selected: isSelected,
                          onSelected: (isSelected) {
                            if (isSelected) {
                              cartProvider.setSize(size);
                            }
                          },
                          // Setting colors and styles
                          selectedColor: HelperFunction.isDarkMode(context)
                              ? AppColors.secondaryLight
                              : AppColors.dark, // Color when selected
                          backgroundColor: HelperFunction.isDarkMode(context)
                              ? AppColors.secondaryDark
                              : AppColors
                                  .secondaryLight, // Color when not selected
                          showCheckmark: false,
                        );
                      }).toList(),
                    ),
                  ],
                );
              },
            ),
            const Spacer(),
            // Add to Cart button wrapped in Consumer
            SizedBox(
              width: HelperFunction.screenWidth(context),
              child: Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  return ElevatedButton(
                    onPressed: () {
                      CartModel newCartItem = CartModel(
                        coffee: widget.coffee,
                        size: cartProvider.size,
                        quantity: cartProvider.quantity,
                      );

                      cartProvider.addItemToCart(newCartItem);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Added to cart!')),
                      );
                    },
                    child: const Text('Add to Cart'),
                  );
                },
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
