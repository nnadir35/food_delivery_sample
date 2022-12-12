import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:food_delivery_test/enum/preference_keys.dart';
import 'package:stacked/stacked.dart';

import 'package:food_delivery_test/manager/locale_storage_manager.dart';

class FavoritesViewModel extends BaseViewModel {
  BuildContext viewBuildContext;
  FavoritesViewModel(BuildContext context) {
    viewBuildContext = context;
  }
  Future<void> init() async {}
}
