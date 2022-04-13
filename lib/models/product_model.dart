import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final num price;
  final bool ProductList;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.ProductList,
  });
  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
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
  static List<Product> products = [
    Product(
      name: "Sneakers",
      category: 'Shoes',
      imageUrl:
          'https://static-01.daraz.com.np/p/c08a216ea39c997bd25279d89d379748.jpg',
      price: 1200,
      ProductList: true,
    ),
    Product(
      name: "Peach Chunky Glitter",
      category: 'Shoes',
      imageUrl:
          'https://i.pinimg.com/originals/75/cd/7c/75cd7c2f89c79215254359ea12ebd083.jpg',
      price: 1000,
      ProductList: true,
    ),
    Product(
        name: 'Custom Airforce 1',
        category: 'Shoes',
        imageUrl:
            'https://i.pinimg.com/736x/04/e3/27/04e3277de91c119b6ab3b962430881f5.jpg',
        price: 1200,
        ProductList: true),
    Product(
        name: 'Nike',
        category: 'Shoes',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8Hu_cNpywlLP7wCPKQNncST7zR4onpSmhkQ&usqp=CAU',
        price: 1200,
        ProductList: true),
    Product(
      name: "Customized Converse",
      category: 'Shoes',
      imageUrl:
          'https://kosmo-shop.com/23247-home_default/-rainbow-vibe-canvas-shoes.jpg',
      price: 900,
      ProductList: true,
    ),
    Product(
      name: "Vans",
      category: 'Shoes',
      imageUrl:
          'https://i.pinimg.com/736x/dd/7f/68/dd7f68c98cd296a17411dfe8b3a4f508.jpg',
      price: 800,
      ProductList: true,
    ),
    Product(
      name: "Grey Casual Shoes",
      category: 'Shoes',
      imageUrl:
          'https://5.imimg.com/data5/HR/YP/YD/SELLER-90058063/men-stylish-shoes-500x500.jpg',
      price: 800,
      ProductList: true,
    ),
    Product(
      name: "Shining bracelet",
      category: 'Ornaments',
      imageUrl:
          'https://i.pinimg.com/474x/d8/21/6c/d8216c15bf4478fec45d94660b5da238.jpg',
      price: 200,
      ProductList: true,
    ),
    Product(
      name: "Fur Earrings",
      category: 'Ornaments',
      imageUrl:
          'https://assets.onbuy.com/i28/product/0660a56ad3bc4e34b99c518b4ac1b3d4-l4374653/hairy-earrings-with-love-ornaments-fashion-earrings-for-women-girls-black.jpg',
      price: 200,
      ProductList: true,
    ),
    Product(
      name: "Jewellery set",
      category: 'Ornaments',
      imageUrl:
          'https://images-eu.ssl-images-amazon.com/images/I/41oh0f0crmL._AC._SR360,460.jpg',
      price: 200,
      ProductList: true,
    ),
    Product(
      name: "Blue Star Moon earring",
      category: 'Ornaments',
      imageUrl:
          'https://static-01.daraz.com.np/p/89726658b126e8bb4cbfc0f8d40626fd.jpg',
      price: 200,
      ProductList: true,
    ),
    Product(
      name: "Butterfly Bangle Bracelet",
      category: 'Ornaments',
      imageUrl:
          'https://image.made-in-china.com/44f3j00WyOfmuirfBcp/Fashion-Girls-Jewelry-Fancy-Beautiful-Butterfly-Bangle-Bracelet.jpg',
      price: 200,
      ProductList: true,
    ),
    Product(
      name: "Pink Sunglasses",
      category: 'Goggles',
      imageUrl: 'https://data.whicdn.com/images/322922742/original.jpg',
      price: 200,
      ProductList: true,
    ),
    Product(
      name: "Transparent Sunglasses",
      category: 'Goggles',
      imageUrl:
          'https://img.joomcdn.net/98824623da90d58b4cf745c1b331cda08bf69a5c_original.jpeg',
      price: 200,
      ProductList: true,
    ),
    Product(
      name: "Unisex Goggles",
      category: 'Goggles',
      imageUrl: 'https://m.media-amazon.com/images/I/61lfZ8PK6pL._UL1500_.jpg',
      price: 200,
      ProductList: true,
    ),
    Product(
      name: "Fashion Goggles",
      category: 'Goggles',
      imageUrl:
          'https://i.pinimg.com/originals/13/a9/a6/13a9a69403fb7c53d8e02618f253a6f5.jpg',
      price: 200,
      ProductList: true,
    ),
    Product(
      name: "Royal Grey Radient Sungalsses",
      category: 'Goggles',
      imageUrl:
          'https://02.cdn37.se/ak1/images/2.619242/chimi-eyewear-01-grey.jpeg',
      price: 200,
      ProductList: true,
    ),
    Product(
      name: "Orange Leather HandBag",
      category: 'Hand Bags',
      imageUrl:
          'https://5.imimg.com/data5/NM/II/MY-3020503/ladies-hand-bags1-500x500.jpg',
      price: 200,
      ProductList: true,
    ),
    Product(
      name: "Rexine Plain Hand Bag",
      category: 'Hand Bags',
      imageUrl:
          'https://5.imimg.com/data5/AQ/UF/MY-2279552/ladies-hand-bag-500x500.jpg',
      price: 200,
      ProductList: true,
    ),
    Product(
      name: "Purses Shoulder Handbag",
      category: 'Hand Bags',
      imageUrl:
          'https://static-01.daraz.com.np/p/62670c42625c98206407f7fbcb74217c.jpg',
      price: 200,
      ProductList: true,
    ),
    Product(
      name: "CrossBody Bag",
      category: 'Hand Bags',
      imageUrl: 'https://m.media-amazon.com/images/I/416u+59IJ3L.jpg',
      price: 200,
      ProductList: true,
    ),
    Product(
      name: "Brown Bag",
      category: 'Hand Bags',
      imageUrl:
          'https://static-01.daraz.com.np/p/mdc/1592b4be090d0e11ccccc0305296b79b.jpg',
      price: 200,
      ProductList: true,
    ),
  ];
}
