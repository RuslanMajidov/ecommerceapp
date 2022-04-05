import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable{
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool ProductList;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.ProductList,

});
  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product= Product(
        name: snap['name'],
        category: snap['category'],
        imageUrl: snap['imageUrl'],
        price: snap['price'],
        ProductList: snap['ProductList'],);
    return product;
  }

  @override
  List<Object?> get props => [
    name,
    category,
    imageUrl,
    price,
    ProductList
  ];
  static List<Product> products =[
    Product(
      name: "Hand Bags",
      category: 'Hand Bags',
      imageUrl:
          'https://m.media-amazon.com/images/I/41v36IBHnUL.jpg',
    price: 200,
      ProductList: true,
    ),
    Product(
      name: "Shoes",
      category: 'Shoes',
      imageUrl:
          'https://i.pinimg.com/236x/7e/f3/71/7ef371219a35f55cbbcc5d5f40b77ea9.jpg',
      price: 200,
      ProductList: true,
    ),
    Product(
      name: "Ornaments",
      category: 'Ornaments',
      imageUrl:
          'data:image/jpeg;base64,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',
      price: 200,
      ProductList: true,
    ),
    Product(
      name: "Goggles",
      category: 'Goggles',
      imageUrl:
          'https://images-eu.ssl-images-amazon.com/images/I/71I0VTA11mL._AC._SR360,460.jpg',
      price: 200,
      ProductList: true,
    ),
  ];

}