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
    this.parentId,
    required this.name,
    required this.description,
    this.image,
    this.icon,
    this.productsCount,
  });

  factory Category.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Category(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      parentId:
          serializationManager.deserialize<int?>(jsonSerialization['parentId']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      image:
          serializationManager.deserialize<String?>(jsonSerialization['image']),
      icon:
          serializationManager.deserialize<String?>(jsonSerialization['icon']),
      productsCount: serializationManager
          .deserialize<int?>(jsonSerialization['productsCount']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int? parentId;

  String name;

  String description;

  String? image;

  String? icon;

  int? productsCount;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parentId': parentId,
      'name': name,
      'description': description,
      'image': image,
      'icon': icon,
      'productsCount': productsCount,
    };
  }
}
