// ignore_for_file: depend_on_referenced_packages

import 'package:application/utils/utils_functions.dart';
import 'package:flutter_crystalline/flutter_crystalline.dart';
import 'package:shop_client/shop_client.dart';
import 'package:serverpod_auth_client/module.dart';

class ProfileStore extends Store {
  ProfileStore({required this.loggedInUser, required this.client});

  final favoriteItems = ListData<Product>([]);
  final Data<UserInfo> loggedInUser;
  final Client client;

  Future<void> init() async {
    if (loggedInUser.hasValue) {
      operation = Operation.fetch;
      failure = null;
      notifyListeners();

      final result = await client.users.getFavoriteItems().sealed();

      if (result.isSuccessful) {
        favoriteItems.addAll(result.value.mapToData);
      } else {
        failure = Failure(
          result.exception.getMessage() ?? 'Could not fetch favorite items',
          cause: Operation.fetch,
          exception: result.exception,
        );
      }
      operation = Operation.none;
    } else {
      failure = Failure('Please Login first');
    }
  }

  @override
  List<Data<Object?>> get items => [loggedInUser, favoriteItems];
}
