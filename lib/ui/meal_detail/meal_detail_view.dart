import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_test/ui/master/master_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:provider/provider.dart';
import '../../constants/string_constant.dart';
import '../../route/route.gr.dart';
import '../../widgets/loading_widget.dart';
import './meal_detail_view_model.dart';
import 'package:provider/provider.dart';

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
                                  _addVerticalMargin(context),
                                  Text(StringConstants.defineCategory +
                                      model.specifiedmealsResponse.strCategory),
                                  _addVerticalMargin(context),
                                  Text(StringConstants.defineArea +
                                      model.specifiedmealsResponse.strArea),
                                  _addVerticalMargin(context),
                                  Text(model
                                      .specifiedmealsResponse.strInstructions),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Center(
                        child: Text(StringConstants.responseError),
                      ));
      },
    );
  }

  SizedBox _addVerticalMargin(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.01,
    );
  }
}
