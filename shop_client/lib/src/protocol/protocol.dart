/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'cart.dart' as _i2;
import 'cart_item.dart' as _i3;
import 'category.dart' as _i4;
import 'discount.dart' as _i5;
import 'product.dart' as _i6;
import 'profile.dart' as _i7;
import 'slide_ad.dart' as _i8;
import 'protocol.dart' as _i9;
import 'package:shop_client/src/protocol/category.dart' as _i10;
import 'package:shop_client/src/protocol/slide_ad.dart' as _i11;
import 'package:serverpod_auth_client/module.dart' as _i12;
export 'cart.dart';
export 'cart_item.dart';
export 'category.dart';
export 'discount.dart';
export 'product.dart';
export 'profile.dart';
export 'slide_ad.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.Cart) {
      return _i2.Cart.fromJson(data, this) as T;
    }
    if (t == _i3.CartItem) {
      return _i3.CartItem.fromJson(data, this) as T;
    }
    if (t == _i4.Category) {
      return _i4.Category.fromJson(data, this) as T;
    }
    if (t == _i5.Discount) {
      return _i5.Discount.fromJson(data, this) as T;
    }
    if (t == _i6.Product) {
      return _i6.Product.fromJson(data, this) as T;
    }
    if (t == _i7.Profile) {
      return _i7.Profile.fromJson(data, this) as T;
    }
    if (t == _i8.BannerAd) {
      return _i8.BannerAd.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Cart?>()) {
      return (data != null ? _i2.Cart.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.CartItem?>()) {
      return (data != null ? _i3.CartItem.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.Category?>()) {
      return (data != null ? _i4.Category.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.Discount?>()) {
      return (data != null ? _i5.Discount.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i6.Product?>()) {
      return (data != null ? _i6.Product.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i7.Profile?>()) {
      return (data != null ? _i7.Profile.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i8.BannerAd?>()) {
      return (data != null ? _i8.BannerAd.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<List<_i9.CartItem>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i9.CartItem>(e)).toList()
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
    if (t == List<_i10.Category>) {
      return (data as List).map((e) => deserialize<_i10.Category>(e)).toList()
          as dynamic;
    }
    if (t == List<_i11.BannerAd>) {
      return (data as List).map((e) => deserialize<_i11.BannerAd>(e)).toList()
          as dynamic;
    }
    try {
      return _i12.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i12.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.Cart) {
      return 'Cart';
    }
    if (data is _i3.CartItem) {
      return 'CartItem';
    }
    if (data is _i4.Category) {
      return 'Category';
    }
    if (data is _i5.Discount) {
      return 'Discount';
    }
    if (data is _i6.Product) {
      return 'Product';
    }
    if (data is _i7.Profile) {
      return 'Profile';
    }
    if (data is _i8.BannerAd) {
      return 'BannerAd';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i12.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Cart') {
      return deserialize<_i2.Cart>(data['data']);
    }
    if (data['className'] == 'CartItem') {
      return deserialize<_i3.CartItem>(data['data']);
    }
    if (data['className'] == 'Category') {
      return deserialize<_i4.Category>(data['data']);
    }
    if (data['className'] == 'Discount') {
      return deserialize<_i5.Discount>(data['data']);
    }
    if (data['className'] == 'Product') {
      return deserialize<_i6.Product>(data['data']);
    }
    if (data['className'] == 'Profile') {
      return deserialize<_i7.Profile>(data['data']);
    }
    if (data['className'] == 'BannerAd') {
      return deserialize<_i8.BannerAd>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
