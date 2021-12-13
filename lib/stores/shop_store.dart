import 'package:alikala/arcitecture/data/data.dart';
import 'package:alikala/arcitecture/store/store.dart';

class ShopStore extends Store {
  late final Data<String> shopName = Data();

  Future setShopName(String name) async {
    const String what = 'WHATT ??';
    shopName.setOperation(Operation.loading);
    updaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaate();
    await Future.delayed(const Duration(seconds: 4));
    if (shopName.valueEqualsTo(what)) {
      shopName.setValue('AHA !!');
    } else {
      shopName.setValue(what);
    }
    shopName.setOperation(Operation.none);
    updaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaate();
  }
}
