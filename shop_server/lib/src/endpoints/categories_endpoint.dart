import 'package:serverpod/serverpod.dart';
import 'package:shop_server/src/generated/protocol.dart';

class Categories extends Endpoint {
  Future<List<Category>> getCategories(Session session) => Category.find(session);
}
