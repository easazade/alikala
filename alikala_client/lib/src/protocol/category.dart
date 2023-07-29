/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Category extends _i1.SerializableEntity {
  Category({
    this.id,
    required this.name,
    this.image,
    this.parentId,
    required this.productsCount,
  });

  factory Category.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Category(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      image:
          serializationManager.deserialize<String?>(jsonSerialization['image']),
      parentId:
          serializationManager.deserialize<int?>(jsonSerialization['parentId']),
      productsCount: serializationManager
          .deserialize<int>(jsonSerialization['productsCount']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String? image;

  int? parentId;

  int productsCount;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'parentId': parentId,
      'productsCount': productsCount,
    };
  }
}
