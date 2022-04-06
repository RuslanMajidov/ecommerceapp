

import 'package:ecommerceapp/blocs/wishlist/wishlist_event.dart';
import 'package:ecommerceapp/blocs/wishlist/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class WishListBloc extends Bloc<WishListEvent, WishListState> {
  WishListBloc(): super (WishListLoading())
  {
    on<StartWishList> (_onStartWishList);
    on<AddWishListProduct> (_onAddProductToWishList);
    on<RemoveWishListProduct> (_onRemoveProductFromWishList);
  }

}


void _onStartWishList (
    StartWishList event,
Emitter<WishListState> emit,
    ) async {
  emit(WishListLoading());
  try {
    await Future<void>.delayed(const Duration(seconds: 1));
    emit(WishListLoaded());
  } catch (_) {
    emit(WishListError());
  }
}

void _onAddProductToWishList (
    AddWishListProduct event,
Emitter<WishListState> emit,
) async {
  emit(WishListLoading());
  try {
    await Future<void>.delayed(const Duration(seconds: 1));
    emit(WishListLoaded());
  } catch (_) {
    emit(WishListError());
  }
}


void _onRemoveProductFromWishList (
RemoveWishListProduct event,
    Emitter<WishListState> emit,
) async {
  emit(WishListLoading());
  try {
    await Future<void>.delayed(const Duration(seconds: 1));
    emit(WishListLoaded());
  } catch (_) {
    emit(WishListError());
  }
}

