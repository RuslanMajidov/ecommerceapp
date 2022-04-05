import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerceapp/blocs/wishlist/wishlist_event.dart';
import 'package:ecommerceapp/blocs/wishlist/wishlist_state.dart';
import 'package:ecommerceapp/widgets/hero_carousel_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/product_model.dart';
import '../../widgets/custom_appbar.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';
  static Route route({required Product product}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => ProductScreen(product: product),
    );
  }
  final Product product;
  const ProductScreen ({required this.product});

  @override
  Widget build(BuildContext context) {
    var category;
    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            IconButton(
                icon: Icon(Icons.share, color: Colors.white),
                onPressed: () {}),
              BlocBuilder<WishListBloc, WishListState>(
                builder: (context, state) {
                  return IconButton(
                      icon: Icon(Icons.favorite, color: Colors.white),
                      onPressed: () {
                        context.read<WishListBloc>()
                            .add(AddWishListProduct(product));

                        final snackBar = SnackBar(content: Text('Added to your wishlist'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                }
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: (){}, child: Text('Add To Cart',
                style: Theme.of(context).textTheme.headline3!),
              ),
          ],
          ),
        ),
      ),
      body:
      ListView(
        children: [
      CarouselSlider(
      options: CarouselOptions(
      aspectRatio: 1.5,
        viewportFraction: 0.9,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        enlargeCenterPage: true,
      ),
      items:[
        HeroCarouselCard(
          product: product, category: category,
        )
      ],
    ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                height: 60,
                  alignment: Alignment.bottomCenter,
                  color: Colors.black.withAlpha(50),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text(
                        product.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),),
                      Text
                        ('${product.price}'
                        , style: Theme.of(context)
                            .textTheme.headline5!
                            .copyWith(color: Colors.white),),
                    ],),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
                initiallyExpanded: true,
                title: Text('Product Information', style: Theme.of(context).textTheme.headline3),
                children: [
                  ListTile(title: Text('Online shopping is a form of electronic commerce which allows consumers to directly buy goods or services from a seller over the Internet using a web browser or a mobile app. ',
                  style: Theme.of(context).textTheme.bodyText1,
                  ),
                  )
                ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              title: Text('Delivery Information',
                  style: Theme.of(context).textTheme.headline3),
              children: [
                ListTile(title: Text('Online shopping is a form of electronic commerce which allows consumers to directly buy goods or services from a seller over the Internet using a web browser or a mobile app. ',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                )
              ],
            ),
          )
      ]
      ),
      );
  }
}