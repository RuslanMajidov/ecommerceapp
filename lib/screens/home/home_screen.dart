import 'package:flutter/material.dart';
import '../../models/product_model.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_navbar.dart';

import '../../widgets/product_carousel.dart';
import '../../widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const HomeScreen());
  }

  const HomeScreen({Key? key}) : super(key: key);

  get icon => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Womens Accessories'),
      bottomNavigationBar: CustomNavBar(),
      body: Column(
        children: [
          SectionTitle(title: 'ProductList'),
          ProductCarousel(
            products: Product.products
                .where((product) => product.ProductList)
                .toList(),
          ),
        ],
      ),
    );
  }
}
