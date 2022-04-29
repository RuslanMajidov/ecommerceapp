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
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.9,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: ProductCard(
                product: products[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
