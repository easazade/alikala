import 'package:shop_client/shop_client.dart';

extension OfferX on Offer {
  double? get offPercentage {
    if (product != null && discount != null) {
      return 1 - (discount!.discountPrice.toDouble() / product!.price.toDouble());
    } else {
      return null;
    }
  }
}
