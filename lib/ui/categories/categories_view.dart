import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_test/constants/string_constant.dart';
import 'package:food_delivery_test/di/locator.dart';
import 'package:food_delivery_test/models/categories_model.dart';
import 'package:food_delivery_test/route/route.gr.dart';
import 'package:food_delivery_test/widgets/loading_widget.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/list_item.dart';
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
            // body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //   Text(
            //     'CategoriesView',
            //   ),
            //   ElevatedButton(
            //       onPressed: () {
            //         // AutoRouter.of(context)
            //         //     .navigate(CategoriesRouter(children: [MealsRoute()]));
            //         model.getCategories();
            //       },
            //       child: Text("bas"))
            // ]),
            body: model.isBusy
                ? LoadingWidget()
                : model.categoryResponse != null
                    ? ListView.builder(
                        itemCount: model.categoryResponse.categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListItem(
                            function: () {
                              log("message");
                            },
                            image: model.categoryResponse.categories[index]
                                .strCategoryThumb,
                            title: model
                                .categoryResponse.categories[index].strCategory,
                            description: model.categoryResponse
                                .categories[index].strCategoryDescription,
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
