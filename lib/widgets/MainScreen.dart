// ignore_for_file: file_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerceapp/screens/checkout/checkout_screen.dart';
import 'package:ecommerceapp/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../screens/cart/cart_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/wishlist/wishlist_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  final screens = [
    HomeScreen(),
    WishListSCreen(),
    CartScreen(),
    CheckoutScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // return BottomAppBar(
    //   color: Colors.redAccent,
    //   child: Container(
    //     height: 60,
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         IconButton(
    //           icon: Icon(
    //             Icons.home,
    //             color: Colors.white,
    //           ),
    //           onPressed: () {
    //             Navigator.pushNamed(context, '/');
    //           },
    //         ),
    //         IconButton(
    //           icon: const Icon(
    //             Icons.favorite,
    //             color: Colors.white,
    //           ),
    //           onPressed: () {
    //             Navigator.pushNamed(context, '/wishlist');
    //           },
    //         ),
    //         IconButton(
    //           icon: Icon(
    //             Icons.shopping_cart,
    //             color: Colors.white,
    //           ),
    //           onPressed: () {
    //             Navigator.pushNamed(context, '/cart');
    //           },
    //         ),
    //         IconButton(
    //           icon: Icon(
    //             Icons.check_circle_outlined,
    //             color: Colors.white,
    //           ),
    //           onPressed: () {
    //             Navigator.pushNamed(context, '/checkout');
    //           },
    //         ),
    //         IconButton(
    //           icon: Icon(
    //             Icons.person,
    //             color: Colors.white,
    //           ),
    //           onPressed: () {
    //             Navigator.pushNamed(context, '/profile');
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    final items = <Widget>[
      Icon(
        Icons.home,
        size: 30,
        color: Colors.white,
      ),
      Icon(
        Icons.favorite,
        size: 30,
        color: Colors.white,
      ),
      Icon(
        Icons.shopping_cart_outlined,
        size: 30,
        color: Colors.white,
      ),
      Icon(
        Icons.check_circle_outlined,
        size: 30,
        color: Colors.white,
      ),
      Icon(
        Icons.person,
        size: 30,
        color: Colors.white,
      ),
    ];
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey,
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.redAccent,
        buttonBackgroundColor: Colors.purple,
        backgroundColor: Colors.transparent,
        items: items,
        index: index,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 200),
        height: 60,
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}
