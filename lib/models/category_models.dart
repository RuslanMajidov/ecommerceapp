import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });
  @override
  List<Object?> get props => [
   name, imageUrl
    ];

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category = Category(name: snap['name'],
        imageUrl:snap['imageUrl']);
    return category;
  }

  static List<Category> categories = [
    Category(
      name: "Hand Bags",
      imageUrl:
         'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/41e45047-a899-4c21-bc2a-20c5a9eb966a/air-max-270-womens-shoes-Pgb94t.png',
             ),
    Category(
      name: "Shoes",
      imageUrl:
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    ),
    Category(
      name: "Ornaments",
      imageUrl:
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    ),
    Category(
      name: "Goggles",
      imageUrl:
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    )
  ];
}
