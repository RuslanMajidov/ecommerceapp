

import 'package:ecommerceapp/blocs/wishlist/wishlist_event.dart';
import 'package:ecommerceapp/blocs/wishlist/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/category_model.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {
  WishListBloc() : super(WishListLoading());

  @override
  Stream<WishListState> mapEventToState(
      WishListEvent event,
      ) async* {
    if (event is StartWishList) {
      yield* _mapStartWishListToState();
    } else if (event is AddWishListProduct) {
      yield* _mapAddWishListProductToState(event, state);
    }
    // else if (event is RemoveWishListProduct) {
    //   yield* _mapRemoveWishListProductToState(event, state);
    // }
  }

  Stream<WishListState> _mapStartWishListToState() async* {
    yield WishListLoading();
    try {
      await Future<void>.delayed(Duration(seconds: 1));
      yield const WishListLoaded();
    } catch (_) {}
  }

  Stream <WishListState> _mapAddWishListProductToState(AddWishListProduct event,
      WishListState state,) async* {
    if (state is WishListLoaded) {
      try {
        yield WishListLoaded(
          wishList: WishList(
            products: List.from(
                state.wishList.products)
              ..add(event.product),),);
      } catch (_) {}
    }
    // Stream <WishListState> _mapRemoveWishListProductToState(
    //     RemoveWishListProduct event,
    //     WishListState state,) async* {
    //   if (state is WishListLoaded) {
    //     try {
    //       yield WishListLoaded(
    //         wishList: WishList(
    //           products: List.from(
    //               state.wishList.products)
    //             ..add(event.product),),);
    //     } catch (_) {}
    //   }
    // }
  }
}