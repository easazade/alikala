/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class CartItem extends _i1.TableRow {
  CartItem({
    int? id,
    required this.tableId,
    this.product,
    required this.addedCount,
  }) : super(id);

  factory CartItem.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return CartItem(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      tableId:
          serializationManager.deserialize<int>(jsonSerialization['tableId']),
      product: serializationManager
          .deserialize<_i2.Product?>(jsonSerialization['product']),
      addedCount: serializationManager
          .deserialize<int>(jsonSerialization['addedCount']),
    );
  }

  static final t = CartItemTable();

  int tableId;

  _i2.Product? product;

  int addedCount;

  @override
  String get tableName => 'shop_cart_items';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tableId': tableId,
      'product': product,
      'addedCount': addedCount,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'tableId': tableId,
      'addedCount': addedCount,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'tableId': tableId,
      'product': product,
      'addedCount': addedCount,
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
      case 'tableId':
        tableId = value;
        return;
      case 'addedCount':
        addedCount = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<CartItem>> find(
    _i1.Session session, {
    CartItemExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<CartItem>(
      where: where != null ? where(CartItem.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<CartItem?> findSingleRow(
    _i1.Session session, {
    CartItemExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<CartItem>(
      where: where != null ? where(CartItem.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<CartItem?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<CartItem>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required CartItemExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CartItem>(
      where: where(CartItem.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    CartItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    CartItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    CartItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    CartItemExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CartItem>(
      where: where != null ? where(CartItem.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef CartItemExpressionBuilder = _i1.Expression Function(CartItemTable);

class CartItemTable extends _i1.Table {
  CartItemTable() : super(tableName: 'shop_cart_items');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final tableId = _i1.ColumnInt('tableId');

  final addedCount = _i1.ColumnInt('addedCount');

  @override
  List<_i1.Column> get columns => [
        id,
        tableId,
        addedCount,
      ];
}

@Deprecated('Use CartItemTable.t instead.')
CartItemTable tCartItem = CartItemTable();
