/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Discount extends _i1.SerializableEntity {
  Discount({
    this.id,
    required this.productId,
    required this.discountPrice,
    required this.startDate,
    required this.dueDate,
    required this.message,
  });

  factory Discount.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Discount(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      productId:
          serializationManager.deserialize<int>(jsonSerialization['productId']),
      discountPrice: serializationManager
          .deserialize<double>(jsonSerialization['discountPrice']),
      startDate: serializationManager
          .deserialize<DateTime>(jsonSerialization['startDate']),
      dueDate: serializationManager
          .deserialize<DateTime>(jsonSerialization['dueDate']),
      message: serializationManager
          .deserialize<String>(jsonSerialization['message']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int productId;

  double discountPrice;

  DateTime startDate;

  DateTime dueDate;

  String message;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'discountPrice': discountPrice,
      'startDate': startDate,
      'dueDate': dueDate,
      'message': message,
    };
  }
}
