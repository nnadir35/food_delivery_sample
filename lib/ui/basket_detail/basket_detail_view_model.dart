import 'dart:developer';

import 'package:flutter/material.dart';
import '../../models/meal_detail_model.dart';
import 'package:stacked/stacked.dart';
import 'package:provider/provider.dart';

import '../../api/viewmodel/base_basket_view_model.dart';
import '../master/master_view_model.dart';

class BasketDetailViewModel extends BaseViewModel {
  BuildContext viewModelContext;
  TextEditingController commentController = TextEditingController();
  BasketDetailViewModel(BuildContext context) {
    viewModelContext = context;
  }
  Future<void> init() async {
    commentController.text = getBasketItem.comment;
  }

  SpecifiedMeal get getBasketItem =>
      Provider.of<MasterViewModel>(viewModelContext, listen: false)
          .selectedBasketItem;

  setItemComment() async {
    await viewModelContext
        .read<BaseBasketViewModel>()
        .insertCommentToItem(getBasketItem, commentController.text);
    notifyListeners();
  }
}
