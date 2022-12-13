import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_test/api/viewmodel/base_categories_view_model.dart';
import 'package:food_delivery_test/constants/app_constants.dart';
import 'package:food_delivery_test/route/route.gr.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import './master_view_model.dart';
import '../../api/viewmodel/base_basket_view_model.dart';

class MasterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MasterViewModel>.reactive(
      viewModelBuilder: () => MasterViewModel(context),
      onModelReady: (MasterViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        MasterViewModel model,
        Widget child,
      ) {
        return SafeArea(
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider(
                  create: (BuildContext context) => BaseBasketViewModel()),
              ChangeNotifierProvider(
                  create: (BuildContext context) => BaseCategoriesViewModel()),
            ],
            child: Scaffold(
                appBar: AppBar(title: Text(AppConstants.appBar)),
                body: AutoTabsScaffold(
                  routes: [
                    CategoriesRouter(),
                    FavoritesRouter(),
                    BasketRouter()
                  ],
                  bottomNavigationBuilder: (context, tabsRouter) =>
                      BottomNavigationBar(
                          currentIndex: tabsRouter.activeIndex,
                          onTap: tabsRouter.setActiveIndex,
                          items: [
                        BottomNavigationBarItem(
                            label: AppConstants.categoryBottomBar,
                            icon: Icon(Icons.list_alt)),
                        BottomNavigationBarItem(
                            label: AppConstants.favoritesBottomBar,
                            icon: Icon(Icons.favorite)),
                        BottomNavigationBarItem(
                            label: AppConstants.basketBottomBar,
                            icon: Icon(Icons.shopping_basket_outlined)),
                      ]),
                )),
          ),
        );
      },
    );
  }
}
