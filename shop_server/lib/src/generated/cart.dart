/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class Cart extends _i1.TableRow {
  Cart({
    int? id,
    required this.dateCreated,
    this.items,
  }) : super(id);

  factory Cart.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Cart(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      dateCreated: serializationManager
          .deserialize<DateTime>(jsonSerialization['dateCreated']),
      items: serializationManager
          .deserialize<List<_i2.CartItem>?>(jsonSerialization['items']),
    );
  }

  static final t = CartTable();

  DateTime dateCreated;

  List<_i2.CartItem>? items;

  @override
  String get tableName => 'shop_carts';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateCreated': dateCreated,
      'items': items,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'dateCreated': dateCreated,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'dateCreated': dateCreated,
      'items': items,
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
      case 'dateCreated':
        dateCreated = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Cart>> find(
    _i1.Session session, {
    CartExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Cart>(
      where: where != null ? where(Cart.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Cart?> findSingleRow(
    _i1.Session session, {
    CartExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Cart>(
      where: where != null ? where(Cart.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Cart?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Cart>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required CartExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Cart>(
      where: where(Cart.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Cart row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Cart row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Cart row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    CartExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Cart>(
      where: where != null ? where(Cart.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef CartExpressionBuilder = _i1.Expression Function(CartTable);

class CartTable extends _i1.Table {
  CartTable() : super(tableName: 'shop_carts');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final dateCreated = _i1.ColumnDateTime('dateCreated');

  @override
  List<_i1.Column> get columns => [
        id,
        dateCreated,
      ];
}

@Deprecated('Use CartTable.t instead.')
CartTable tCart = CartTable();
