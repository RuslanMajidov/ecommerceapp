import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.favorite,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/wishlist');
              },
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/user');
              },
            )
          ],
        ),
      ),
    );
  }
}
