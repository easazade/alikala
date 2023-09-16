/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Discount extends _i1.TableRow {
  Discount({
    int? id,
    required this.discountPrice,
    required this.startDate,
    required this.dueDate,
    required this.message,
  }) : super(id);

  factory Discount.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Discount(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
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

  static final t = DiscountTable();

  double discountPrice;

  DateTime startDate;

  DateTime dueDate;

  String message;

  @override
  String get tableName => 'shop_discounts';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'discountPrice': discountPrice,
      'startDate': startDate,
      'dueDate': dueDate,
      'message': message,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'discountPrice': discountPrice,
      'startDate': startDate,
      'dueDate': dueDate,
      'message': message,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'discountPrice': discountPrice,
      'startDate': startDate,
      'dueDate': dueDate,
      'message': message,
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
      case 'discountPrice':
        discountPrice = value;
        return;
      case 'startDate':
        startDate = value;
        return;
      case 'dueDate':
        dueDate = value;
        return;
      case 'message':
        message = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Discount>> find(
    _i1.Session session, {
    DiscountExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Discount>(
      where: where != null ? where(Discount.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Discount?> findSingleRow(
    _i1.Session session, {
    DiscountExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Discount>(
      where: where != null ? where(Discount.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Discount?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Discount>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required DiscountExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Discount>(
      where: where(Discount.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Discount row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Discount row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Discount row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    DiscountExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Discount>(
      where: where != null ? where(Discount.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef DiscountExpressionBuilder = _i1.Expression Function(DiscountTable);

class DiscountTable extends _i1.Table {
  DiscountTable() : super(tableName: 'shop_discounts');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final discountPrice = _i1.ColumnDouble('discountPrice');

  final startDate = _i1.ColumnDateTime('startDate');

  final dueDate = _i1.ColumnDateTime('dueDate');

  final message = _i1.ColumnString('message');

  @override
  List<_i1.Column> get columns => [
        id,
        discountPrice,
        startDate,
        dueDate,
        message,
      ];
}

@Deprecated('Use DiscountTable.t instead.')
DiscountTable tDiscount = DiscountTable();
