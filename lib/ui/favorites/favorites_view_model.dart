import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../route/route.gr.dart';
import '../master/master_view_model.dart';

class FavoritesViewModel extends BaseViewModel {
  BuildContext viewBuildContext;
  FavoritesViewModel(BuildContext context) {
    viewBuildContext = context;
  }
  Future<void> init() async {}

  setSelectedMealName(String mealName) {
    Provider.of<MasterViewModel>(viewBuildContext, listen: false)
        .setSelectedMealName = mealName;

    AutoRouter.of(viewBuildContext)
        .navigate(FavoritesRouter(children: [MealDetailRoute()]));
  }
}
