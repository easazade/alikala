/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Category extends _i1.TableRow {
  Category({
    int? id,
    this.parentId,
    required this.name,
    required this.description,
    this.image,
    this.icon,
    this.productsCount,
  }) : super(id);

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

  static final t = CategoryTable();

  int? parentId;

  String name;

  String description;

  String? image;

  String? icon;

  int? productsCount;

  @override
  String get tableName => 'shop_categories';
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

  @override
  Map<String, dynamic> toJsonForDatabase() {
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

  @override
  Map<String, dynamic> allToJson() {
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

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'parentId':
        parentId = value;
        return;
      case 'name':
        name = value;
        return;
      case 'description':
        description = value;
        return;
      case 'image':
        image = value;
        return;
      case 'icon':
        icon = value;
        return;
      case 'productsCount':
        productsCount = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Category>> find(
    _i1.Session session, {
    CategoryExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Category>(
      where: where != null ? where(Category.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Category?> findSingleRow(
    _i1.Session session, {
    CategoryExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Category>(
      where: where != null ? where(Category.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Category?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Category>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required CategoryExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Category>(
      where: where(Category.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Category row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Category row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Category row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    CategoryExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Category>(
      where: where != null ? where(Category.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef CategoryExpressionBuilder = _i1.Expression Function(CategoryTable);

class CategoryTable extends _i1.Table {
  CategoryTable() : super(tableName: 'shop_categories');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final parentId = _i1.ColumnInt('parentId');

  final name = _i1.ColumnString('name');

  final description = _i1.ColumnString('description');

  final image = _i1.ColumnString('image');

  final icon = _i1.ColumnString('icon');

  final productsCount = _i1.ColumnInt('productsCount');

  @override
  List<_i1.Column> get columns => [
        id,
        parentId,
        name,
        description,
        image,
        icon,
        productsCount,
      ];
}

@Deprecated('Use CategoryTable.t instead.')
CategoryTable tCategory = CategoryTable();
