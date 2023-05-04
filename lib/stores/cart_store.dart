import 'package:alikala/data/entities.dart';
import 'package:alikala/fake_data.dart';
import 'package:flutter_crystalline/flutter_crystalline.dart';

class CartStore extends Store {
  final products = ListData<Product>(fakeProducts.map((e) => Data(value: e)).toList());

  void addProduct() {
    products.insert(0, Data(value: fakeProducts.first));
    notifyListeners();
  }

  Future removeProduct() async {
    products[0].operation = Operation.delete;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));
    products.removeAt(0);
    notifyListeners();
  }

  @override
  List<Data<Object?>> get items => [products];
}
