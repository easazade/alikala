/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/categories_endpoint.dart' as _i2;
import '../endpoints/slide_ad_endpoint.dart' as _i3;
import 'package:serverpod_auth_server/module.dart' as _i4;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'categories': _i2.Categories()
        ..initialize(
          server,
          'categories',
          null,
        ),
      'bannerAds': _i3.BannerAdsEndpoint()
        ..initialize(
          server,
          'bannerAds',
          null,
        ),
    };
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
              (endpoints['categories'] as _i2.Categories)
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
              (endpoints['bannerAds'] as _i3.BannerAdsEndpoint)
                  .getSlides(session),
        ),
        'ssssssss': _i1.MethodConnector(
          name: 'ssssssss',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bannerAds'] as _i3.BannerAdsEndpoint)
                  .ssssssss(session),
        ),
      },
    );
    modules['serverpod_auth'] = _i4.Endpoints()..initializeEndpoints(server);
  }
}
