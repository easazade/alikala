/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class SlideAd extends _i1.TableRow {
  SlideAd({
    int? id,
    this.title,
    this.description,
    this.image,
  }) : super(id);

  factory SlideAd.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return SlideAd(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      title:
          serializationManager.deserialize<String?>(jsonSerialization['title']),
      description: serializationManager
          .deserialize<String?>(jsonSerialization['description']),
      image:
          serializationManager.deserialize<String?>(jsonSerialization['image']),
    );
  }

  static final t = SlideAdTable();

  String? title;

  String? description;

  String? image;

  @override
  String get tableName => 'shop_slide_ads';
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

  static Future<List<SlideAd>> find(
    _i1.Session session, {
    SlideAdExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<SlideAd>(
      where: where != null ? where(SlideAd.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<SlideAd?> findSingleRow(
    _i1.Session session, {
    SlideAdExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<SlideAd>(
      where: where != null ? where(SlideAd.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<SlideAd?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<SlideAd>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required SlideAdExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SlideAd>(
      where: where(SlideAd.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    SlideAd row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    SlideAd row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    SlideAd row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    SlideAdExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SlideAd>(
      where: where != null ? where(SlideAd.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef SlideAdExpressionBuilder = _i1.Expression Function(SlideAdTable);

class SlideAdTable extends _i1.Table {
  SlideAdTable() : super(tableName: 'shop_slide_ads');

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

@Deprecated('Use SlideAdTable.t instead.')
SlideAdTable tSlideAd = SlideAdTable();
