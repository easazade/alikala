/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Product extends _i1.TableRow {
  Product({
    int? id,
    required this.title,
    this.images,
    required this.price,
    this.offPrice,
    this.colorHex,
    this.colorName,
    required this.dueDate,
  }) : super(id);

  factory Product.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Product(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      images: serializationManager
          .deserialize<List<String>?>(jsonSerialization['images']),
      price: serializationManager.deserialize<int>(jsonSerialization['price']),
      offPrice:
          serializationManager.deserialize<int?>(jsonSerialization['offPrice']),
      colorHex:
          serializationManager.deserialize<int?>(jsonSerialization['colorHex']),
      colorName: serializationManager
          .deserialize<String?>(jsonSerialization['colorName']),
      dueDate: serializationManager
          .deserialize<DateTime>(jsonSerialization['dueDate']),
    );
  }

  static final t = ProductTable();

  String title;

  List<String>? images;

  int price;

  int? offPrice;

  int? colorHex;

  String? colorName;

  DateTime dueDate;

  @override
  String get tableName => 'products';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'images': images,
      'price': price,
      'offPrice': offPrice,
      'colorHex': colorHex,
      'colorName': colorName,
      'dueDate': dueDate,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'offPrice': offPrice,
      'colorHex': colorHex,
      'colorName': colorName,
      'dueDate': dueDate,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'title': title,
      'images': images,
      'price': price,
      'offPrice': offPrice,
      'colorHex': colorHex,
      'colorName': colorName,
      'dueDate': dueDate,
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
      case 'colorHex':
        colorHex = value;
        return;
      case 'colorName':
        colorName = value;
        return;
      case 'dueDate':
        dueDate = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Product>> find(
    _i1.Session session, {
    ProductExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Product>(
      where: where != null ? where(Product.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Product?> findSingleRow(
    _i1.Session session, {
    ProductExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Product>(
      where: where != null ? where(Product.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Product?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Product>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required ProductExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Product>(
      where: where(Product.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Product row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Product row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Product row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    ProductExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Product>(
      where: where != null ? where(Product.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef ProductExpressionBuilder = _i1.Expression Function(ProductTable);

class ProductTable extends _i1.Table {
  ProductTable() : super(tableName: 'products');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final title = _i1.ColumnString('title');

  final price = _i1.ColumnInt('price');

  final offPrice = _i1.ColumnInt('offPrice');

  final colorHex = _i1.ColumnInt('colorHex');

  final colorName = _i1.ColumnString('colorName');

  final dueDate = _i1.ColumnDateTime('dueDate');

  @override
  List<_i1.Column> get columns => [
        id,
        title,
        price,
        offPrice,
        colorHex,
        colorName,
        dueDate,
      ];
}

@Deprecated('Use ProductTable.t instead.')
ProductTable tProduct = ProductTable();
