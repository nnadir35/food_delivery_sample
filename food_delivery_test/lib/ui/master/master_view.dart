import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_test/route/route.gr.dart';
import 'package:stacked/stacked.dart';

import './master_view_model.dart';

class MasterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MasterViewModel>.reactive(
      viewModelBuilder: () => MasterViewModel(),
      onModelReady: (MasterViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        MasterViewModel model,
        Widget child,
      ) {
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(title: Text("App Delivery")),
              body: AutoTabsScaffold(
                routes: [CategoriesRouter(), FavoritesRouter(), BasketRouter()],
                bottomNavigationBuilder: (context, tabsRouter) =>
                    BottomNavigationBar(
                        currentIndex: tabsRouter.activeIndex,
                        onTap: tabsRouter.setActiveIndex,
                        items: [
                      BottomNavigationBarItem(
                          label: "cat", icon: Icon(Icons.list_alt)),
                      BottomNavigationBarItem(
                          label: "fav", icon: Icon(Icons.favorite)),
                      BottomNavigationBarItem(
                          label: "basket",
                          icon: Icon(Icons.shopping_basket_outlined)),
                    ]),
              )),
        );
      },
    );
  }
}
