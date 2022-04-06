import 'package:ecommerceapp/models/models.dart';
import 'package:equatable/equatable.dart';



abstract class WishListState extends Equatable{
  const WishListState();
  @override
  List<Object> get props=> [];
}

class WishListLoading extends WishListState {
  @override
  List<Object> get props => [];
}
class WishListLoaded extends WishListState {
  final Wishlist wishList;
  const WishListLoaded({this.wishList = const Wishlist()});

  @override
  List<Object> get props => [wishList];

}
class WishListError extends WishListState {
  @override
  List<Object> get props => [];
}