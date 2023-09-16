/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'discount.dart' as _i2;
import 'product.dart' as _i3;
import 'slide_ad.dart' as _i4;
import 'package:shop_client/src/protocol/slide_ad.dart' as _i5;
import 'package:serverpod_auth_client/module.dart' as _i6;
export 'discount.dart';
export 'product.dart';
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
    if (t == _i2.Discount) {
      return _i2.Discount.fromJson(data, this) as T;
    }
    if (t == _i3.Product) {
      return _i3.Product.fromJson(data, this) as T;
    }
    if (t == _i4.BannerAd) {
      return _i4.BannerAd.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Discount?>()) {
      return (data != null ? _i2.Discount.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.Product?>()) {
      return (data != null ? _i3.Product.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.BannerAd?>()) {
      return (data != null ? _i4.BannerAd.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i5.BannerAd>) {
      return (data as List).map((e) => deserialize<_i5.BannerAd>(e)).toList()
          as dynamic;
    }
    try {
      return _i6.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i6.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.Discount) {
      return 'Discount';
    }
    if (data is _i3.Product) {
      return 'Product';
    }
    if (data is _i4.BannerAd) {
      return 'BannerAd';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i6.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Discount') {
      return deserialize<_i2.Discount>(data['data']);
    }
    if (data['className'] == 'Product') {
      return deserialize<_i3.Product>(data['data']);
    }
    if (data['className'] == 'BannerAd') {
      return deserialize<_i4.BannerAd>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
