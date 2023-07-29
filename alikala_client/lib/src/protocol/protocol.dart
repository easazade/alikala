/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'category.dart' as _i2;
import 'comment.dart' as _i3;
import 'deal.dart' as _i4;
import 'product.dart' as _i5;
export 'category.dart';
export 'comment.dart';
export 'deal.dart';
export 'product.dart';
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
    if (t == _i2.Category) {
      return _i2.Category.fromJson(data, this) as T;
    }
    if (t == _i3.Comment) {
      return _i3.Comment.fromJson(data, this) as T;
    }
    if (t == _i4.Deal) {
      return _i4.Deal.fromJson(data, this) as T;
    }
    if (t == _i5.Product) {
      return _i5.Product.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Category?>()) {
      return (data != null ? _i2.Category.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.Comment?>()) {
      return (data != null ? _i3.Comment.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.Deal?>()) {
      return (data != null ? _i4.Deal.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.Product?>()) {
      return (data != null ? _i5.Product.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.Category) {
      return 'Category';
    }
    if (data is _i3.Comment) {
      return 'Comment';
    }
    if (data is _i4.Deal) {
      return 'Deal';
    }
    if (data is _i5.Product) {
      return 'Product';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Category') {
      return deserialize<_i2.Category>(data['data']);
    }
    if (data['className'] == 'Comment') {
      return deserialize<_i3.Comment>(data['data']);
    }
    if (data['className'] == 'Deal') {
      return deserialize<_i4.Deal>(data['data']);
    }
    if (data['className'] == 'Product') {
      return deserialize<_i5.Product>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
