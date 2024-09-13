import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffe_shop/provider/cart_provider.dart';
import 'package:coffe_shop/screen/home_screen/components/coffee_card.dart';
import 'package:coffe_shop/screen/utils/constants/colors.dart';
import 'package:coffe_shop/screen/utils/helpers/helper_function.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({
    super.key,
  });

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                    color: HelperFunction.isDarkMode(context)
                        ? AppColors.secondaryDark
                        : AppColors.secondaryLight,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        style: Theme.of(context).textTheme.bodyLarge,
                        decoration: const InputDecoration(hintText: 'Search'),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: HelperFunction.isDarkMode(context)
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Center(
                child: Text(
                    'Every sip tells a story... some are bolder than\nothers.',
                    textAlign: TextAlign.center,
                    style: HelperFunction.isDarkMode(context)
                        ? Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: AppColors.darkTextSecondary)
                        : Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: AppColors.lightTextSecondary)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'How do you like your coffe?',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            const SizedBox(height: 21),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection:
                  Axis.vertical, // Set scroll direction to horizontal
              itemCount: value.getCoffeeList().length,
              itemBuilder: (context, index) {
                final coffee = value.getCoffeeList()[index];
                return CoffeeCard(coffee: coffee);
              },
            ),
          ],
        ),
      ),
    );
  }
}
