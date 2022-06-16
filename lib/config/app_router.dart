// ignore_for_file: avoid_print

import 'package:ecommerceapp/screens/profile/EditProfile.dart';
import 'package:flutter/material.dart';
import '/models/models.dart';
import '/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Route: ${settings.name}');
    switch (settings.name) {
      case '/':
        return HomeScreen.route();

      case CartScreen.routeName:
        return CartScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case AllProducts.routeName:
        return AllProducts.route(product: settings.arguments as Product);
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case WishListSCreen.routeName:
        return WishListSCreen.route();
      case ProfileScreen.routeName:
        return ProfileScreen.route();
      // case ProfileView.routeName:
      //   return ProfileView.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
