import 'package:application/utils/utils_functions.dart';
import 'package:flutter_crystalline/flutter_crystalline.dart';
import 'package:shop_client/shop_client.dart';

class CartStore extends Store {
  CartStore({required this.client});

  final Client client;

  final carts = ListData<Cart>([]);

  Future init() async {
    operation = Operation.fetch;
    error = null;
    notifyListeners();

    final result = await client.carts.getCarts().sealed();
    if (result.isSuccessful) {
      final allCarts = result.value;
      carts.addAll(allCarts.mapToData);
    } else {
      error = Failure('Could not fetch carts', exception: result.exception, cause: Operation.fetch);
    }

    operation = Operation.none;
    notifyListeners();
  }

  void addProduct(Product product) {}

  Future removeProduct(Product product) async {}

  @override
  List<Data<Object?>> get items => [carts];
}
