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
  List<Object?> get props => [name, imageUrl];

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category =
        Category(name: snap['name'], imageUrl: snap['imageUrl']);
    return category;
  }

  static List<Category> categories = [
    Category(
      name: "Shoes",
      imageUrl:
          'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c25lYWtlcnN8ZW58MHx8MHx8&w=1000&q=80',
    ),
    Category(
      name: "Hand Bags",
      imageUrl: 'https://data.whicdn.com/images/344008933/original.jpg',
    ),
    Category(
      name: "Ornaments",
      imageUrl:
          'https://i.pinimg.com/originals/3d/d6/4f/3dd64f64c1b1545777bb91cd48205da5.jpg',
    ),
    Category(
      name: "Goggles",
      imageUrl:
          'https://i.pinimg.com/736x/39/99/bb/3999bb144ab7bd6512bf2286dd51006e.jpg',
    )
  ];
}
