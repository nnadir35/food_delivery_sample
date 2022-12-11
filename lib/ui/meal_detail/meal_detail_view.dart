import 'package:flutter/material.dart';
import 'package:food_delivery_test/ui/master/master_view_model.dart';
import 'package:food_delivery_test/widgets/favorite_toggle.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import './meal_detail_view_model.dart';
import '../../constants/app_constants.dart';
import '../../widgets/loading_widget.dart';

class MealDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MealDetailViewModel>.reactive(
      viewModelBuilder: () => MealDetailViewModel(context),
      onModelReady: (MealDetailViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        MealDetailViewModel model,
        Widget child,
      ) {
        return Scaffold(
            body: model.isBusy
                ? LoadingWidget()
                : model.specifiedmealsResponse != null
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            Image.network(
                                model.specifiedmealsResponse.strMealThumb),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  _mealName(model),
                                  _addVerticalMargin(context),
                                  _mealCategory(model),
                                  _addVerticalMargin(context),
                                  _mealArea(model),
                                  _addVerticalMargin(context),
                                  IconButton(
                                      onPressed: () {
                                        context
                                            .read<MasterViewModel>()
                                            .favoritedmealsToggle(model
                                                .specifiedmealsResponse.idMeal);
                                      },
                                      icon: itemFavoriteButton(context
                                          .watch<MasterViewModel>()
                                          .isFavorited(model
                                              .specifiedmealsResponse.idMeal))),
                                  _addVerticalMargin(context),
                                  _mealInstructions(model),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Center(
                        child: Text(AppConstants.responseError),
                      ));
      },
    );
  }

  Text _mealInstructions(MealDetailViewModel model) {
    return Text(model.specifiedmealsResponse.strInstructions);
  }

  Text _mealArea(MealDetailViewModel model) {
    return Text(AppConstants.defineArea + model.specifiedmealsResponse.strArea);
  }

  Text _mealCategory(MealDetailViewModel model) {
    return Text(
        AppConstants.defineCategory + model.specifiedmealsResponse.strCategory);
  }

  Text _mealName(MealDetailViewModel model) =>
      Text(model.specifiedmealsResponse.strMeal);

  SizedBox _addVerticalMargin(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.01,
    );
  }
}
