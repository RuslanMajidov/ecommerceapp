import 'package:ecommerceapp/widgets/cart_product_card.dart';
import 'package:flutter/material.dart';
import '../../models/cart_model.dart';
import '../../models/product_model.dart';
import '../../widgets/order_summary.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.redAccent,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFDCD4E1).withOpacity(0.08),
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {},
                child: Text('GO TO CHECKOUT',
                    style: Theme.of(context).textTheme.headline3!),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        Cart().freeDeliveryString,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.black),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,
                            shape: RoundedRectangleBorder(),
                            elevation: 0,
                          ),
                          child: Text(
                            'Add more items',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.black),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CartProductCard(
                    product: Product.products[2],
                  ),
                  OrderSummary(),
                  SizedBox(
                    height: 390,
                    child: ListView.builder(
                      itemCount: Cart().products.length,
                      itemBuilder: (context, index) {
                        return CartProductCard(
                          product: Product.products[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
