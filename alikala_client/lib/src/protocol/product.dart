/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Product extends _i1.SerializableEntity {
  Product({
    this.id,
    required this.title,
    this.images,
    required this.price,
    this.offPrice,
    this.colorHex,
    this.colorName,
    required this.dueDate,
  });

  factory Product.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Product(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      images: serializationManager
          .deserialize<List<String>?>(jsonSerialization['images']),
      price: serializationManager.deserialize<int>(jsonSerialization['price']),
      offPrice:
          serializationManager.deserialize<int?>(jsonSerialization['offPrice']),
      colorHex:
          serializationManager.deserialize<int?>(jsonSerialization['colorHex']),
      colorName: serializationManager
          .deserialize<String?>(jsonSerialization['colorName']),
      dueDate: serializationManager
          .deserialize<DateTime>(jsonSerialization['dueDate']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  List<String>? images;

  int price;

  int? offPrice;

  int? colorHex;

  String? colorName;

  DateTime dueDate;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'images': images,
      'price': price,
      'offPrice': offPrice,
      'colorHex': colorHex,
      'colorName': colorName,
      'dueDate': dueDate,
    };
  }
}
