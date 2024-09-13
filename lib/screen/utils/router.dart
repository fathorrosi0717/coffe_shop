import 'package:coffe_shop/model/coffee_model.dart';
import 'package:go_router/go_router.dart';
import 'package:coffe_shop/screen/home_screen/home_screen.dart';
import 'package:coffe_shop/screen/intro_screen/intro_screen.dart';
import 'package:coffe_shop/screen/coffee_detail_screen/coffee_detail_screen.dart';

GoRouter buildRouter() {
  return GoRouter(initialLocation: '/', routes: [
    GoRoute(
      name: 'introScreen',
      path: '/',
      builder: (context, state) => const IntroScreen(),
    ),
    GoRoute(
      name: 'homeScreen',
      path: '/homeScreen',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: 'coffeeDetailScreen',
      path: '/coffeeDetail',
      builder: (context, state) {
        CoffeeModel coffee = state.extra as CoffeeModel;
        return CoffeeDetailScreen(coffee: coffee);
      },
    ),
  ]);
}

final router = buildRouter();
