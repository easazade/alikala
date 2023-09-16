import 'package:application/utils/utils_functions.dart';
import 'package:flutter_crystalline/flutter_crystalline.dart';
import 'package:shop_client/shop_client.dart';

class ShopStore extends Store {
  final Client client;

  final banners = ListData<BannerAd>([]);

  ShopStore({required this.client}) {
    init();
  }

  Future init() async {
    operation = Operation.fetch;
    error = null;
    notifyListeners();

    final result = await client.bannerAds.getSlides().sealed();
    if (result.isSuccessful) {
      final bannerAds = result.value;
      banners.addAll(bannerAds.mapToData);
    } else {
      error = Failure('Could not fetch banners', exception: result.exception, cause: Operation.fetch);
    }

    operation = Operation.none;
    notifyListeners();
  }

  @override
  List<Data<Object?>> get items => [banners];
}
