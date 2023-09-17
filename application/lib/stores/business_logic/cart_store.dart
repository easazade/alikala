import 'package:application/stores/events_operations.dart';
import 'package:application/utils/utils_functions.dart';
import 'package:flutter_crystalline/flutter_crystalline.dart';
import 'package:shop_client/shop_client.dart';
import 'package:collection/collection.dart';

class UpdateCartItemCountOperation extends Operation {
  UpdateCartItemCountOperation(CartItem cartItem) : super('add-to-cart');
}

class CartStore extends Store {
  CartStore({required this.client});

  final Client client;

  final cart = Data<Cart>();

  Future init() async {
    operation = Operation.fetch;
    error = null;
    notifyListeners();

    final result = await client.carts.getCart().sealed();
    if (result.isSuccessful) {
      cart.value = result.value;
    } else {
      error = Failure('Could not fetch carts', exception: result.exception, cause: Operation.fetch);
    }

    operation = Operation.none;
    notifyListeners();
  }

  Future addProduct(Product product) async {
    error = null;
    var cartItem = cart.value.items?.firstWhereOrNull((item) => item.productId == product.id) ??
        CartItem(cartId: cart.value.id!, productId: product.id!, addedCount: 0);

    cartItem.addedCount = cartItem.addedCount + 1;
    operation = UpdateCartItemCountOperation(cartItem);
    notifyListeners();

    final result = await client.carts.addOrUpdateCartItem(cartItem).sealed();
    if (result.hasError) {
      return;
    }

    operation = AppOperations.reloadingCart;
    final fetchCartResult = await client.carts.getCart().sealed();

    if (fetchCartResult.isSuccessful) {
      cart.value = fetchCartResult.value;
    } else {
      error = Failure('Cannot show cart, please try again', exception: fetchCartResult.exception);
    }

    operation = Operation.none;
    notifyListeners();
  }

  Future removeProduct(Product product) async {}

  @override
  List<Data<Object?>> get items => [cart];
}
