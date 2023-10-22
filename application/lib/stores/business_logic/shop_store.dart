import 'package:application/utils/utils_functions.dart';
import 'package:flutter_crystalline/flutter_crystalline.dart';
import 'package:shop_client/shop_client.dart';

class ShopStore extends Store {
  final Client client;

  final banners = ListData<BannerAd>([]);
  final offers = ListData<Offer>([]);

  ShopStore({required this.client}) {
    init();
  }

  void init() {
    _getBanners();
    _getOffers();
  }

  @override
  List<Data<Object?>> get items => [banners];

  Future<void> _getBanners() async {
    banners.operation = Operation.fetch;
    banners.failure = null;
    notifyListeners();

    final result = await client.bannerAds.getSlides().sealed();
    if (result.isSuccessful) {
      final bannerAds = result.value;
      banners.addAll(bannerAds.mapToData);
    } else {
      banners.failure = Failure(
        result.exception.getMessage() ?? 'Could not load banners',
        exception: result.exception,
        cause: Operation.fetch,
      );
    }

    banners.operation = Operation.none;
    notifyListeners();
  }

  Future<void> _getOffers() async {
    offers.operation = Operation.fetch;
    offers.failure = null;
    notifyListeners();

    final result = await client.offers.getOffers().sealed();
    if (result.isSuccessful) {
      offers.addAll(result.value.mapToData);
    } else {
      offers.failure = Failure(
        result.exception.getMessage() ?? 'Could not load offers',
        exception: result.exception,
        cause: Operation.fetch,
      );
    }

    offers.operation = Operation.none;
    notifyListeners();
  }
}
