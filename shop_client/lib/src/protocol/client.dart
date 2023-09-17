/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:shop_client/src/protocol/cart.dart' as _i3;
import 'package:shop_client/src/protocol/cart_item.dart' as _i4;
import 'package:shop_client/src/protocol/category.dart' as _i5;
import 'package:shop_client/src/protocol/slide_ad.dart' as _i6;
import 'package:serverpod_auth_client/module.dart' as _i7;
import 'dart:io' as _i8;
import 'protocol.dart' as _i9;

class _EndpointCarts extends _i1.EndpointRef {
  _EndpointCarts(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'carts';

  _i2.Future<_i3.Cart> getCart() => caller.callServerEndpoint<_i3.Cart>(
        'carts',
        'getCart',
        {},
      );

  /// updates [cartItem] if cart item has id if not creates a new instance in database
  /// and returns the result.
  _i2.Future<_i4.CartItem> addOrUpdateCartItem(_i4.CartItem cartItem) =>
      caller.callServerEndpoint<_i4.CartItem>(
        'carts',
        'addOrUpdateCartItem',
        {'cartItem': cartItem},
      );
}

class _EndpointCategories extends _i1.EndpointRef {
  _EndpointCategories(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'categories';

  _i2.Future<List<_i5.Category>> getCategories() =>
      caller.callServerEndpoint<List<_i5.Category>>(
        'categories',
        'getCategories',
        {},
      );
}

class _EndpointBannerAds extends _i1.EndpointRef {
  _EndpointBannerAds(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'bannerAds';

  _i2.Future<List<_i6.BannerAd>> getSlides() =>
      caller.callServerEndpoint<List<_i6.BannerAd>>(
        'bannerAds',
        'getSlides',
        {},
      );

  _i2.Future<List<_i6.BannerAd>> ssssssss() =>
      caller.callServerEndpoint<List<_i6.BannerAd>>(
        'bannerAds',
        'ssssssss',
        {},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i7.Caller(client);
  }

  late final _i7.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i8.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i9.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    carts = _EndpointCarts(this);
    categories = _EndpointCategories(this);
    bannerAds = _EndpointBannerAds(this);
    modules = _Modules(this);
  }

  late final _EndpointCarts carts;

  late final _EndpointCategories categories;

  late final _EndpointBannerAds bannerAds;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'carts': carts,
        'categories': categories,
        'bannerAds': bannerAds,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
