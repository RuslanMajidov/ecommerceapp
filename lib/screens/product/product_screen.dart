import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '/models/models.dart';
import '/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => ProductScreen(product: product),
    );
  }

  final Product product;
  const ProductScreen({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(
              width: 140,
            ),
            Text(
              "4.5",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const Icon(
              Icons.star,
              color: Colors.orange,
            ),
          ],
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  )),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {},
                child: Text('ADD TO CART',
                    style: Theme.of(context).textTheme.headline3!),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          HeroCarouselCard(
            product: product,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      width: MediaQuery.of(context).size.width - 10,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              product.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              '\$${product.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  initiallyExpanded: true,
                  title: Text(
                    "Product Information",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Brand: Fila\nLight weight\nGender: Women\nCasual Wear\nComfortable\nMaterial: Elastic Fibre+Micro Fibres+PU+Phylon',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Delivery Information",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Home Delivery 2-4 Days\nCash on Delivery Available',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
