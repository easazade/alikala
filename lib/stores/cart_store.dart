import 'package:alikala/data/entities.dart';
import 'package:alikala/fake_data.dart';
import 'package:flutter_crystalline/flutter_crystalline.dart';
import 'package:injectable/injectable.dart';

final cartStore = CartStore();

class CartStore extends Store {
  final products = ListData<Product>(fakeProducts.map((e) => Data(value: e)).toList());

  void addProduct() {
    products.insert(0, Data(value: fakeProducts.first));
    notifyListeners();
  }

  void removeProduct() {
    print(products.length);
    products.removeAt(0);
    print(products.length);
    notifyListeners();
  }

  @override
  List<Data<Object?>> get items => [products];
}
