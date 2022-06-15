import 'package:ecommerceapp/models/models.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<Product> products;
  Cart({this.products = const <Product>[]});

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);
  double deliveryFee(subtotal) {
    if (subtotal >= 3000) {
      return 0.0;
    } else {
      return 100.0;
    }
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 3000) {
      return 'You have Free Delivery';
    } else {
      num missing = 3000 - subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} for Free Delivery';
    }
  }

  String get subtotalString => subtotal.toStringAsFixed(2);
  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);
  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String get freeDeliveryString => freeDelivery(subtotal);

  @override
  List<Object?> get props => [products];
}
