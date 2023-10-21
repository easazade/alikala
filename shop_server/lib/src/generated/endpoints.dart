/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/carts_endpoint.dart' as _i2;
import '../endpoints/categories_endpoint.dart' as _i3;
import '../endpoints/slide_ads_endpoint.dart' as _i4;
import '../endpoints/users_endpoint.dart' as _i5;
import 'package:serverpod_auth_server/module.dart' as _i6;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'carts': _i2.Carts()
        ..initialize(
          server,
          'carts',
          null,
        ),
      'categories': _i3.Categories()
        ..initialize(
          server,
          'categories',
          null,
        ),
      'bannerAds': _i4.BannerAds()
        ..initialize(
          server,
          'bannerAds',
          null,
        ),
      'users': _i5.Users()
        ..initialize(
          server,
          'users',
          null,
        ),
    };
    connectors['carts'] = _i1.EndpointConnector(
      name: 'carts',
      endpoint: endpoints['carts']!,
      methodConnectors: {
        'getCart': _i1.MethodConnector(
          name: 'getCart',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['carts'] as _i2.Carts).getCart(session),
        ),
        'updateCartItems': _i1.MethodConnector(
          name: 'updateCartItems',
          params: {
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'count': _i1.ParameterDescription(
              name: 'count',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['carts'] as _i2.Carts).updateCartItems(
            session,
            params['productId'],
            params['count'],
          ),
        ),
      },
    );
    connectors['categories'] = _i1.EndpointConnector(
      name: 'categories',
      endpoint: endpoints['categories']!,
      methodConnectors: {
        'getCategories': _i1.MethodConnector(
          name: 'getCategories',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['categories'] as _i3.Categories)
                  .getCategories(session),
        )
      },
    );
    connectors['bannerAds'] = _i1.EndpointConnector(
      name: 'bannerAds',
      endpoint: endpoints['bannerAds']!,
      methodConnectors: {
        'getSlides': _i1.MethodConnector(
          name: 'getSlides',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bannerAds'] as _i4.BannerAds).getSlides(session),
        )
      },
    );
    connectors['users'] = _i1.EndpointConnector(
      name: 'users',
      endpoint: endpoints['users']!,
      methodConnectors: {
        'getFavoriteItems': _i1.MethodConnector(
          name: 'getFavoriteItems',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['users'] as _i5.Users).getFavoriteItems(session),
        )
      },
    );
    modules['serverpod_auth'] = _i6.Endpoints()..initializeEndpoints(server);
  }
}
