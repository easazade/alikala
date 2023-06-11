import 'package:flutter_crystalline/flutter_crystalline.dart';

class ShopStore extends ChangeNotifierData {
  late final Data<String> shopName = Data<String>();

  Future setShopName(String name) async {
    const String what = 'WHATT ??';
    shopName.operation = Operation.loading;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));
    shopName.operation = Operation('meow');
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    if (shopName.valueEqualsTo(what)) {
      shopName.value = 'AHA !!';
    } else {
      shopName.value = what;
    }

    shopName.operation = Operation.none;
    notifyListeners();
  }

  @override
  List<Data<Object?>> get items => [shopName];
}
