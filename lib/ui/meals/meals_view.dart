import 'package:flutter/material.dart';
import 'package:food_delivery_test/ui/master/master_view_model.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import './meals_view_model.dart';
import '../../constants/app_constants.dart';
import '../../widgets/favorite_toggle.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/meal_list_item.dart';

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
                          return Row(
                            children: [
                              MealListItem(
                                meal: model.mealsResponse.meals[index],
                                function: () {
                                  model.setSelectedMealName(
                                      model.mealsResponse.meals[index].strMeal);
                                },
                              ),
                              IconButton(
                                  onPressed: () {
                                    context
                                        .read<MasterViewModel>()
                                        .favoritedmealsToggle(model
                                            .mealsResponse.meals[index].idMeal);
                                  },
                                  icon: itemFavoriteButton(context
                                      .watch<MasterViewModel>()
                                      .isFavorited(model
                                          .mealsResponse.meals[index].idMeal)))
                            ],
                          );
                        },
                      )
                    : Center(
                        child: Text(AppConstants.responseError),
                      ));
      },
    );
  }
}
