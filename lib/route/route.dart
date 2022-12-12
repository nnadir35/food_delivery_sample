import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:food_delivery_test/ui/basket/basket_view.dart';
import 'package:food_delivery_test/ui/categories/categories_view.dart';
import 'package:food_delivery_test/ui/favorites/favorites_view.dart';
import 'package:food_delivery_test/ui/master/master_view.dart';

import '../ui/meal_detail/meal_detail_view.dart';
import '../ui/meals/meals_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: "/",
      name: "MasterRouter",
      page: MasterView,
      children: [
        // our BooksRouter has been moved into the children field
        AutoRoute(
          path: "categories",
          name: "CategoriesRouter",
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: CategoriesView, initial: true),
            AutoRoute(path: 'meals', page: MealsView),
            AutoRoute(path: 'mealdetail', page: MealDetailView),
          ],
        ),
        // our AccountRouter has been moved into the children field
        AutoRoute(
          path: "favorites",
          name: "FavoritesRouter",
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: FavoritesView),
            AutoRoute(path: 'mealdetail', page: MealDetailView),
          ],
        ),

        AutoRoute(
          path: "basket",
          name: "BasketRouter",
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: BasketView),
          ],
        ),
      ],
    ),
  ],
)
class $AppRouter {}
