/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Deal extends _i1.TableRow {
  Deal({
    int? id,
    required this.title,
    required this.price,
    this.offPrice,
    required this.dueDate,
    this.image,
  }) : super(id);

  factory Deal.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Deal(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      price: serializationManager.deserialize<int>(jsonSerialization['price']),
      offPrice:
          serializationManager.deserialize<int?>(jsonSerialization['offPrice']),
      dueDate: serializationManager
          .deserialize<DateTime>(jsonSerialization['dueDate']),
      image:
          serializationManager.deserialize<String?>(jsonSerialization['image']),
    );
  }

  static final t = DealTable();

  String title;

  int price;

  int? offPrice;

  DateTime dueDate;

  String? image;

  @override
  String get tableName => 'deals';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'offPrice': offPrice,
      'dueDate': dueDate,
      'image': image,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'offPrice': offPrice,
      'dueDate': dueDate,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'offPrice': offPrice,
      'dueDate': dueDate,
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
      case 'price':
        price = value;
        return;
      case 'offPrice':
        offPrice = value;
        return;
      case 'dueDate':
        dueDate = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Deal>> find(
    _i1.Session session, {
    DealExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Deal>(
      where: where != null ? where(Deal.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Deal?> findSingleRow(
    _i1.Session session, {
    DealExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Deal>(
      where: where != null ? where(Deal.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Deal?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Deal>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required DealExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Deal>(
      where: where(Deal.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Deal row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Deal row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Deal row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    DealExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Deal>(
      where: where != null ? where(Deal.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef DealExpressionBuilder = _i1.Expression Function(DealTable);

class DealTable extends _i1.Table {
  DealTable() : super(tableName: 'deals');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final title = _i1.ColumnString('title');

  final price = _i1.ColumnInt('price');

  final offPrice = _i1.ColumnInt('offPrice');

  final dueDate = _i1.ColumnDateTime('dueDate');

  @override
  List<_i1.Column> get columns => [
        id,
        title,
        price,
        offPrice,
        dueDate,
      ];
}

@Deprecated('Use DealTable.t instead.')
DealTable tDeal = DealTable();
