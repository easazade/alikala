import 'package:alikala/features/home/home_page.dart';
import 'package:mockito/mockito.dart' as mockito;
import 'package:mockito/mockito.dart';
import 'package:sailor/sailor.dart';

import 'constants.dart';

///global instance object of the Sailor class created for this app
///this object provides all solution for navigation purposes like defining page routes
///navigating to different pages
Sailor sailor;

/// mock version of the sailor class used only for testing purposes
class MockSailor extends Mock implements Sailor {
  static verifyPushAndRemove(String routeName) {
    mockito
        .verify(
          sailor.navigate(
            routeName,
            args: mockito.anyNamed('args'),
            navigationType: mockito.anyNamed('navigationType'),
            removeUntilPredicate: mockito.anyNamed('removeUntilPredicate'),
          ),
        )
        .called(1);
  }

  MockSailor() {
//    mockito.when(this.navigate(mockito.any)).thenAnswer((_) => Future.value());
//    mockito
//        .when(this.pushAndRemoveUntilRoute(mockito.any, mockito.any,
//            arg: mockito.anyNamed('arg')))
//        .thenAnswer((_) => Future.value());
  }
}

class NavigationConfig {
  ///defining all the routes to all pages
  ///defining a page routes adds a solution to navigate to that page later
  ///this method must be called once during app initialization
  static void createRoutes() {
    sailor.addRoutes(
      <SailorRoute>[
        SailorRoute(name: Routes.HOME, builder: (context, arg, params) => HomePage()),
//        SailorRoute(
//          name: Routes.HOME,
//          builder: (context, arg, params) => BlocProvider<HomeBloc>(
//            create: (context) => getIt.newHomeBloc(),
//            child: HomePage(),
//          ),
//        ),
      ],
    );
  }
}
