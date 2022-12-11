import 'package:flutter/material.dart';
import 'package:food_delivery_test/constants/app_constants.dart';
import 'package:food_delivery_test/widgets/loading_widget.dart';
import 'package:stacked/stacked.dart';

import './categories_view_model.dart';
import '../../widgets/category_list_item.dart';

class CategoriesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoriesViewModel>.reactive(
      viewModelBuilder: () => CategoriesViewModel(context),
      onModelReady: (CategoriesViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        CategoriesViewModel model,
        Widget child,
      ) {
        return Scaffold(
            body: model.isBusy
                ? LoadingWidget()
                : model.categoryResponse != null
                    ? ListView.builder(
                        itemCount: model.categoryResponse.categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CategoryListItem(
                            function: () {
                              model.setSelectedCategoryName(model
                                  .categoryResponse
                                  .categories[index]
                                  .strCategory);
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
                        child: Text(AppConstants.responseError),
                      ));
      },
    );
  }
}
