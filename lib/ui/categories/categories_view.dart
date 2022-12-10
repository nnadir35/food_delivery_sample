import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_test/di/locator.dart';
import 'package:food_delivery_test/route/route.gr.dart';
import 'package:stacked/stacked.dart';

import './categories_view_model.dart';

class CategoriesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoriesViewModel>.reactive(
      viewModelBuilder: () => CategoriesViewModel(),
      onModelReady: (CategoriesViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        CategoriesViewModel model,
        Widget child,
      ) {
        return Scaffold(
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'CategoriesView',
            ),
            ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context)
                      .navigate(CategoriesRouter(children: [MealsRoute()]));
                },
                child: Text("bas"))
          ]),
        );
      },
    );
  }
}
