import 'package:flutter_crystalline/flutter_crystalline.dart';
import 'package:shop_client/shop_client.dart';

class ShopStore extends Store {
  final Client client;

  final banners = ListData<BannerAd>([]);

  ShopStore({required this.client}) {
    _initialize();
  }

  Future _initialize() async {
    final bannerAds = await client.bannerAds.getSlides();
    banners.addAll(bannerAds.mapToData);
    notifyListeners();
  }

  @override
  List<Data<Object?>> get items => [banners];
}
