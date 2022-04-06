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
      name: "Shoes",
      imageUrl:
         'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/41e45047-a899-4c21-bc2a-20c5a9eb966a/air-max-270-womens-shoes-Pgb94t.png',
             ),
    Category(
      name: "Hand Bags",
      imageUrl:
        'https://i.ytimg.com/vi/rV3aXMIxFj4/maxresdefault.jpg',
    ),
    Category(
      name: "Ornaments",
      imageUrl:
        'https://ae01.alicdn.com/kf/H23e7cceb39d641fcbbae016d5974585aL/Yulaili-New-Dubai-Jewelry-Sets-for-Women-Normal-Zircon-Necklace-Earrings-Bracelet-Ring-African-Nigeria-Bridal.jpg',
    ),
    Category(
      name: "Goggles",
      imageUrl:
        'https://canary.contestimg.wish.com/api/webimage/5c809683bcfbc3414236b5a9-large.jpg?cache_buster=983f28cc94961b5bbb7a03b0688ef390',
    )
  ];
}
