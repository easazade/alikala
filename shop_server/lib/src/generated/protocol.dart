/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/module.dart' as _i3;
import 'api_exception.dart' as _i4;
import 'cart.dart' as _i5;
import 'cart_item.dart' as _i6;
import 'category.dart' as _i7;
import 'discount.dart' as _i8;
import 'error_type.dart' as _i9;
import 'offers.dart' as _i10;
import 'product.dart' as _i11;
import 'profile.dart' as _i12;
import 'slide_ad.dart' as _i13;
import 'protocol.dart' as _i14;
import 'package:shop_server/src/generated/category.dart' as _i15;
import 'package:shop_server/src/generated/offers.dart' as _i16;
import 'package:shop_server/src/generated/slide_ad.dart' as _i17;
import 'package:shop_server/src/generated/product.dart' as _i18;
export 'api_exception.dart';
export 'cart.dart';
export 'cart_item.dart';
export 'category.dart';
export 'discount.dart';
export 'error_type.dart';
export 'offers.dart';
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
          name: 'userId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
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
          name: 'cartId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'productId',
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
          columns: ['cartId'],
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
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
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
      name: 'shop_offers',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'shop_offers_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'productId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'discountId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'expireAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'startedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'shop_offers_pkey',
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
          name: 'price',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
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
    if (t == _i4.ApiException) {
      return _i4.ApiException.fromJson(data, this) as T;
    }
    if (t == _i5.Cart) {
      return _i5.Cart.fromJson(data, this) as T;
    }
    if (t == _i6.CartItem) {
      return _i6.CartItem.fromJson(data, this) as T;
    }
    if (t == _i7.Category) {
      return _i7.Category.fromJson(data, this) as T;
    }
    if (t == _i8.Discount) {
      return _i8.Discount.fromJson(data, this) as T;
    }
    if (t == _i9.ErrorType) {
      return _i9.ErrorType.fromJson(data) as T;
    }
    if (t == _i10.Offer) {
      return _i10.Offer.fromJson(data, this) as T;
    }
    if (t == _i11.Product) {
      return _i11.Product.fromJson(data, this) as T;
    }
    if (t == _i12.Profile) {
      return _i12.Profile.fromJson(data, this) as T;
    }
    if (t == _i13.BannerAd) {
      return _i13.BannerAd.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i4.ApiException?>()) {
      return (data != null ? _i4.ApiException.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.Cart?>()) {
      return (data != null ? _i5.Cart.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i6.CartItem?>()) {
      return (data != null ? _i6.CartItem.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i7.Category?>()) {
      return (data != null ? _i7.Category.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i8.Discount?>()) {
      return (data != null ? _i8.Discount.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i9.ErrorType?>()) {
      return (data != null ? _i9.ErrorType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Offer?>()) {
      return (data != null ? _i10.Offer.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i11.Product?>()) {
      return (data != null ? _i11.Product.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i12.Profile?>()) {
      return (data != null ? _i12.Profile.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i13.BannerAd?>()) {
      return (data != null ? _i13.BannerAd.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<List<_i14.CartItem>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i14.CartItem>(e)).toList()
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
    if (t == List<_i15.Category>) {
      return (data as List).map((e) => deserialize<_i15.Category>(e)).toList()
          as dynamic;
    }
    if (t == List<_i16.Offer>) {
      return (data as List).map((e) => deserialize<_i16.Offer>(e)).toList()
          as dynamic;
    }
    if (t == List<_i17.BannerAd>) {
      return (data as List).map((e) => deserialize<_i17.BannerAd>(e)).toList()
          as dynamic;
    }
    if (t == List<_i18.Product>) {
      return (data as List).map((e) => deserialize<_i18.Product>(e)).toList()
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
    if (data is _i4.ApiException) {
      return 'ApiException';
    }
    if (data is _i5.Cart) {
      return 'Cart';
    }
    if (data is _i6.CartItem) {
      return 'CartItem';
    }
    if (data is _i7.Category) {
      return 'Category';
    }
    if (data is _i8.Discount) {
      return 'Discount';
    }
    if (data is _i9.ErrorType) {
      return 'ErrorType';
    }
    if (data is _i10.Offer) {
      return 'Offer';
    }
    if (data is _i11.Product) {
      return 'Product';
    }
    if (data is _i12.Profile) {
      return 'Profile';
    }
    if (data is _i13.BannerAd) {
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
    if (data['className'] == 'ApiException') {
      return deserialize<_i4.ApiException>(data['data']);
    }
    if (data['className'] == 'Cart') {
      return deserialize<_i5.Cart>(data['data']);
    }
    if (data['className'] == 'CartItem') {
      return deserialize<_i6.CartItem>(data['data']);
    }
    if (data['className'] == 'Category') {
      return deserialize<_i7.Category>(data['data']);
    }
    if (data['className'] == 'Discount') {
      return deserialize<_i8.Discount>(data['data']);
    }
    if (data['className'] == 'ErrorType') {
      return deserialize<_i9.ErrorType>(data['data']);
    }
    if (data['className'] == 'Offer') {
      return deserialize<_i10.Offer>(data['data']);
    }
    if (data['className'] == 'Product') {
      return deserialize<_i11.Product>(data['data']);
    }
    if (data['className'] == 'Profile') {
      return deserialize<_i12.Profile>(data['data']);
    }
    if (data['className'] == 'BannerAd') {
      return deserialize<_i13.BannerAd>(data['data']);
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
      case _i5.Cart:
        return _i5.Cart.t;
      case _i6.CartItem:
        return _i6.CartItem.t;
      case _i7.Category:
        return _i7.Category.t;
      case _i8.Discount:
        return _i8.Discount.t;
      case _i10.Offer:
        return _i10.Offer.t;
      case _i11.Product:
        return _i11.Product.t;
      case _i12.Profile:
        return _i12.Profile.t;
      case _i13.BannerAd:
        return _i13.BannerAd.t;
    }
    return null;
  }

  @override
  _i2.DatabaseDefinition getTargetDatabaseDefinition() =>
      targetDatabaseDefinition;
}
