import 'package:ecommerceapp/models/category_models.dart';
import 'package:ecommerceapp/screens/home/home_screen.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Catalog',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.9,
              crossAxisSpacing: 8,
              mainAxisSpacing: 25),
          itemCount: categoryProducts.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ProductCard(
                  product: categoryProducts[index],
                  widthFactor: 1.1,
                ),
              ),
            );
          }),
    );
  }
}
