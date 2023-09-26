import 'package:application/utils/utils_functions.dart';
import 'package:flutter_crystalline/flutter_crystalline.dart';
import 'package:shop_client/shop_client.dart';

class UpdateCartItemOperation extends Operation {
  final int productId;
  UpdateCartItemOperation(this.productId) : super('add-to-cart');
}

class CartStore extends Store {
  CartStore({required this.client});

  final Client client;

  final cart = Data<Cart>();

  Future init() async {
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
  }

  Future updateCartItem(int productId, {int count = 1}) async {
    failure = null;
    operation = UpdateCartItemOperation(productId);
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
}
