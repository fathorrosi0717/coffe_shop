import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:coffe_shop/screen/utils/constants/colors.dart';
import 'package:coffe_shop/screen/utils/helpers/helper_function.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 48,
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: SvgPicture.asset(
                'assets/images/appLogo.svg',
                colorFilter: ColorFilter.mode(
                    HelperFunction.isDarkMode(context)
                        ? AppColors.light
                        : AppColors.dark,
                    BlendMode.srcIn),
                height: 177,
              ),
            ),
            const SizedBox(
              height: 38,
            ),
            Text(
              'Brew Day',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'How do you like your coffe?',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: HelperFunction.isDarkMode(context)
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 58,
            ),
            SizedBox(
              width: HelperFunction.screenWidth(context),
              child: ElevatedButton(
                  onPressed: () => context.pushReplacement('/homeScreen'),
                  child: const Text('Enter Shop')),
            )
          ],
        ),
      ),
    );
  }
}
