import 'package:flutter/material.dart';
import 'package:food_delivery_test/constants/app_constants.dart';
import 'package:food_delivery_test/models/meal_detail_model.dart';
import 'package:food_delivery_test/widgets/meal_list_item.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import './favorites_view_model.dart';
import '../../api/viewmodel/base_categories_view_model.dart';

class FavoritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<SpecifiedMeal> list =
        context.watch<BaseCategoriesViewModel>().getFavoritedMeals;
    return ViewModelBuilder<FavoritesViewModel>.reactive(
      viewModelBuilder: () => FavoritesViewModel(context),
      onModelReady: (FavoritesViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        FavoritesViewModel model,
        Widget child,
      ) {
        return Scaffold(
          body: list.isEmpty
              ? Center(
                  child: Text(AppConstants.emptyList),
                )
              : ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MealListItem(
                      meal: list[index],
                      function: () {
                        model.setSelectedMealName(list[index].strMeal);
                      },
                      buttonOnPress: () => context
                          .read<BaseCategoriesViewModel>()
                          .favoritedmealsToggle(list[index]),
                    );
                  },
                ),
        );
      },
    );
  }
}
