import 'package:ecommerceapp/widgets/product_card.dart';
import 'package:flutter/cupertino.dart';

import '../models/product_model.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0.0),
            child: ProductCard(
              product: products[index],
            ),
          );
        },
      ),
    );
  }
}
