import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery_test/constants/app_constants.dart';
import '../../api/viewmodel/base_basket_view_model.dart';
import '../../enum/preference_keys.dart';
import '../../manager/locale_storage_manager.dart';
import '../../models/meal_detail_model.dart';
import '../../widgets/empty_list.dart';
import '../master/master_view_model.dart';
import '../../widgets/basket_list_item.dart';
import 'package:stacked/stacked.dart';
import 'package:provider/provider.dart';
import 'basket_view_model.dart';

class BasketView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<SpecifiedMeal> basketItems =
        context.watch<BaseBasketViewModel>().getBasketItems;
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
          body: basketItems.isEmpty
              ? EmptyList()
              : ListView.builder(
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
