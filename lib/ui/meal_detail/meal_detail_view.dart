import 'package:flutter/material.dart';
import 'package:food_delivery_test/ui/master/master_view_model.dart';
import 'package:food_delivery_test/widgets/basket_toggle.dart';
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
                                      IconButton(
                                          onPressed: () {
                                            context
                                                .read<MasterViewModel>()
                                                .addBasketToggle(model
                                                    .specifiedmealsResponse);
                                          },
                                          icon: itemBasketButton(context
                                              .watch<MasterViewModel>()
                                              .isInBasket(model
                                                  .specifiedmealsResponse
                                                  .idMeal))),
                                      IconButton(
                                          onPressed: () {
                                            context
                                                .read<MasterViewModel>()
                                                .favoritedmealsToggle(model
                                                    .specifiedmealsResponse);
                                          },
                                          icon: itemFavoriteButton(context
                                              .watch<MasterViewModel>()
                                              .isFavorited(model
                                                  .specifiedmealsResponse
                                                  .idMeal))),
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
