import 'package:alikala/data/entities.dart';
import 'package:alikala/fake_data.dart';
import 'package:flutter_crystalline/flutter_crystalline.dart';

class CartStore extends Store {
  final products = ListData<Product>(fakeProducts.map((e) => Data(value: e)).toList());

  void addProduct() {
    products.insert(0, Data(value: fakeProducts.first));
    notifyListeners();
  }

  void removeProduct() {
    products.removeAt(0);
    notifyListeners();
  }

  @override
  List<Data<Object?>> get items => [products];
}
