import 'package:ecommerceapp/models/category_models.dart';
import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_navbar.dart';
import '../../widgets/product_card.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CatalogScreen(category: category),
    );
  }

  final Category category;
  const CatalogScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: CustomNavBar(),
      body: GridView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 08.0,
            vertical: 20.0,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1),
          itemCount: categoryProducts.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: ProductCard(
                product: categoryProducts[index],
                widthFactor: 2.2,
              ),
            );
          }),
    );
  }
}
