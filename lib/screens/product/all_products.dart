import 'package:flutter/material.dart';

import '../../models/product_model.dart';

class AllProducts extends StatelessWidget {
  final Product product;
  const AllProducts({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: MediaQuery.of(context).size.height / 1140,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (_, index) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        elevation: 2.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.imageUrl,
              width: double.maxFinite,
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.black),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.star,
                      size: 14,
                      color: Color(0xFFF99A35),
                    ),
                    label: const Text(
                      '(5.0) . 45 Reviews',
                      style: TextStyle(
                        color: Color(0xFF4B5563),
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${Product.products[0].price}',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.black),
                      ),
                      IconButton(
                        onPressed: () {
                          // productId = snapshot.data![index].id;
                          // setState(() {
                          //   _futureAddtoCartMenu =
                          //       createAddtoCartMenu(
                          //     productId.toString(),
                          //   );
                          // });
                          print('working');
                        },
                        icon: const Icon(
                          Icons.font_download,
                          size: 20,
                          color: Color(0xFFF99A35),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
