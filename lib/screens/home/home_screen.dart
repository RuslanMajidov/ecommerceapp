// ignore_for_file: avoid_print

import 'dart:async';

import 'package:ecommerceapp/screens/authentication/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/category_models.dart';
import '../../models/product_model.dart';
import '/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email = "";
  late String finalEmail;

  // Future getEmail() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     email = preferences.getString('email')!;
  //   });
  // }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail!;
    });
    print(finalEmail);
  }

  // Future logout(BuildContext context) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.remove('email');
  //   Fluttertoast.showToast(msg: "Logout Successful");
  //   Navigator.of(context)
  //       .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => HomeScreen(),
  //     ),
  //   );
  // }

  @override
  // void initState() {
  //   getValidationData().whenComplete(() async {
  //     Timer(Duration(seconds: 2),
  //         () => Get.to(finalEmail == null ? LoginScreen() : HomeScreen()));
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Welcome',
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                autoPlay: true,
              ),
              items: Category.categories
                  .map((category) => HeroCarouselCard(category: category))
                  .toList(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Products',
                    style: const TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'See All',
                        style: const TextStyle(
                          fontSize: 22.0,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/all_products');
                          }),
                  ),
                ],
              ),
            ),
            // ProductCard(product: Product.products[0],)

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductCarousel(products: Product.products),
            ),
          ],
        ),
      ),
    );
  }
}
