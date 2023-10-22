import 'package:serverpod/serverpod.dart';
import 'package:shop_server/src/generated/protocol.dart';

class Offers extends Endpoint {
  Future<List<Offer>> getOffers(Session session) async {
    final offers = await Offer.find(session);

    for (var offer in offers) {
      offer.discount = await Discount.findById(session, offer.discountId);
      offer.product = await Product.findById(session, offer.productId);
    }

    return offers;
  }
}
