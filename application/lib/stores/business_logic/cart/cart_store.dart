import 'package:application/stores/business_logic/cart/event.dart';
import 'package:application/utils/utils_functions.dart';
import 'package:flutter_crystalline/flutter_crystalline.dart';
import 'package:shop_client/shop_client.dart';
// ignore: depend_on_referenced_packages
import 'package:serverpod_auth_client/module.dart';

class CartStore extends Store {
  CartStore({required this.client, required this.loggedInUser}) {
    refresh();
    loggedInUser.addObserver(refresh);
  }

  final Client client;

  final cart = Data<Cart>();
  final Data<UserInfo> loggedInUser;

  Future refresh() async {
    if (loggedInUser.hasValue) {
      operation = Operation.fetch;
      failure = null;
      notifyListeners();

      final result = await client.carts.getCart().sealed();
      if (result.isSuccessful) {
        cart.value = result.value;
      } else {
        failure = Failure('Could not fetch carts', exception: result.exception, cause: Operation.fetch);
      }

      operation = Operation.none;
      notifyListeners();
    } else {
      operation = Operation.none;
      failure = null;
      cart.value = null;
    }
  }

  Future updateCartItem({required int productId, required int count}) async {
    failure = null;
    if (count > 0) {
      operation = RemoveFromCartOperation(productId);
    } else if (count < 0) {
      operation = AddToCartOperation(productId);
    }
    notifyListeners();

    final result = await client.carts.updateCartItems(productId, count).sealed();
    if (result.isSuccessful) {
      cart.value = result.value;
    } else {
      failure = Failure('Cannot show cart, please try again', exception: result.exception);
    }

    operation = Operation.none;
    notifyListeners();
  }

  @override
  List<Data<Object?>> get items => [cart];

  @override
  void dispose() {
    loggedInUser.removeObserver(refresh);
    super.dispose();
  }
}
