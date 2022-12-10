import 'dart:math';

import 'package:stacked/stacked.dart';

class MasterViewModel extends BaseViewModel {
  Future<void> init() async {}

  List<int> dummy = [];

  addDataToDummyList() {
    dummy.add(Random().nextInt(99));
  }
}
