import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../blocs/category/category_bloc.dart';
import '../../blocs/category/category_state.dart';
import '../../blocs/product/product_bloc.dart';
import '../../models/category_models.dart';
import '../../models/product_model.dart';
import '/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Online Shopping',
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomNavBar(),
      body: Column(
        children: [
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: Category.categories
                  .map((category) => HeroCarouselCard(category: category))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Products',
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: 'See All',
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/all_products');
                        }),
                ),
              ],
            ),
          ),
          // ProductCard(product: Product.products[0],)

          ProductCarousel(products: Product.products),
        ],
      ),
    );
  }
}
