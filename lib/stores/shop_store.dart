import 'package:alikala/arcitecture/data.dart';

class ShopStore extends BaseStore {
  late final Data<String> shopName = Data<String>();

  Future setShopName(String name) async {
    const String what = 'WHATT ??';
    shopName.setOperation(Operation.loading);
    updateStore();
    await Future.delayed(const Duration(seconds: 4));
    if (shopName.valueEqualsTo(what)) {
      shopName.setValue('AHA !!');
    } else {
      shopName.setValue(what);
    }
    shopName.setOperation(Operation.none);
    updateStore();
  }
}
