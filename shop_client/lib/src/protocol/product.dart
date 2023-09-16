/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class Product extends _i1.SerializableEntity {
  Product({
    this.id,
    required this.name,
    required this.description,
    this.images,
    this.discount,
  });

  factory Product.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Product(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      images: serializationManager
          .deserialize<List<String>?>(jsonSerialization['images']),
      discount: serializationManager
          .deserialize<_i2.Discount?>(jsonSerialization['discount']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String description;

  List<String>? images;

  _i2.Discount? discount;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'images': images,
      'discount': discount,
    };
  }
}
