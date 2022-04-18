import 'package:ecommerceapp/repositories/category/category_repository.dart';

import 'package:ecommerceapp/repositories/product/product_repository.dart';
import 'package:ecommerceapp/screens/home/home_screen.dart';
import 'package:ecommerceapp/screens/profile/profile_screen.dart';
import 'package:ecommerceapp/screens/splash/splash_screen.dart';
import 'package:ecommerceapp/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'blocs/wishlist/wishlist_bloc.dart';
import 'blocs/wishlist/wishlist_event.dart';
import '/config/theme.dart';
import '/config/app_router.dart';

import 'blocs/category/category_bloc.dart';
import 'blocs/category/category_event.dart';
import 'blocs/product/product_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BlocOverrides.runZoned(
    () {
      runApp(MyApp());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Womens Shopping',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => WishListBloc()..add(StartWishList()),
          ),
          BlocProvider(
            create: (_) => CategoryBloc(
              categoryRepository: CategoryRepository(),
            )..add(LoadCategories()),
          ),
          BlocProvider(
            create: (_) => ProductBloc(
              productRepository: ProductRepository(),
            )..add(LoadProducts()),
          ),
        ],
        child: GetMaterialApp(
          title: 'Online Shopping',
          debugShowCheckedModeBanner: false,
          theme: theme(),
          home: HomeScreen(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: HomeScreen.routeName,
        ),
      ),
    );
  }
}
