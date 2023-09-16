import 'package:serverpod/serverpod.dart';
import 'package:shop_server/src/generated/protocol.dart';

class Carts extends Endpoint {
  Future<List<Cart>> getCarts(Session session) => Cart.find(session);
}
