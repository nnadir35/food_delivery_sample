import 'package:flutter/material.dart';
import '../../api/viewmodel/base_basket_view_model.dart';
import '../../models/meal_detail_model.dart';
import '../master/master_view_model.dart';
import '../../widgets/add_to_favorite_icon_button.dart';
import '../../widgets/basket_toggle.dart';
import '../../widgets/favorite_toggle.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/add_to_basket_icon_button.dart';
import 'meal_detail_view_model.dart';
import '../../api/viewmodel/base_categories_view_model.dart';
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
                                  Text(model.specifiedmealsResponse.strMeal),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Text(AppConstants.defineCategory +
                                      model.specifiedmealsResponse.strCategory),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Text(AppConstants.defineArea +
                                      model.specifiedmealsResponse.strArea),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AddToBasketIconButton(
                                          meal: model.specifiedmealsResponse),
                                      AddToFavoriteIconButton(
                                          function: () => context
                                              .read<BaseCategoriesViewModel>()
                                              .favoritedmealsToggle(
                                                  model.specifiedmealsResponse),
                                          value: model
                                              .specifiedmealsResponse.idMeal),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
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
}
