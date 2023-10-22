/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class Offer extends _i1.SerializableEntity {
  Offer({
    this.id,
    required this.productId,
    this.product,
    required this.discountId,
    this.discount,
    required this.expireAt,
    required this.startedAt,
  });

  factory Offer.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Offer(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      productId:
          serializationManager.deserialize<int>(jsonSerialization['productId']),
      product: serializationManager
          .deserialize<_i2.Product?>(jsonSerialization['product']),
      discountId: serializationManager
          .deserialize<int>(jsonSerialization['discountId']),
      discount: serializationManager
          .deserialize<_i2.Discount?>(jsonSerialization['discount']),
      expireAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['expireAt']),
      startedAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['startedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int productId;

  _i2.Product? product;

  int discountId;

  _i2.Discount? discount;

  DateTime expireAt;

  DateTime startedAt;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'product': product,
      'discountId': discountId,
      'discount': discount,
      'expireAt': expireAt,
      'startedAt': startedAt,
    };
  }
}
