/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/module.dart' as _i3;
import 'cart.dart' as _i4;
import 'cart_item.dart' as _i5;
import 'category.dart' as _i6;
import 'discount.dart' as _i7;
import 'product.dart' as _i8;
import 'profile.dart' as _i9;
import 'slide_ad.dart' as _i10;
import 'protocol.dart' as _i11;
import 'package:shop_server/src/generated/category.dart' as _i12;
import 'package:shop_server/src/generated/slide_ad.dart' as _i13;
export 'cart.dart';
export 'cart_item.dart';
export 'category.dart';
export 'discount.dart';
export 'product.dart';
export 'profile.dart';
export 'slide_ad.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  static final targetDatabaseDefinition = _i2.DatabaseDefinition(tables: [
    _i2.TableDefinition(
      name: 'shop_carts',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'shop_carts_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'dateCreated',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'shop_carts_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'shop_cart_items',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'shop_cart_items_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'tableId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'addedCount',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'shop_cart_items_fk_0',
          columns: ['tableId'],
          referenceTable: 'shop_carts',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'shop_cart_items_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'shop_categories',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'shop_categories_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'parentId',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'image',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'icon',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'productsCount',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'shop_categories_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'shop_discounts',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'shop_discounts_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'productId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'discountPrice',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'startDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'dueDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'message',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'shop_discounts_fk_0',
          columns: ['productId'],
          referenceTable: 'shop_products',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'shop_discounts_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'shop_products',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'shop_products_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'images',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<String>?',
        ),
        _i2.ColumnDefinition(
          name: 'category',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'protocol:Category',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'shop_products_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'shop_profiles',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'shop_profiles_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'favorites',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<int>',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'shop_profiles_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'shop_banner_ads',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'shop_banner_ads_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'image',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'shop_banner_ads_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetDatabaseDefinition.tables,
    ..._i2.Protocol.targetDatabaseDefinition.tables,
  ]);

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i4.Cart) {
      return _i4.Cart.fromJson(data, this) as T;
    }
    if (t == _i5.CartItem) {
      return _i5.CartItem.fromJson(data, this) as T;
    }
    if (t == _i6.Category) {
      return _i6.Category.fromJson(data, this) as T;
    }
    if (t == _i7.Discount) {
      return _i7.Discount.fromJson(data, this) as T;
    }
    if (t == _i8.Product) {
      return _i8.Product.fromJson(data, this) as T;
    }
    if (t == _i9.Profile) {
      return _i9.Profile.fromJson(data, this) as T;
    }
    if (t == _i10.BannerAd) {
      return _i10.BannerAd.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i4.Cart?>()) {
      return (data != null ? _i4.Cart.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.CartItem?>()) {
      return (data != null ? _i5.CartItem.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i6.Category?>()) {
      return (data != null ? _i6.Category.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i7.Discount?>()) {
      return (data != null ? _i7.Discount.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i8.Product?>()) {
      return (data != null ? _i8.Product.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i9.Profile?>()) {
      return (data != null ? _i9.Profile.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i10.BannerAd?>()) {
      return (data != null ? _i10.BannerAd.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<List<_i11.CartItem>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i11.CartItem>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<_i12.Category>) {
      return (data as List).map((e) => deserialize<_i12.Category>(e)).toList()
          as dynamic;
    }
    if (t == List<_i13.BannerAd>) {
      return (data as List).map((e) => deserialize<_i13.BannerAd>(e)).toList()
          as dynamic;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i4.Cart) {
      return 'Cart';
    }
    if (data is _i5.CartItem) {
      return 'CartItem';
    }
    if (data is _i6.Category) {
      return 'Category';
    }
    if (data is _i7.Discount) {
      return 'Discount';
    }
    if (data is _i8.Product) {
      return 'Product';
    }
    if (data is _i9.Profile) {
      return 'Profile';
    }
    if (data is _i10.BannerAd) {
      return 'BannerAd';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Cart') {
      return deserialize<_i4.Cart>(data['data']);
    }
    if (data['className'] == 'CartItem') {
      return deserialize<_i5.CartItem>(data['data']);
    }
    if (data['className'] == 'Category') {
      return deserialize<_i6.Category>(data['data']);
    }
    if (data['className'] == 'Discount') {
      return deserialize<_i7.Discount>(data['data']);
    }
    if (data['className'] == 'Product') {
      return deserialize<_i8.Product>(data['data']);
    }
    if (data['className'] == 'Profile') {
      return deserialize<_i9.Profile>(data['data']);
    }
    if (data['className'] == 'BannerAd') {
      return deserialize<_i10.BannerAd>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i4.Cart:
        return _i4.Cart.t;
      case _i5.CartItem:
        return _i5.CartItem.t;
      case _i6.Category:
        return _i6.Category.t;
      case _i7.Discount:
        return _i7.Discount.t;
      case _i8.Product:
        return _i8.Product.t;
      case _i9.Profile:
        return _i9.Profile.t;
      case _i10.BannerAd:
        return _i10.BannerAd.t;
    }
    return null;
  }

  @override
  _i2.DatabaseDefinition getTargetDatabaseDefinition() =>
      targetDatabaseDefinition;
}
