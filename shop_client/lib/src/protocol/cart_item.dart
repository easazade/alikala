/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class CartItem extends _i1.SerializableEntity {
  CartItem({
    this.id,
    required this.tableId,
    this.product,
    required this.addedCount,
  });

  factory CartItem.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return CartItem(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      tableId:
          serializationManager.deserialize<int>(jsonSerialization['tableId']),
      product: serializationManager
          .deserialize<_i2.Product?>(jsonSerialization['product']),
      addedCount: serializationManager
          .deserialize<int>(jsonSerialization['addedCount']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int tableId;

  _i2.Product? product;

  int addedCount;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tableId': tableId,
      'product': product,
      'addedCount': addedCount,
    };
  }
}
