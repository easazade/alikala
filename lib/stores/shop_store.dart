import 'package:alikala/stores/store.dart';

class ShopStore extends Store {
  var shopName = 'No Name';

  void setShopName(String name) {
    setState(() {
      shopName = name;
    });
  }
}
