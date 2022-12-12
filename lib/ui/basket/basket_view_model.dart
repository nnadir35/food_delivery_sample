import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_test/models/meal_detail_model.dart';
import 'package:stacked/stacked.dart';
import 'package:provider/provider.dart';

import '../../route/route.gr.dart';
import '../master/master_view_model.dart';

class BasketViewModel extends BaseViewModel {
  BuildContext viewModelContext;
  BasketViewModel(BuildContext context) {
    viewModelContext = context;
  }
  Future<void> init() async {}

  setBasketItem(SpecifiedMeal meal) {
    Provider.of<MasterViewModel>(viewModelContext, listen: false)
        .setSelectedBasketItem = meal;
    AutoRouter.of(viewModelContext)
        .navigate(BasketRouter(children: [BasketDetailRoute()]));
  }
}
