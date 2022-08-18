// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Search extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool ProductList;

  const Search({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.ProductList,
  });
  static Search fromSnapshot(DocumentSnapshot snap) {
    Search product = Search(
      name: snap['name'],
      category: snap['category'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      ProductList: snap['ProductList'],
    );
    return product;
  }

  @override
  List<Object?> get props => [name, category, imageUrl, price, ProductList];
  static List<Search> products = [
    Search(
      name: "Sneakers",
      category: 'Shoes',
      imageUrl:
          'https://static-01.daraz.com.np/p/c08a216ea39c997bd25279d89d379748.jpg',
      price: 1000,
      ProductList: true,
    ),
    Search(
        name: 'Multicolor Shoes',
        category: 'Shoes',
        imageUrl:
            'https://i.pinimg.com/736x/88/74/e7/8874e7a0aace168049eafde28427ce8f.jpg',
        price: 1200,
        ProductList: true),
    Search(
      name: "Toddler Shoes",
      category: 'Shoes',
      imageUrl:
          'https://dimg.dillards.com/is/image/DillardsZoom/nav2/steve-madden-girls-t-maxima-rhinestone-detail-sneakers-toddler/00000000_zi_0537cab1-0bc5-4652-bc38-a30cb6dc8ec4.jpg',
      price: 900,
      ProductList: true,
    ),
    Search(
      name: "Grey Casual Shoes",
      category: 'Shoes',
      imageUrl:
          'https://5.imimg.com/data5/HR/YP/YD/SELLER-90058063/men-stylish-shoes-500x500.jpg',
      price: 800,
      ProductList: true,
    ),
    Search(
      name: "Emerland green studed bracelet",
      category: 'Ornaments',
      imageUrl:
          'https://assets0.mirraw.com/images/7335857/B2101XXRAFG-FD_(1)_large.jpg?1567078032',
      price: 200,
      ProductList: true,
    ),
    Search(
      name: "Fur Earrings",
      category: 'Ornaments',
      imageUrl:
          'https://assets.onbuy.com/i28/product/0660a56ad3bc4e34b99c518b4ac1b3d4-l4374653/hairy-earrings-with-love-ornaments-fashion-earrings-for-women-girls-black.jpg',
      price: 200,
      ProductList: true,
    ),
    Search(
      name: "Jewellery set",
      category: 'Ornaments',
      imageUrl:
          'https://images-eu.ssl-images-amazon.com/images/I/41oh0f0crmL._AC._SR360,460.jpg',
      price: 200,
      ProductList: true,
    ),
    Search(
      name: "Blue Star Moon earring",
      category: 'Ornaments',
      imageUrl:
          'https://static-01.daraz.com.np/p/89726658b126e8bb4cbfc0f8d40626fd.jpg',
      price: 200,
      ProductList: true,
    ),
    Search(
      name: "Butterfly Bangle Bracelet",
      category: 'Ornaments',
      imageUrl:
          'https://image.made-in-china.com/44f3j00WyOfmuirfBcp/Fashion-Girls-Jewelry-Fancy-Beautiful-Butterfly-Bangle-Bracelet.jpg',
      price: 200,
      ProductList: true,
    ),
    Search(
      name: "Pink Sunglasses",
      category: 'Goggles',
      imageUrl:
          'photo-goggles-for-girls-good-sunglasses-for-women-designer-accessory-on-a-white-background-style-bad-1094209937.jpg',
      price: 200,
      ProductList: true,
    ),
    Search(
      name: "Transparent Sunglasses",
      category: 'Goggles',
      imageUrl:
          'https://img.joomcdn.net/98824623da90d58b4cf745c1b331cda08bf69a5c_original.jpeg',
      price: 200,
      ProductList: true,
    ),
    Search(
      name: "Unisex Goggles",
      category: 'Goggles',
      imageUrl: 'https://m.media-amazon.com/images/I/61lfZ8PK6pL._UL1500_.jpg',
      price: 200,
      ProductList: true,
    ),
    Search(
      name: "Fashion Goggles",
      category: 'Goggles',
      imageUrl:
          'https://i.pinimg.com/originals/13/a9/a6/13a9a69403fb7c53d8e02618f253a6f5.jpg',
      price: 200,
      ProductList: true,
    ),
    Search(
      name: "Royal Grey Radient Sungalsses",
      category: 'Goggles',
      imageUrl:
          'data:image/jpeg;base64,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',
      price: 200,
      ProductList: true,
    ),
    Search(
      name: "Orange Leather HandBag",
      category: 'Hand Bags',
      imageUrl:
          'https://5.imimg.com/data5/NM/II/MY-3020503/ladies-hand-bags1-500x500.jpg',
      price: 200,
      ProductList: true,
    ),
    Search(
      name: "Purses Shoulder Handbag",
      category: 'Hand Bags',
      imageUrl:
          'https://static-01.daraz.com.np/p/62670c42625c98206407f7fbcb74217c.jpg',
      price: 200,
      ProductList: true,
    ),
    Search(
      name: "CrossBody Bag",
      category: 'Hand Bags',
      imageUrl: 'https://m.media-amazon.com/images/I/416u+59IJ3L.jpg',
      price: 200,
      ProductList: true,
    ),
    Search(
      name: "Brown Bag",
      category: 'Hand Bags',
      imageUrl:
          'https://static-01.daraz.com.np/p/mdc/1592b4be090d0e11ccccc0305296b79b.jpg',
      price: 200,
      ProductList: true,
    ),
  ];
}
