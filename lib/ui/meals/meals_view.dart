import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_test/ui/master/master_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../constants/string_constant.dart';
import '../../route/route.gr.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/meal_list_item.dart';
import './meals_view_model.dart';
import 'package:provider/provider.dart';

class MealsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MealsViewModel>.reactive(
      viewModelBuilder: () => MealsViewModel(context),
      onModelReady: (MealsViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        MealsViewModel model,
        Widget child,
      ) {
        return Scaffold(
            body: model.isBusy
                ? LoadingWidget()
                : model.mealsResponse != null
                    ? ListView.builder(
                        itemCount: model.mealsResponse.meals.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MealListItem(
                            meal: model.mealsResponse.meals[index],
                            function: () {
                              model.setSelectedMealName(
                                  model.mealsResponse.meals[index].strMeal);
                            },
                          );
                        },
                      )
                    : Center(
                        child: Text(StringConstants.responseError),
                      ));
      },
    );
  }
}
