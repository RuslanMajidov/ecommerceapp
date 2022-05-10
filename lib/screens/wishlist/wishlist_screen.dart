import 'package:ecommerceapp/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerceapp/blocs/wishlist/wishlist_state.dart';
import 'package:ecommerceapp/models/models.dart';
import 'package:ecommerceapp/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_navbar.dart';
import '../../widgets/product_card.dart';

class WishListSCreen extends StatelessWidget {
  static const String routeName = '/wishlist';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => WishListSCreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'WishList',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.redAccent,
        ),
        body: BlocBuilder<WishListBloc, WishListState>(
          builder: (context, state) {
            if (state is WishListLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is WishListLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 16.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: state.wishList.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                      child: ProductCard(
                        product: state.wishList.products[index],
                        widthFactor: 1.1,
                        leftPosition: 100,
                        isWishList: true,
                      ),
                    );
                  },
                ),
              );
            } else {
              return Text('Something went wrong!');
            }
          },
        ));
  }
}
