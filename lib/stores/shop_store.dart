import 'package:flutter_crystalline/flutter_crystalline.dart';

class ShopStore extends BaseStore {
  late final BuildableData<String> shopName = BuildableData<String>();

  Future setShopName(String name) async {
    const String what = 'WHATT ??';
    shopName.operation = Operation.loading;
    updateStore();
    await Future.delayed(const Duration(seconds: 4));
    if (shopName.valueEqualsTo(what)) {
      shopName.value = 'AHA !!';
    } else {
      shopName.value = what;
    }
    shopName.operation = Operation.none;
    updateStore();
  }
}
