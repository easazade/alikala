import 'package:flutter_crystalline/flutter_crystalline.dart';

class ShopStore extends ChangeNotifierData {
  late final shopName = ContextData<String, int>();

  Future setShopName(String name) async {
    const String what = 'AliShop';
    shopName.operation = Operation.operating;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));
    shopName.operation = Operation('meow');
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    shopName.context = 12;
    if (shopName.valueEqualsTo(what)) {
      shopName.value =
          'AliKala !! ${(shopName.hasContext) ? "with ${shopName.context} years of customer service" : ""}';
    } else {
      shopName.value = what;
    }

    shopName.operation = Operation.none;
    notifyListeners();
  }

  @override
  List<Data<Object?>> get items => [shopName];
}
