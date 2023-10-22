import 'package:serverpod/serverpod.dart';
import 'package:shop_server/src/generated/protocol.dart';

class Offers extends Endpoint {
  Future<List<Offer>> getOffers(Session session) => Offer.find(session);
}
