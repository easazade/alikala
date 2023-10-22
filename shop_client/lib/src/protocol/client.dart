/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:shop_client/src/protocol/cart.dart' as _i3;
import 'package:shop_client/src/protocol/category.dart' as _i4;
import 'package:shop_client/src/protocol/offers.dart' as _i5;
import 'package:shop_client/src/protocol/slide_ad.dart' as _i6;
import 'package:shop_client/src/protocol/product.dart' as _i7;
import 'package:serverpod_auth_client/module.dart' as _i8;
import 'dart:io' as _i9;
import 'protocol.dart' as _i10;

class _EndpointCarts extends _i1.EndpointRef {
  _EndpointCarts(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'carts';

  /// always returns one carts. if there isn't none. it will create a new cart and returns
  _i2.Future<_i3.Cart> getCart() => caller.callServerEndpoint<_i3.Cart>(
        'carts',
        'getCart',
        {},
      );

  /// updates [cartItem] if cart item has id if not creates a new instance in database
  /// and returns the updated [Cart] object
  _i2.Future<_i3.Cart> updateCartItems(
    int productId,
    int count,
  ) =>
      caller.callServerEndpoint<_i3.Cart>(
        'carts',
        'updateCartItems',
        {
          'productId': productId,
          'count': count,
        },
      );
}

class _EndpointCategories extends _i1.EndpointRef {
  _EndpointCategories(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'categories';

  _i2.Future<List<_i4.Category>> getCategories() =>
      caller.callServerEndpoint<List<_i4.Category>>(
        'categories',
        'getCategories',
        {},
      );
}

class _EndpointOffers extends _i1.EndpointRef {
  _EndpointOffers(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'offers';

  _i2.Future<List<_i5.Offer>> getOffers() =>
      caller.callServerEndpoint<List<_i5.Offer>>(
        'offers',
        'getOffers',
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
}

class _EndpointUsers extends _i1.EndpointRef {
  _EndpointUsers(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'users';

  _i2.Future<List<_i7.Product>> getFavoriteItems() =>
      caller.callServerEndpoint<List<_i7.Product>>(
        'users',
        'getFavoriteItems',
        {},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i8.Caller(client);
  }

  late final _i8.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i9.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i10.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    carts = _EndpointCarts(this);
    categories = _EndpointCategories(this);
    offers = _EndpointOffers(this);
    bannerAds = _EndpointBannerAds(this);
    users = _EndpointUsers(this);
    modules = _Modules(this);
  }

  late final _EndpointCarts carts;

  late final _EndpointCategories categories;

  late final _EndpointOffers offers;

  late final _EndpointBannerAds bannerAds;

  late final _EndpointUsers users;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'carts': carts,
        'categories': categories,
        'offers': offers,
        'bannerAds': bannerAds,
        'users': users,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
