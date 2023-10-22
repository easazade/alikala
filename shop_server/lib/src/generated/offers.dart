/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class Offer extends _i1.TableRow {
  Offer({
    int? id,
    required this.productId,
    this.product,
    required this.discountId,
    this.discount,
    required this.expireAt,
    required this.startedAt,
  }) : super(id);

  factory Offer.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Offer(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      productId:
          serializationManager.deserialize<int>(jsonSerialization['productId']),
      product: serializationManager
          .deserialize<_i2.Product?>(jsonSerialization['product']),
      discountId: serializationManager
          .deserialize<int>(jsonSerialization['discountId']),
      discount: serializationManager
          .deserialize<_i2.Discount?>(jsonSerialization['discount']),
      expireAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['expireAt']),
      startedAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['startedAt']),
    );
  }

  static final t = OfferTable();

  int productId;

  _i2.Product? product;

  int discountId;

  _i2.Discount? discount;

  DateTime expireAt;

  DateTime startedAt;

  @override
  String get tableName => 'shop_offers';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'product': product,
      'discountId': discountId,
      'discount': discount,
      'expireAt': expireAt,
      'startedAt': startedAt,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'productId': productId,
      'discountId': discountId,
      'expireAt': expireAt,
      'startedAt': startedAt,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'productId': productId,
      'product': product,
      'discountId': discountId,
      'discount': discount,
      'expireAt': expireAt,
      'startedAt': startedAt,
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
      case 'productId':
        productId = value;
        return;
      case 'discountId':
        discountId = value;
        return;
      case 'expireAt':
        expireAt = value;
        return;
      case 'startedAt':
        startedAt = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Offer>> find(
    _i1.Session session, {
    OfferExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Offer>(
      where: where != null ? where(Offer.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Offer?> findSingleRow(
    _i1.Session session, {
    OfferExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Offer>(
      where: where != null ? where(Offer.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Offer?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Offer>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required OfferExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Offer>(
      where: where(Offer.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Offer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Offer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Offer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    OfferExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Offer>(
      where: where != null ? where(Offer.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef OfferExpressionBuilder = _i1.Expression Function(OfferTable);

class OfferTable extends _i1.Table {
  OfferTable() : super(tableName: 'shop_offers');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final productId = _i1.ColumnInt('productId');

  final discountId = _i1.ColumnInt('discountId');

  final expireAt = _i1.ColumnDateTime('expireAt');

  final startedAt = _i1.ColumnDateTime('startedAt');

  @override
  List<_i1.Column> get columns => [
        id,
        productId,
        discountId,
        expireAt,
        startedAt,
      ];
}

@Deprecated('Use OfferTable.t instead.')
OfferTable tOffer = OfferTable();
