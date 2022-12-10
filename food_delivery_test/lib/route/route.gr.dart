// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/material.dart' as _i9;

import '../ui/basket/basket_view.dart' as _i7;
import '../ui/categories/categories_view.dart' as _i3;
import '../ui/favorites/favorites_view.dart' as _i6;
import '../ui/master/master_view.dart' as _i1;
import '../ui/meal_detail/meal_detail_view.dart' as _i5;
import '../ui/meals/meals_view.dart' as _i4;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState> navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    MasterRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.MasterView(),
      );
    },
    CategoriesRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    FavoritesRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    BasketRouter.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    CategoriesRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.CategoriesView(),
      );
    },
    MealsRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.MealsView(),
      );
    },
    MealDetailRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.MealDetailView(),
      );
    },
    FavoritesRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.FavoritesView(),
      );
    },
    BasketRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.BasketView(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          MasterRouter.name,
          path: '/',
          children: [
            _i8.RouteConfig(
              CategoriesRouter.name,
              path: 'categories',
              parent: MasterRouter.name,
              children: [
                _i8.RouteConfig(
                  CategoriesRoute.name,
                  path: '',
                  parent: CategoriesRouter.name,
                ),
                _i8.RouteConfig(
                  MealsRoute.name,
                  path: 'meals',
                  parent: CategoriesRouter.name,
                ),
                _i8.RouteConfig(
                  MealDetailRoute.name,
                  path: 'mealdetail',
                  parent: CategoriesRouter.name,
                ),
              ],
            ),
            _i8.RouteConfig(
              FavoritesRouter.name,
              path: 'favorites',
              parent: MasterRouter.name,
              children: [
                _i8.RouteConfig(
                  FavoritesRoute.name,
                  path: '',
                  parent: FavoritesRouter.name,
                )
              ],
            ),
            _i8.RouteConfig(
              BasketRouter.name,
              path: 'basket',
              parent: MasterRouter.name,
              children: [
                _i8.RouteConfig(
                  BasketRoute.name,
                  path: '',
                  parent: BasketRouter.name,
                )
              ],
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.MasterView]
class MasterRouter extends _i8.PageRouteInfo<void> {
  const MasterRouter({List<_i8.PageRouteInfo> children})
      : super(
          MasterRouter.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MasterRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class CategoriesRouter extends _i8.PageRouteInfo<void> {
  const CategoriesRouter({List<_i8.PageRouteInfo> children})
      : super(
          CategoriesRouter.name,
          path: 'categories',
          initialChildren: children,
        );

  static const String name = 'CategoriesRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class FavoritesRouter extends _i8.PageRouteInfo<void> {
  const FavoritesRouter({List<_i8.PageRouteInfo> children})
      : super(
          FavoritesRouter.name,
          path: 'favorites',
          initialChildren: children,
        );

  static const String name = 'FavoritesRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class BasketRouter extends _i8.PageRouteInfo<void> {
  const BasketRouter({List<_i8.PageRouteInfo> children})
      : super(
          BasketRouter.name,
          path: 'basket',
          initialChildren: children,
        );

  static const String name = 'BasketRouter';
}

/// generated route for
/// [_i3.CategoriesView]
class CategoriesRoute extends _i8.PageRouteInfo<void> {
  const CategoriesRoute()
      : super(
          CategoriesRoute.name,
          path: '',
        );

  static const String name = 'CategoriesRoute';
}

/// generated route for
/// [_i4.MealsView]
class MealsRoute extends _i8.PageRouteInfo<void> {
  const MealsRoute()
      : super(
          MealsRoute.name,
          path: 'meals',
        );

  static const String name = 'MealsRoute';
}

/// generated route for
/// [_i5.MealDetailView]
class MealDetailRoute extends _i8.PageRouteInfo<void> {
  const MealDetailRoute()
      : super(
          MealDetailRoute.name,
          path: 'mealdetail',
        );

  static const String name = 'MealDetailRoute';
}

/// generated route for
/// [_i6.FavoritesView]
class FavoritesRoute extends _i8.PageRouteInfo<void> {
  const FavoritesRoute()
      : super(
          FavoritesRoute.name,
          path: '',
        );

  static const String name = 'FavoritesRoute';
}

/// generated route for
/// [_i7.BasketView]
class BasketRoute extends _i8.PageRouteInfo<void> {
  const BasketRoute()
      : super(
          BasketRoute.name,
          path: '',
        );

  static const String name = 'BasketRoute';
}
