import 'package:collection/collection.dart';
import 'package:serverpod/serverpod.dart';
import 'package:shop_server/src/exceptions.dart';
import 'package:shop_server/src/extensions.dart';
import 'package:shop_server/src/generated/protocol.dart';

class Carts extends Endpoint {
  // always returns one carts. if there isn't none. it will create a new cart and returns
  Future<Cart> getCart(Session session) async {
    if (await session.isUserSignedIn) {
      final userId = await session.auth.authenticatedUserId;
      final carts = await Cart.find(session, where: (table) => table.userId.equals(userId));
      // delete carts if there are more than one
      if (carts.length > 1) {
        for (var cart in carts.sublist(1)) {
          await CartItem.delete(session, where: (t) => t.cartId.equals(cart.id));
          await Cart.deleteRow(session, cart);
        }
      }

      var currentCart = carts.first;

      // if cart is older than a day delete and return a new one
      if (currentCart.dateCreated.difference(DateTime.now()).inHours > 24) {
        await CartItem.delete(session, where: (t) => t.cartId.equals(currentCart.id));
        await Cart.deleteRow(session, currentCart);

        currentCart = Cart(dateCreated: DateTime.now(), userId: userId!);
        await Cart.insert(session, currentCart);
      }

      final cartItems = await CartItem.find(session, where: (t) => t.cartId.equals(currentCart.id));
      final cartItemsWithProducts = await Future.wait(
        cartItems.map((e) async {
          final product = await Product.findById(session, e.productId);
          if (product != null) {
            return e..product = product;
          } else {
            return null;
          }
        }),
      ).then((list) => list.nonNulls.toList());

      return currentCart..items = cartItemsWithProducts;
    } else {
      throw UnAuthorizedException();
    }
  }

  /// updates [cartItem] if cart item has id if not creates a new instance in database
  /// and returns the updated [Cart] object
  Future<Cart> updateCartItems(Session session, int productId, int count) async {
    final cart = await getCart(session);

    final cartItem = cart.items?.firstWhereOrNull((item) => item.productId == productId) ??
        CartItem(cartId: cart.id!, productId: productId, addedCount: 0);

    cartItem.addedCount = cartItem.addedCount + count;

    if (cartItem.addedCount >= 1) {
      await session.db.insertOrUpdate(cartItem);
    } else {
      await CartItem.delete(session, where: (t) => t.id.equals(cartItem.id));
    }

    return getCart(session);
  }
}
