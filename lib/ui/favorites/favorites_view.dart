import 'package:flutter/material.dart';
import 'package:food_delivery_test/models/meal_detail_model.dart';
import 'package:food_delivery_test/ui/master/master_view_model.dart';
import 'package:food_delivery_test/widgets/category_list_item.dart';
import 'package:food_delivery_test/widgets/favorite_toggle.dart';
import 'package:food_delivery_test/widgets/meal_list_item.dart';
import 'package:stacked/stacked.dart';
import 'package:provider/provider.dart';
import './favorites_view_model.dart';

class FavoritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<SpecifiedMeal> list =
        context.watch<MasterViewModel>().getFavoritedMeals;
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
          body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  MealListItem(
                    meal: list[index],
                    function: () {},
                  ),
                  IconButton(
                      onPressed: () {
                        context
                            .read<MasterViewModel>()
                            .favoritedmealsToggle(list[index]);
                      },
                      icon: itemFavoriteButton(context
                          .watch<MasterViewModel>()
                          .isFavorited(list[index].idMeal)))
                ],
              );
            },
          ),
        );
      },
    );
  }
}
