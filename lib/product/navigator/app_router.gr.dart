// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomeView());
    },
    MealListRoute.name: (routeData) {
      final args = routeData.argsAs<MealListRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              MealListView(type: args.type, query: args.query, key: args.key));
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData, child: DetailView(id: args.id, key: args.key));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: 'home', fullMatch: true),
        RouteConfig(HomeRoute.name, path: 'home'),
        RouteConfig(MealListRoute.name, path: 'filter/:type/:query'),
        RouteConfig(DetailRoute.name, path: 'detail/:id')
      ];
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [MealListView]
class MealListRoute extends PageRouteInfo<MealListRouteArgs> {
  MealListRoute({required String type, required String query, Key? key})
      : super(MealListRoute.name,
            path: 'filter/:type/:query',
            args: MealListRouteArgs(type: type, query: query, key: key));

  static const String name = 'MealListRoute';
}

class MealListRouteArgs {
  const MealListRouteArgs({required this.type, required this.query, this.key});

  final String type;

  final String query;

  final Key? key;

  @override
  String toString() {
    return 'MealListRouteArgs{type: $type, query: $query, key: $key}';
  }
}

/// generated route for
/// [DetailView]
class DetailRoute extends PageRouteInfo<DetailRouteArgs> {
  DetailRoute({required String id, Key? key})
      : super(DetailRoute.name,
            path: 'detail/:id', args: DetailRouteArgs(id: id, key: key));

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs({required this.id, this.key});

  final String id;

  final Key? key;

  @override
  String toString() {
    return 'DetailRouteArgs{id: $id, key: $key}';
  }
}
