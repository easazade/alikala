import 'package:shop_client/shop_client.dart';

extension OfferX on Offer {
  double? get offPercentage {
    if (product != null && discount != null) {
      return discount!.discountPrice / product!.price;
    } else {
      return null;
    }
  }
}
