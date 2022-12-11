import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_test/ui/master/master_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../route/route.gr.dart';
import './meal_detail_view_model.dart';
import 'package:provider/provider.dart';

class MealDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MealDetailViewModel>.reactive(
      viewModelBuilder: () => MealDetailViewModel(),
      onModelReady: (MealDetailViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        MealDetailViewModel model,
        Widget child,
      ) {
        return Scaffold(
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'MealDetailView',
            ),
            ElevatedButton(onPressed: () {}, child: Text("add data"))
          ]),
        );
      },
    );
  }
}
