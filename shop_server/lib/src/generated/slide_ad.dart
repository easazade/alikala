/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class BannerAd extends _i1.TableRow {
  BannerAd({
    int? id,
    this.title,
    this.description,
    this.image,
  }) : super(id);

  factory BannerAd.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return BannerAd(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      title:
          serializationManager.deserialize<String?>(jsonSerialization['title']),
      description: serializationManager
          .deserialize<String?>(jsonSerialization['description']),
      image:
          serializationManager.deserialize<String?>(jsonSerialization['image']),
    );
  }

  static final t = BannerAdTable();

  String? title;

  String? description;

  String? image;

  @override
  String get tableName => 'shop_banner_ads';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
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
      case 'title':
        title = value;
        return;
      case 'description':
        description = value;
        return;
      case 'image':
        image = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<BannerAd>> find(
    _i1.Session session, {
    BannerAdExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<BannerAd>(
      where: where != null ? where(BannerAd.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<BannerAd?> findSingleRow(
    _i1.Session session, {
    BannerAdExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<BannerAd>(
      where: where != null ? where(BannerAd.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<BannerAd?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<BannerAd>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required BannerAdExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<BannerAd>(
      where: where(BannerAd.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    BannerAd row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    BannerAd row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    BannerAd row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    BannerAdExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<BannerAd>(
      where: where != null ? where(BannerAd.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef BannerAdExpressionBuilder = _i1.Expression Function(BannerAdTable);

class BannerAdTable extends _i1.Table {
  BannerAdTable() : super(tableName: 'shop_banner_ads');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final title = _i1.ColumnString('title');

  final description = _i1.ColumnString('description');

  final image = _i1.ColumnString('image');

  @override
  List<_i1.Column> get columns => [
        id,
        title,
        description,
        image,
      ];
}

@Deprecated('Use BannerAdTable.t instead.')
BannerAdTable tBannerAd = BannerAdTable();
