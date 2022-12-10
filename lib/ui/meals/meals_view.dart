import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../route/route.gr.dart';
import './meals_view_model.dart';

class MealsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MealsViewModel>.reactive(
      viewModelBuilder: () => MealsViewModel(),
      onModelReady: (MealsViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        MealsViewModel model,
        Widget child,
      ) {
        return Scaffold(
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'MealsView',
            ),
            ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).navigate(
                      CategoriesRouter(children: [MealDetailRoute()]));
                },
                child: Text("bas"))
          ]),
        );
      },
    );
  }
}
