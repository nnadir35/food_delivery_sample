import 'package:flutter/material.dart';
import 'package:food_delivery_test/enum/preference_keys.dart';
import 'package:food_delivery_test/manager/locale_storage_manager.dart';
import 'package:food_delivery_test/models/meal_detail_model.dart';
import 'package:food_delivery_test/ui/master/master_view_model.dart';
import 'package:food_delivery_test/widgets/basket_list_item.dart';
import 'package:stacked/stacked.dart';
import 'package:provider/provider.dart';
import './basket_view_model.dart';

class BasketView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<SpecifiedMeal> basketItems =
        context.watch<MasterViewModel>().getBasketItems;
    return ViewModelBuilder<BasketViewModel>.reactive(
      viewModelBuilder: () => BasketViewModel(context),
      onModelReady: (BasketViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        BasketViewModel model,
        Widget child,
      ) {
        return Scaffold(
          body: ListView.builder(
            itemCount: basketItems.length,
            itemBuilder: (BuildContext buildContext, int index) {
              return BasketListItem(
                function: () {
                  model.setBasketItem(basketItems[index]);
                },
                meal: basketItems[index],
              );
            },
          ),
        );
      },
    );
  }
}
