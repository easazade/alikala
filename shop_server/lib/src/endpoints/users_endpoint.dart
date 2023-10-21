import 'package:collection/collection.dart';
import 'package:serverpod/serverpod.dart';
import 'package:shop_server/src/exceptions.dart';
import 'package:shop_server/src/generated/protocol.dart';

class Users extends Endpoint {
  Future<List<Product>> getFavoriteItems(Session session) async {
    final userId = await session.auth.authenticatedUserId;
    if (userId != null) {
      final profile = await Profile.findById(session, userId);

      if (profile == null) {
        throw ClientException(message: 'Could not find user profile for user with id=$userId');
      }

      final favoriteItems = await Future.wait(profile.favorites.map((id) => Product.findById(session, id)));
      return favoriteItems.whereNotNull().toList();
    } else {
      throw UnAuthorizedException();
    }
  }
}
