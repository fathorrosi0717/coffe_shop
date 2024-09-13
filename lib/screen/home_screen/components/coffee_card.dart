import 'package:flutter/material.dart';
import 'package:coffe_shop/model/coffee_model.dart';
import 'package:coffe_shop/screen/utils/constants/colors.dart';
import 'package:coffe_shop/screen/utils/helpers/helper_function.dart';
import 'package:go_router/go_router.dart';

class CoffeeCard extends StatelessWidget {
  final CoffeeModel coffee;

  const CoffeeCard({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
      child: GestureDetector(
        onTap: () => context.push('/coffeeDetail', extra: coffee),
        child: Container(
            // Width for each item card
            height: 110, // Height for each item card
            decoration: BoxDecoration(
              color: HelperFunction.isDarkMode(context)
                  ? AppColors.secondaryDark
                  : AppColors.secondaryLight,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Align(
              alignment: Alignment.center,
              child: ListTile(
                leading: Image.asset(coffee.imageUrl),
                title: Text(
                  coffee.name,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                subtitle: Text(
                  '\$${coffee.price.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: HelperFunction.isDarkMode(context)
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                      ),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: HelperFunction.isDarkMode(context)
                      ? AppColors.light
                      : AppColors.dark,
                ),
              ),
            )),
      ),
    );
  }
}
