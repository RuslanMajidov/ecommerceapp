 import 'package:ecommerceapp/widgets/custom_appbar.dart';
import 'package:ecommerceapp/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
   static const String routeName ='/cart';
   static Route route() {
     return MaterialPageRoute(
       settings: RouteSettings(name: routeName),
       builder: (_)=> CartScreen(),
     );
   }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
         appBar: CustomAppBar(title: 'Cart',),
         bottomNavigationBar: CustomNavBar(),
       );
   }

 }
